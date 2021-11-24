import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../atoms/styled_text.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final double stars;
  final String price;
  final String time;
  final String image;
  const FoodCard({
    Key? key,
    required this.title,
    required this.stars,
    required this.price,
    required this.time,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: _Top(image: image, time: time),
          ),
          Expanded(
            flex: 1,
            child: _Bottom(title: title, stars: stars, price: price),
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final String title;

  final double stars;
  final String price;
  const _Bottom({
    Key? key,
    required this.title,
    required this.stars,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledText.secondary(title, color: kTokenPrimaryColor),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_border, color: kTokenIconColor),
                  StyledText.secondary('$stars'),
                ],
              ),
              StyledText.secondary(price),
            ],
          )
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final String image;

  final String time;
  const _Top({
    Key? key,
    required this.image,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyledText.normal(time),
                  StyledText.secondary('min'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
