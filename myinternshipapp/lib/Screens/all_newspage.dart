// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myinternshipapp/models/article_model.dart';
import 'package:myinternshipapp/models/slider_model.dart';
import 'package:myinternshipapp/services/news.dart';

import '../services/slider_data.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> 
{

  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  void initState() {
    getSliderNews();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      
    });
  }

  // The Slider News
  getSliderNews() async {
    SliderNews slider = SliderNews();
    await slider.getSliderNews();
    sliders = slider.sliders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 247, 169, 97),
        centerTitle: true,
        title: Text
        (
          widget.news+ "NEWS",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.news == "Breaking"? sliders.length : articles.length,
            itemBuilder: (context, index) {
              return AllNewsSection(
                Image: widget.news == "Breaking"? sliders[index].urlToImage! : articles[index].urlToImage!,
                desc: widget.news == "Breaking" ?sliders[index].description! : articles[index].description!,
                title: widget.news == "Breaking"? sliders[index].title! : articles[index].title! ,
                // URL
              );
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image, desc, title;
  AllNewsSection({required this.Image, required this.desc, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 240, 235, 235)
          ),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: Image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                title,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
              ),
              Text(
                desc,
                maxLines: 4,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
