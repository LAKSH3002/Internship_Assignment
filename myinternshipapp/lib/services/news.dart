import 'dart:convert';

// Updates the page with all the trending news
// Using News api key (API of all news in one go)

import 'package:myinternshipapp/models/article_model.dart';
import 'package:http/http.dart' as http;

/*
Class name - News
Model name - ArticleModel
function name - getNews
List name - articles
instance name - newsclass
url - api of all the news
 */
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cecdd8569af1429c8e1861a012f575eb";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              author: element['author']);
          news.add(articleModel);
        }
      });
    }
  }
}

// cecdd8569af1429c8e1861a012f575eb