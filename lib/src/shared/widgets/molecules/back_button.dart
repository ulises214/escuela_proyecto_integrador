import 'package:flutter/material.dart';

import '../../../routes.controller.dart';
import '../../theme/theme.dart';
import '../atoms/styled_text.dart';

class CustomBackButton extends StatelessWidget {
  final String name;
  const CustomBackButton({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GestureDetector(
        onTap: () {
          RouteController.read(context).pop();
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back_ios, color: kTokenIconColor),
              const SizedBox(width: 8.0),
              StyledText.secondary(name),
            ],
          ),
        ),
      ),
    );
  }
}
