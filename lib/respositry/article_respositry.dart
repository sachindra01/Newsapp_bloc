
import 'package:cricketnewsarticle/Data/Model/modeldata.dart';
import 'package:cricketnewsarticle/resources/string.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {

  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse(AppStrings.cricArticleUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }

}