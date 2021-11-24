import 'package:flutter/material.dart';

import '../shared/theme/theme.dart';
import '../shared/widgets/atoms/styled_text.dart';
import '../shared/widgets/molecules/main_fab.dart';
import '../shared/widgets/molecules/search_input.dart';
import '../shared/widgets/organisms/categories_list.dart';
import '../shared/widgets/organisms/food_horizontal_list.dart';
import '../shared/widgets/organisms/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MainFab(
        icon: Icons.shopping_bag_outlined,
        onPressed: () => {},
      ),
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ListItem(
              paddingVertical: 0.0,
              child: Row(
                children: [
                  StyledText.secondary(
                    'Hola, Nuria!',
                  ),
                  Text('👋')
                ],
              ),
            ),
            _ListItem(
              paddingVertical: 0.0,
              child: StyledText.pageTitle(
                'Vamos a comer',
              ),
            ),
            const _ListItem(
              paddingVertical: 24.0,
              child: SearchInput(),
            ),
            const _ListItem(
              paddingHorizontal: 0,
              child: CategoriesList(),
            ),
            const _ListItem(
              paddingHorizontal: 0,
              child: FoodHorizontalList(title: 'Para ti'),
            ),
            const _ListItem(
              paddingHorizontal: 0,
              child: FoodHorizontalList(title: 'Nuevos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Widget child;
  const _ListItem({
    Key? key,
    this.paddingHorizontal,
    this.paddingVertical,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? kTokenDefaultHorizontalPadding,
        vertical: paddingVertical ?? 8.0,
      ),
      child: child,
    );
  }
}
