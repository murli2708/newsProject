import 'package:basic_news_app/constants/appColors.dart';
import 'package:basic_news_app/providers/news_states.dart';
import 'package:basic_news_app/services/utils.dart';
import 'package:flutter/material.dart';

class DetailsHeaderWidget extends StatelessWidget {
  const DetailsHeaderWidget({
    super.key,
    this.onTap,
    required this.state,
  });

  final Function()? onTap;
  final DetailsState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 100),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffbdbdbd),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            state.news.imageUrl,
          ),
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 0.2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.news.title,
                          style: CustomFont(
                            'Mulish',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Text(
                          state.news.source,
                          style: CustomFont(
                            'Mulish',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
