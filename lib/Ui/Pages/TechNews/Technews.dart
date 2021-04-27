import 'package:cricketnewsarticle/Bloc/Techarticlebloc/techarticle_bloc.dart';
import 'package:cricketnewsarticle/Bloc/Techarticlebloc/techarticle_event.dart';
import 'package:cricketnewsarticle/Bloc/Techarticlebloc/techarticle_state.dart';
import 'package:cricketnewsarticle/Data/Model/techarticle_model.dart';
import 'file:///D:/Flutterproject/cricketnewsarticle/lib/Ui/Pages/Widget/Technewscontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Tech_news_article_detailpage.dart';



class AboutPage2 extends StatefulWidget {
  @override
  _AboutPage2State createState() => _AboutPage2State();
}

class _AboutPage2State extends State<AboutPage2> {
  TechArticleBloc techArticleBloc;

  @override
  void initState() {
    super.initState();
    techArticleBloc = BlocProvider.of<TechArticleBloc>(context);
    techArticleBloc.add(FetchTechArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar:AppBar(
                title: Center(child: Text('Tech')),


                actions: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      techArticleBloc.add(FetchTechArticleEvent());
                    },
                  ),

                ],
              ),
              body: Container(
                child: BlocListener<TechArticleBloc, TechArticleState>(
                  listener: (context, state) {
                    if (state is TechArticleErrorState) {
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<TechArticleBloc, TechArticleState>(

                    // ignore: missing_return
                    builder: (context, state) {

                      if (state is TechArticleInitialState) {
                        return buildLoading();
                      } else if (state is TechArticleLoadingState) {
                        return buildLoading();
                      } else if (state is TechArticleLoadedState) {
                        return buildArticleList(state.articles);
                      } else if (state is TechArticleErrorState) {
                        return buildErrorUi(state.message);
                      }

                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx, pos) {
        return TechnewsContainer(
          description: articles[pos].description,
          urlToImage:  articles[pos].urlToImage,
          title: articles[pos].title,
            author: articles[pos].author,
            url : articles[pos].url,



            onTap: () {
              navigateToTechArticleDetailPage(context, articles[pos]);

            },

        );
      },
    );
  }
  void navigateToTechArticleDetailPage(BuildContext context, Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TechDetailPage(
        article: article,
      );
    }));
  }

}
