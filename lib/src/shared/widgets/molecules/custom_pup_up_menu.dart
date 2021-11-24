import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../atoms/styled_text.dart';
import 'styles_icon_button.dart';

class RouteSelectorPopUp extends StatelessWidget {
  final List<String> routes;
  final void Function(int) onTap;
  final String currentRoute;
  const RouteSelectorPopUp({
    Key? key,
    required this.routes,
    required this.onTap,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(kButtonsRadius),
      clipBehavior: Clip.hardEdge,
      child: PopupMenuButton(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: kColorWhite,
          ),
          child: Row(
            children: [
              const StyledIconButton(
                icon: Icons.location_on,
                onPressed: null,
                size: kToolbarHeight * 0.75,
              ),
              SizedBox(width: 15.0),
              StyledText.normal(currentRoute, bold: true),
              SizedBox(width: 15.0),
              Icon(Icons.keyboard_arrow_down, size: kToolbarHeight * 0.5),
            ],
          ),
        ),
        onSelected: (int i) => onTap(i),
        itemBuilder: (context) {
          return List.generate(
            routes.length,
            (e) => PopupMenuItem<int>(
              value: e,
              child: Text(routes[e]),
            ),
          );
        },
      ),
    );
  }
}
