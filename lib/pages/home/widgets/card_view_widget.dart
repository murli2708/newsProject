import 'package:basic_news_app/services/utils.dart';
import 'package:flutter/material.dart';

class CardViewWidget extends StatelessWidget {
  const CardViewWidget({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    this.onTap,
  });

  final String image;
  final String title;
  final String author;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xffbdbdbd),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomFont(
                      'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      color: const Color(0xff1a434e),
                    ),
                  ),
                  const SizedBox(
                    height: 0.005,
                  ),
                  RichText(
                    text: TextSpan(
                      style: CustomFont(
                        'Mulish',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        color: const Color(0xff95a6aa),
                      ),
                      children: [
                        const TextSpan(
                          text: 'By ',
                        ),
                        TextSpan(
                          text: author,
                          style: CustomFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: const Color(0xff1a434e),
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
