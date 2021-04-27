import 'file:///D:/Flutterproject/cricketnewsarticle/lib/Ui/Pages/MainScreen/Mainpage.dart';
import 'package:cricketnewsarticle/respositry/article_respositry.dart';
import 'package:cricketnewsarticle/respositry/techarticle_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'Bloc/Cricketarticle/article_bloc.dart';
import 'Bloc/Techarticlebloc/techarticle_bloc.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket',
      home: Builder(
        builder: (context)=>
         MultiBlocProvider(
          child: MainScreen(),
          providers: [
            BlocProvider<ArticleBloc>(create:
                (BuildContext context) {
              return ArticleBloc(articleRepository: ArticleRepositoryImpl());
    }



                ),


            BlocProvider<TechArticleBloc>(create:( BuildContext context) => TechArticleBloc(techArticleRepository: TechArticleRepositoryImpl()) ,
            ),
          ],


        ),
      ),
    );
  }
}