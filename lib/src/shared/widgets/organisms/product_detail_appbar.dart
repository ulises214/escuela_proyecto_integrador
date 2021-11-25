import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../molecules/back_button.dart';

class ProductDetailAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const ProductDetailAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  State<ProductDetailAppBar> createState() => _ProductDetailAppBarState();
}

class _ProductDetailAppBarState extends State<ProductDetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CustomBackButton(name: 'Inicio'),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: kTokenIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
