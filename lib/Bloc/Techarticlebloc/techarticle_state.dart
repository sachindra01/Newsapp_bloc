import 'package:cricketnewsarticle/Data/Model/techarticle_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TechArticleState extends Equatable{}
class TechArticleInitialState extends TechArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class TechArticleLoadingState extends TechArticleState {
  @override
  // TODO: implement props
  List<Object> get props => [];


}
// ignore: must_be_immutable
class TechArticleLoadedState extends TechArticleState {
  List<Article> articles;

  TechArticleLoadedState({@required this.articles});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [articles];



}
// ignore: must_be_immutable
class TechArticleErrorState extends TechArticleState {
  String message;
  TechArticleErrorState({
    @required this.message

});
  @override
  // TODO: implement props
  List<Object> get props => [message];


}