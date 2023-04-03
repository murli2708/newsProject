import 'package:basic_news_app/services/utils.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Good morning',
              style: CustomFont(
                'Mulish',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.4,
                color: const Color(0xff94a5aa),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome Readers',
              textAlign: TextAlign.center,
              style: CustomFont(
                'Mulish',
                fontSize: 28,
                fontWeight: FontWeight.w900,
                height: 1.3,
                color: const Color(0xff1a434e),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
