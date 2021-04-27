import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:cricketnewsarticle/respositry/article_respositry.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

import 'article_events.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  ArticleRepositoryImpl articleRepository;



  ArticleBloc({@required this.articleRepository}) : super(null) ;

  // ignore: todo
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();



  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = (await articleRepository.getArticles()) ;
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}