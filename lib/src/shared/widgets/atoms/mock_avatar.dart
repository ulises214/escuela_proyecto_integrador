import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

class MockAvatar extends StatelessWidget {
  final double size;
  const MockAvatar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Avatar(
        elevation: 0,
        onTap: () {},
        sources: [
          GitHubSource('nuria-fl'),
        ],
      ),
    );
  }
}
