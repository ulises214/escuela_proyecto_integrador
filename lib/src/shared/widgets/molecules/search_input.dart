import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../atoms/styled_text.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: kTokenIconColor),
          const SizedBox(width: 16),
          Expanded(child: StyledText.secondary('Buscar')),
        ],
      ),
    );
  }
}
