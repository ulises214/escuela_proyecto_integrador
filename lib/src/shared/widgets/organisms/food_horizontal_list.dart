import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../atoms/styled_text.dart';
import '../molecules/food_card.dart';

const _foodCards = [
  FoodCard(
    time: '10-15',
    stars: 3.8,
    image:
        'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2012%2F08%2Fimages-sys-201106-a-umami-burger.jpg',
    title: 'Burger',
    price: '\$25.00',
  ),
  FoodCard(
    time: '14-21',
    stars: 4.2,
    image:
        'https://ii.ct-stc.com/2/logos/empresas/2021/05/03/f9c0cb9794454824b8dc212646012thumbnail.jpg',
    title: 'Sushi',
    price: '\$78.00',
  ),
  FoodCard(
    time: '10-15',
    stars: 3.8,
    image:
        'https://www.thinkusadairy.org/Images/Customer%20Site/C3-Using%20Dairy/C3.3-Foodservice/Pizza-WEb.jpg',
    title: 'Pizza',
    price: '\$25.00',
  ),
];

class FoodHorizontalList extends StatelessWidget {
  final String title;
  final double padding;
  const FoodHorizontalList({
    Key? key,
    required this.title,
    this.padding = kTokenDefaultHorizontalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: StyledText.normal(title),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 250,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(padding),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => _foodCards[index],
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: _foodCards.length,
          ),
        ),
      ],
    );
  }
}
