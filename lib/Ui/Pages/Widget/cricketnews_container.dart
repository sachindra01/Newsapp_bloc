import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:cricketnewsarticle/Data/Model/techarticle_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CricnewsContainer extends StatefulWidget {


  CricnewsContainer({
    Key key,
    @required this.title,
    @required this.author,
    @required this .url,




    @required this.description,
    @required this.onTap,
    @required this.urlToImage,
  }) : super(key: key);
  String urlToImage, title,author, url, description;



  Function onTap;

  @override
  _CricnewsContainerState createState() => _CricnewsContainerState();
}

class _CricnewsContainerState extends State<CricnewsContainer> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "${widget.urlToImage}",
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.title}",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(fontSizeFactor: 0.70),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.article,
                            color: Colors.red,
                            size: 10.0,
                          ),
                          Text(
                            "${widget.author}",
                            style: Theme.of(context).textTheme.subtitle.apply(
                                color: Colors.grey, fontSizeFactor: 0.70),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              "${widget.description}",
              style:
              Theme.of(context).textTheme.body1.apply(color: Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                Icon(
                  Icons.source,
                  color: Colors.green,
                  size: 15.0,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "${widget.url}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8.0
                    ),


                  ),
                ),
              ],
            ),
            SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}