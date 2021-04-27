import 'package:cricketnewsarticle/Bloc/Cricketarticle/article_bloc.dart';
import 'package:cricketnewsarticle/Bloc/Cricketarticle/article_events.dart';
import 'package:cricketnewsarticle/Bloc/Cricketarticle/article_state.dart';
import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:cricketnewsarticle/Ui/Pages/Widget/cricketnews_container.dart';
import 'file:///D:/Flutterproject/cricketnewsarticle/lib/Ui/Pages/CricketNews/Cricket_news_articledetail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(FetchArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Builder(
        builder: (context) {
      return Material(
        child: Scaffold(
          appBar:AppBar(
            title: Center(child: Text('Cricket')),


            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  articleBloc.add(FetchArticlesEvent());

                },
              ),

            ],
          ),
          body: Container(
            child: BlocListener<ArticleBloc, ArticleState>(
              listener: (context, state) {
                if (state is ArticleErrorState) {
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: BlocBuilder<ArticleBloc, ArticleState>(
                // ignore: missing_return
                builder: (context, state) {

                  if (state is ArticleInitialState) {
                    return buildLoading();
                  } else if (state is ArticleLoadingState) {
                    return buildLoading();
                  } else if (state is ArticleLoadedState) {
                    return buildArticleList(state.articles);
                  } else if (state is ArticleErrorState) {
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

  Widget buildArticleList(List<Articles> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx, pos) {
        return CricnewsContainer(
          description: articles[pos].description,
          urlToImage:  articles[pos].urlToImage,
          title: articles[pos].title,
          author: articles[pos].author,
          url : articles[pos].url,



          onTap: () {
            navigateToArticleDetailPage(context, articles[pos]);

          },

        );
      },
    );
  }


  void navigateToArticleDetailPage(BuildContext context, Articles article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticleDetailPage(
        article: article,
      );
    }));
  }

}
