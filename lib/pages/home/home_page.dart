import 'package:basic_news_app/constants/appColors.dart';
import 'package:basic_news_app/providers/news_provider.dart';
import 'package:basic_news_app/providers/news_states.dart';
import 'package:basic_news_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widgets/card_view_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/top_slider_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(newsProvider.notifier).getTopNews();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    TopNewsState newsState = ref.watch(newsProvider);

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: AllState(newsState, ref),
    );
  }

  Widget AllState(TopNewsState state, ref) {
    if (state is ErrorState) {
      return Center(
        child: Text(state.message),
      );
    }
    if (state is HomeState) {
      return News(state, ref);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget News(HomeState state, WidgetRef ref) {
    String uuid = ref.watch(uuidProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 45, 24, 0),
        child: Column(
          children: [
            const HomeHeaderWidget(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                if (uuid == "") {
                  ref.read(uuidProvider.notifier).state = state.data[2].uuid;
                  ref
                      .read(detailedNewsProvider.notifier)
                      .getDetailedNews(state.data[2].uuid);
                } else {
                  ref.read(uuidProvider.notifier).state = state.data
                      .firstWhere(
                        (element) => element.uuid == uuid,
                        orElse: () => state.data[2],
                      )
                      .uuid;
                  ref
                      .read(detailedNewsProvider.notifier)
                      .getDetailedNews(state.data
                          .firstWhere(
                            (element) => element.uuid == uuid,
                            orElse: () => state.data[2],
                          )
                          .uuid);
                }

                context.push('/details');
              },
              child: TopWidget(
                data: uuid == ""
                    ? state.data[2]
                    : state.data.firstWhere(
                        (element) => element.uuid == uuid,
                        orElse: () => state.data[2],
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover Hotest\nNews',
                  textAlign: TextAlign.start,
                  style: CustomFont(
                    'Mulish',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: const Color(0xff1a434e),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 0.02,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardViewWidget(
                  image: state.data[index].imageUrl,
                  title: state.data[index].description,
                  author: state.data[index].source,
                  onTap: () {
                    ref.read(uuidProvider.notifier).state =
                        state.data[index].uuid;
                    ref
                        .read(detailedNewsProvider.notifier)
                        .getDetailedNews(state.data[index].uuid);
                    context.push('/details');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
