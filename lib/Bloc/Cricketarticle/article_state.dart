
import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitialState extends ArticleState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ArticleLoadedState extends ArticleState {

  List<Articles> articles;

  ArticleLoadedState({@required this.articles});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [articles];
}

// ignore: must_be_immutable
class ArticleErrorState extends ArticleState {

  String message;

  ArticleErrorState({@required this.message});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [message];
}

