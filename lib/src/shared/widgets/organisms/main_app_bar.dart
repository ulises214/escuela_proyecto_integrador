import 'package:flutter/material.dart';

import '../atoms/mock_avatar.dart';
import '../molecules/custom_pup_up_menu.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight * 2);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RouteSelectorPopUp(
              onTap: (i) {},
              routes: const ['Pito1', 'Pito2'],
              currentRoute: 'Home',
            ),
            const MockAvatar(
              size: kToolbarHeight,
            ),
          ],
        ),
      ),
    );
  }
}
