 import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';



// ignore: must_be_immutable
class ArticleDetailPage extends StatelessWidget {
  Articles article;


  ArticleDetailPage({this.article});

  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM - HH:mm');
    return Scaffold(
      backgroundColor: Color(0Xff1c1c1c),
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            // Provide a standard title.


            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: Stack(
              children: [
                Container(
                  child: Image(
                    image: NetworkImage(article.urlToImage
                    ),
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFFFF).withOpacity(0),
                        Color(0xFF1E2424).withOpacity(0.43),
                        Color(0xFF1E2424).withOpacity(1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    color: Color(0xff1c1c1c),
                    height: 39,
                    width: 153,
                    child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.article,
                                  size: 12,
                                  color: Color(0xffFF8F0E),
                                ),
                                Text(
                                  'By:',
                                  style: TextStyle(
                                      color: Color(0xffFF8F0E), fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 12,
                                  color: Color(0xffFF8F0E),
                                ),
                                Text(
                                  article.publishedAt,
                                  style: TextStyle(
                                      color: Color(0xffFF8F0E), fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                )
              ],
            ),

            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 300,
          ),
          // Next, create a SliverList
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 24.0, 37, 0.0),
                  child: Container(
                      child: Column(
                        children: [
                          Text(article.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xffFF8F0E),
                                fontSize: 20
                            ),),
                          SizedBox(
                            height: 20,

                          ),
                          Text(article.description,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20
                            ),),

                          // ignore: deprecated_member_use

                          new Center(
                            // ignore: deprecated_member_use
                            child: new RaisedButton(
                              color: Color(0xffFF8F0E),
                              onPressed: () => openBrowserTab(),
                              child: new Text(
                                'Read Full Story', style: TextStyle(
                                  color: Colors.black
                              ),),
                            ),
                          ),

                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Future _onOpen(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _open() {
    return
      Linkify(

        onOpen: _onOpen,
        text: article.url,
      );
  }

  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: article.url,);
  }
}