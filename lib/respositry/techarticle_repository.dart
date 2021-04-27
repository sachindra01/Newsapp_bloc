import 'package:cricketnewsarticle/Data/Model/techarticle_model.dart';
import 'package:cricketnewsarticle/resources/string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



abstract class TechArticleRepository {
  Future<List<Article>> getArticle();
}

class TechArticleRepositoryImpl implements TechArticleRepository {

  @override
  Future<List<Article>> getArticle() async {
    var response = await http.get(Uri.parse(AppStrings2.techArticleUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Article> articles = Newsheadline.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }
}