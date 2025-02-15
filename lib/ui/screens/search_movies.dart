import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/componets/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {


   SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  final TextEditingController textControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(textControler.text), builder: (context, snapshot) {
        
          if (snapshot.hasData) {
            return CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Image.asset(
              "assets/movie.png",
              height: 80,
              width: 80,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                "Filmes populares",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: TextField(
                controller: textControler,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus(); 
                  setState(() {
                    
                  });


                },
                decoration: InputDecoration(
                  hintText: "Pesquisar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: MovieCard(movie:  viewmodel.movieList[index]),
            ),
            itemCount: viewmodel.movieList.length,
          ),
        ],
      );
      }else{

         return Center(child: CircularProgressIndicator(),);

      }
      },
    );
  }
}