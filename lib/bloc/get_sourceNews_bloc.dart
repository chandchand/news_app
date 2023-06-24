import 'package:flutter/material.dart';
import 'package:news_app/models/article_response.dart';
import 'package:news_app/repository/respository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourcesNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getSourcesNews(String sourceId) async {
    ArticleResponse response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  // void drainStream() { _subject.value = null;}

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getSourcesNewsBloc = GetSourcesNewsBloc();
