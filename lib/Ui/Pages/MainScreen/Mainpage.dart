

import 'file:///D:/Flutterproject/cricketnewsarticle/lib/Ui/Pages/TechNews/Technews.dart';
import 'file:///D:/Flutterproject/cricketnewsarticle/lib/Ui/Pages/CricketNews/CricketNews.dart';

import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: new Material(
        color: Colors.yellow,
        child: DefaultTabController(
          length: 2,
          child: new Scaffold(

            body: Builder(
              builder: (context) =>
               TabBarView(
                children: [
                  HomePage( ),
                  AboutPage2(),




                ],
              ),
            ),
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(
                  child: Text('CricketNews',

                    style: TextStyle(fontSize: 11.0),
                  ),
                  icon: new Icon(Icons.article),
                ),
                Tab(
                  child: Text('TechNews',

                    style: TextStyle(fontSize: 11.0),
                  ),
                  icon: new Icon(Icons.article),
                ),



              ],
              labelColor: Colors.green,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}