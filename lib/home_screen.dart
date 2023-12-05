import 'package:flutter/material.dart';
import 'MovieDetailsScreen.dart';
import 'HistoryScreen.dart';
import 'ProfileScreen.dart';
import 'movieratings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<MovieRating> movieRatings = [
    MovieRating(
      imagePath: 'assets/jujutsu_kaisen.jpg',
      title: 'Jujutsu Kaisen 0',
      synopsis: 'Sinopse de Jujutsu Kaisen 0...',
      rating: 5,
    ),
    MovieRating(
      imagePath: 'assets/OpenHeimer.jpg',
      title: 'Open Heimer',
      synopsis: 'Sinopse do Open Heimer...',
      rating: 4,
    ),
    MovieRating(
      imagePath: 'assets/Gato de Botas.jpg',
      title: 'Gato de Botas',
      synopsis: 'Sinopse do Gato de Botas...',
      rating: 3,
    ),
    MovieRating(
      imagePath: 'assets/The_Maze_Runner.jpg',
      title: 'The Maze Runner',
      synopsis: 'Sinopse do The Maze Runner...',
      rating: 4,
    ),
    MovieRating(
      imagePath: 'assets/The_Purge.jpg',
      title: 'The Purge',
      synopsis: 'Sinopse do The Purge...',
      rating: 5,
    ),
    MovieRating(
      imagePath: 'assets/Cidade de Deus.jpg',
      title: 'Cidade de Deus',
      synopsis: 'Sinopse da Cidade de Deus...',
      rating: 5,
    ),
    MovieRating(
      imagePath: 'assets/Freira.jpg',
      title: 'Freira',
      synopsis: 'Sinopse do Freira...',
      rating: 3,
    ),
    MovieRating(
      imagePath: 'assets/The_Jester.jpg',
      title: 'The Jester',
      synopsis: 'Sinopse do The Jester...',
      rating: 4,
    ),
    MovieRating(
      imagePath: 'assets/corra.jpg',
      title: 'Corra!',
      synopsis: 'Sinopse do Corra!...',
      rating: 5,
    ),
    // Adicionar mais filmes se eu sentir que preciso
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EUPHO'),
        backgroundColor: Colors.blue[900],  // Cor azul escuro
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              _navigateToHistory(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _navigateToProfile(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeaturedMovieCard(
              imagePath: 'assets/jujutsu_kaisen.jpg',
              color: Colors.red,
              onTap: () {
                _navigateToMovieDetails(
                  context,
                  'assets/jujutsu_kaisen.jpg',
                  'Jujutsu Kaisen 0',
                  'Jujutsu Kaisen 0 é um filme de animação baseado no manga Jujutsu Kaisen. '
                  'Ele explora eventos anteriores à série principal, introduzindo personagens '
                  'e expandindo o mundo do Jujutsu Kaisen.',
                );
              },
            ),
            SectionTitle(title: 'Mais Populares', color: Colors.blue),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MovieCard(
                    imagePath: 'assets/OpenHeimer.jpg',
                    color: Colors.green,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/OpenHeimer.jpg',
                        'Open Heimer',
                        'Ambientado na Segunda Guerra Mundial, o longa acompanha a vida de J. Robert Oppenheimer (Cillian Murphy), físico teórico da Universidade da Califórnia e diretor do Laboratório de Los Alamos durante o Projeto Manhattan - que tinha a missão de projetar e construir as primeiras bombas atômicas.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/Gato de Botas.jpg',
                    color: Colors.yellow,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/Gato de Botas.jpg',
                        'Gato de Botas',
                        'O conto Francês narra a história de um caçula de três irmãos que recebe como herança de seu pai um gato de estimação. Depois de ganhar um par de botas, o gato consegue convencer um rei muito poderoso de que pertence a um fidalgo chamado Marquês de Carabás, e consegue ao seu dono a mão da princesa em casamento.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/The_Maze_Runner.jpg',
                    color: Colors.orange,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/The_Maze_Runner.jpg',
                        'The Maze Runner',
                        'Em um mundo pós-apocalíptico, o jovem Thomas é abandonado em uma comunidade isolada formada por garotos após toda sua memória ter sido apagada. Logo ele se vê preso em um labirinto, onde será preciso unir forças com outros jovens para que consiga escapar.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/The_Purge.jpg',
                    color: Colors.purple,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/The_Purge.jpg',
                        'The Purge',
                        'Quando o governo norte-americano constata que suas prisões estão cheias demais para receberem novos detentos, uma nova lei é criada, permitindo todas as atividades ilegais durante 12 horas. Este período, chamado de Noite do Crime.',
                      );
                    },
                  ),
                ],
              ),
            ),
            SectionTitle(title: 'Recomendados', color: Colors.teal),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MovieCard(
                    imagePath: 'assets/Cidade de Deus.jpg',
                    color: Colors.cyan,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/Cidade de Deus.jpg',
                        'Cidade de Deus',
                        'Na Cidade de Deus, a vida é difícil e perigosa, entre o crime organizado e a violência policial. O filme, narrado por Buscapé, conta as histórias trágicas de vários habitantes da comunidade, seguindo também os esforços do protagonista para realizar seu sonho: ser fotógrafo.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/Freira.jpg',
                    color: Colors.pink,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/Freira.jpg',
                        'Freira',
                        'Fazendo parte da franquia Invocação do Mal, em A Freira, após uma irmã cometer suicídio em um convento na Romênia, o Vaticano envia um padre atormentado e uma noviça para investigar o ocorrido. Arriscando suas vidas, a fé e até suas almas.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/The_Jester.jpg',
                    color: Colors.amber,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/The_Jester.jpg',
                        'The Jester',
                        'Um ser malévolo conhecido como The Jester aterroriza os habitantes de uma pequena cidade na noite de Halloween, incluindo duas irmãs distantes que devem se unir para encontrar uma maneira de derrotar esta entidade maligna.',
                      );
                    },
                  ),
                  MovieCard(
                    imagePath: 'assets/corra.jpg',
                    color: Colors.indigo,
                    onTap: () {
                      _navigateToMovieDetails(
                        context,
                        'assets/corra.jpg',
                        'Corra!',
                        'Trata-se da narrativa dos fatos ocorridos com Chris, um fotógrafo bem sucedido, que viaja com sua namorada, Rose  a fim de conhecer seus pais.'
                        'que viaja com sua namorada, Rose  a fim de conhecer seus pais.',
                      );
                    },
                  ),
                ],
              ),
            ),
            // Adicionar mais categorias e filmes se eu quiser
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            _navigateToHistory(context);
          } else if (index == 3) {
            _navigateToProfile(context);
          }
        },
      ),
    );
  }

  void _navigateToMovieDetails(BuildContext context, String imagePath, String title, String synopsis) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(
          imagePath: imagePath,
          title: title,
          synopsis: synopsis,
        ),
      ),
    );
  }

  void _navigateToHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryScreen(movieRatings: movieRatings, movieRating: [],),
      ),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          userName: 'Seu Nome',
          userEmail: 'seu.email@example.com',
          numberOfRatings: movieRatings.length,
          profileImageUrl: 'assets/bleachcat.jpg',
        ),
      ),
    );
  }
}

class FeaturedMovieCard extends StatelessWidget {
  final String imagePath;
  final Color color;
  final VoidCallback onTap;

  const FeaturedMovieCard({required this.imagePath, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.white),
          ),
          height: 200.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imagePath;
  final Color color;
  final VoidCallback onTap;

  const MovieCard({required this.imagePath, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.white),
          ),
          height: 150.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;

  const SectionTitle({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MovieRating {
  final String imagePath;
  final String title;
  final String synopsis;
  final int rating;

  const MovieRating({
    required this.imagePath,
    required this.title,
    required this.synopsis,
    required this.rating,
  });
}
