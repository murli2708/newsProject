// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:basic_news_app/models/top_stories.dart';
import 'package:basic_news_app/services/utils.dart';

class TopWidget extends StatelessWidget {
  Data data;
  TopWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xffbdbdbd),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            data.imageUrl,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              data.description,
              style: CustomFont(
                'Mulish',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: Colors.orange[600],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.source,
                  style: CustomFont(
                    'Mulish',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
