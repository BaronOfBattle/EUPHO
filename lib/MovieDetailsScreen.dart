import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String synopsis;

  const MovieDetailsScreen({
    required this.imagePath,
    required this.title,
    required this.synopsis,
  });

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int rating = 0;
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      rating = prefs.getInt('${widget.title}_rating') ?? 0;
      comments = prefs.getStringList('${widget.title}_comments') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white), // Cor do texto do AppBar
        ),
        backgroundColor: Colors.blue[900], // Cor de fundo do AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.imagePath,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sinopse:\n${widget.synopsis}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Avaliação:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(width: 16.0),
                  _buildRatingStars(),
                ],
              ),
            ),
            _buildCommentsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: List.generate(
        5,
        (index) => IconButton(
          onPressed: () {
            _saveRating(index + 1);
          },
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            size: 30.0,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Comentários',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          _buildCommentsList(),
          SizedBox(height: 16.0),
          _buildCommentInput(),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitComment,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[900], // Cor de fundo do botão
              onPrimary: Colors.white, // Cor do texto do botão
            ),
            child: Text('Enviar Comentário'),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return Column(
      children: comments.map((comment) => _buildCommentItem(comment)).toList(),
    );
  }

  Widget _buildCommentItem(String comment) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          comment,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: commentController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: 'Adicione um comentário',
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          filled: true,
          fillColor: Colors.black,
        ),
      ),
    );
  }

  void _submitComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        comments.add(commentController.text);
        commentController.clear();
        _saveComments();
      });
    }
  }

  Future<void> _saveRating(int value) async {
    setState(() {
      rating = value;
    });

    await prefs.setInt('${widget.title}_rating', value);
  }

  Future<void> _saveComments() async {
    await prefs.setStringList('${widget.title}_comments', comments);
  }
}
