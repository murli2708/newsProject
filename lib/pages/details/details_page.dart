import 'dart:async';

import 'package:basic_news_app/constants/appColors.dart';
import 'package:basic_news_app/pages/details/widgets/details_header_widget.dart';
import 'package:basic_news_app/providers/news_states.dart';
import 'package:basic_news_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '../../providers/news_provider.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    DetailedNewsState state = ref.watch(detailedNewsProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backGroundColor,
          title: const Text(
            "Detailed Page",
            style: TextStyle(color: Colors.black54),
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios))),
      backgroundColor: AppColors.backGroundColor,
      body: DetailedStates(context, state),
    );
  }

  Widget DetailedStates(BuildContext context, DetailedNewsState state) {
    if (state is DetailedErrorState) {
      return Center(
        child: Text(state.message),
      );
    }
    if (state is DetailsState) {
      return DetailedNews(context, state);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget DetailedNews(BuildContext context, DetailsState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsHeaderWidget(
            onTap: () {
              context.pop();
            },
            state: state,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Description',
              style: CustomFont(
                'Mulish',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.4,
                color: const Color(0xff94a5aa),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Text(
              state.news.description,
              style: CustomFont(
                'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.8,
                color: const Color(0xff95a6aa),
              ),
            ),
          ),
          WebViewX(
              initialContent: state.news.url,
              width: double.infinity,
              height: MediaQuery.of(context).size.height)
        ],
      ),
    );
  }
}
