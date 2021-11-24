import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../atoms/styled_text.dart';

const _items = [
  _Item(name: 'Popular', emoji: '🔥'),
  _Item(name: 'Comida rápida', emoji: '🍟'),
  _Item(name: 'Vegana', emoji: '🥬'),
];

class CategoriesList extends StatelessWidget {
  final double padding;
  const CategoriesList({
    Key? key,
    this.padding = kTokenDefaultHorizontalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: StyledText.normal('Categorias'),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 90,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(padding),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => _items[index],
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: _items.length,
          ),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String emoji;
  final String name;
  const _Item({
    Key? key,
    required this.emoji,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          StyledText.normal(emoji),
          const SizedBox(width: 10),
          StyledText.secondary(name),
        ],
      ),
    );
  }
}
