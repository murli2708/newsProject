// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_news_app/models/news_detailed.dart';
import 'package:basic_news_app/models/top_stories.dart';
import 'package:flutter/material.dart';

//Username States

@immutable
abstract class TopNewsState {}

@immutable
abstract class DetailedNewsState {}

class ErrorState extends TopNewsState {
  final String message;
  ErrorState({
    required this.message,
  });
}

class LoadingState extends TopNewsState {}

class HomeState extends TopNewsState {
  final List<Data> data;
  HomeState({required this.data});
}

class DetailedErrorState extends DetailedNewsState {
  final String message;
  DetailedErrorState({
    required this.message,
  });
}

class DetailedLoadingState extends DetailedNewsState {}

class DetailsState extends DetailedNewsState {
  final DetailedNews news;
  DetailsState({required this.news});
}
