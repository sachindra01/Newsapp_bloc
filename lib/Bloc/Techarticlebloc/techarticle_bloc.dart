import 'package:cricketnewsarticle/Bloc/Techarticlebloc/techarticle_event.dart';
import 'package:cricketnewsarticle/Bloc/Techarticlebloc/techarticle_state.dart';
import 'package:cricketnewsarticle/Data/Model/techarticle_model.dart';
import 'package:cricketnewsarticle/respositry/techarticle_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechArticleBloc extends Bloc<TechArticleEvent, TechArticleState> {

  TechArticleRepository techArticleRepository;

  TechArticleBloc({@required this.techArticleRepository }) : super(null) ;

  // ignore: todo
  // TODO: implement initialState
  TechArticleState get initialState => TechArticleInitialState();


  @override
  Stream<TechArticleState> mapEventToState(TechArticleEvent event) async* {
    if (event is FetchTechArticleEvent) {
      yield TechArticleLoadingState();
      try {
        List<Article> articles = (await techArticleRepository.getArticle()) ;
        yield TechArticleLoadedState(articles: articles);
      } catch (e) {
        yield TechArticleErrorState(message: e.toString());
      }
    }
  }

}