import 'package:flutter/material.dart';

import '../shared/theme/theme.dart';
import '../shared/widgets/atoms/styled_text.dart';
import '../shared/widgets/organisms/product_detail_appbar.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 350,
            child: _Top(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StyledText.pageTitle('Rollo de salmón'),
                  StyledText.secondary(
                    'Occaecat nostrud veniam ea excepteur '
                    'dolore laborum elit qui qui quis sunt laborum.'
                    'Occaecat nostrud veniam ea excepteur '
                    'dolore laborum elit qui qui quis sunt laborum.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const _Bottom()
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.vertical(
      top: Radius.circular(40.0),
    );
    return Container(
      decoration: const BoxDecoration(
        borderRadius: radius,
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyledText.secondary('Precio total'),
                      StyledText.normal('\$286'),
                    ],
                  ),
                  const _ItemCount(),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: radius,
              gradient: kTokenMainGradient,
            ),
            child: Center(
              child: StyledText.normal(
                'Añadir al carrito',
                color: Colors.white,
                bold: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCount extends StatelessWidget {
  const _ItemCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: kColorFawnLight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StyledText.normal('-', color: kTokenOffTextColor),
          const SizedBox(width: 10),
          StyledText.normal('6', color: kTokenPrimaryColor),
          const SizedBox(width: 10),
          StyledText.normal('+', color: kTokenPrimaryColor),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom:
              Radius.elliptical(MediaQuery.of(context).size.width / 2, 40.0),
        ),
        gradient: kTokenPageGradient,
      ),
      child: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/sushi.png',
                ),
              ),
              Positioned(
                bottom: -20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    '🍚🍳🥓🌶️',
                    style: TextStyle(fontSize: 25, letterSpacing: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
