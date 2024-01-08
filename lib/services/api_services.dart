import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_headline_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=d52b4b409d8141709775b7e21cfe6ab1";

  Future<List<Articles>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the article");
    }
  }
}
