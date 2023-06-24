import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/get_topHealine_bloc.dart';
import 'package:news_app/elements/error_element.dart';
import 'package:news_app/elements/loader_element.dart';
import 'package:news_app/models/arcticle_model.dart';
import 'package:news_app/models/article_response.dart';

class HeadlineSlider extends StatefulWidget {
  const HeadlineSlider({super.key});

  @override
  State<HeadlineSlider> createState() => _HeadlineSliderState();
}

class _HeadlineSliderState extends State<HeadlineSlider> {
  @override
  void initState() {
    super.initState();
    getTopHeadlinesBloc..getHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
        stream: getTopHeadlinesBloc.subject.stream,
        builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return buildErrorWidget(snapshot.data.error);
            }
            return _buildHeadlineSlider(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.error);
          } else {
            return buildLoadingWidget();
          }
        });
  }

  Widget _buildHeadlineSlider(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;
    return Container(
      child: CarouselSlider(
          items: getExpenseSliders(articles),
          options: CarouselOptions(
              enlargeCenterPage: false, height: 200.0, viewportFraction: 0.9)),
    );
  }

  getExpenseSliders(List<ArticleModel> articles) {
    return articles.map((articles) => GestureDetector(
          onTap: () {},
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: articles.img == null
                            ? const AssetImage("assets/img/placeholder.jpg")
                            : NetworkImage(articles.img))),
              )
            ]),
          ),
        ));
  }
}
