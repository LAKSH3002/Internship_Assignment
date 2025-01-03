import 'dart:convert';

// Updates the page with all the trending news
// Using News api key (API of all news in one go)

import 'package:http/http.dart' as http;
import 'package:myinternshipapp/models/slider_model.dart';

/*
class name - sliderNews
model name - sliderModel
List name - sliders
function name - getSliderNews()
instance name - slider
url - api of top news from tech crunch
 */
class SliderNews 
{
  List<SliderModel> sliders = [];

  Future<void> getSliderNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=cecdd8569af1429c8e1861a012f575eb";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
              title: element["title"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              author: element['author']);
          sliders.add(sliderModel);
        }
      });
    }
  }
}
// cecdd8569af1429c8e1861a012f575eb