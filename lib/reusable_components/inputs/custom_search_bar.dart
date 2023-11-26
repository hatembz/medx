import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search',
      // shadowColor: MaterialStatePropertyAll(),
      surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.grey),
      side: MaterialStatePropertyAll(BorderSide(width: 1, color: Color(0xFFEAEEF2))),
      elevation: MaterialStatePropertyAll<double>(0),
      controller: controller,
      constraints: BoxConstraints(maxHeight: 50, minHeight: 50),
      padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
      // onTap: () => controller.openView(),
      // onChanged: (_) => controller.openView(),
      trailing: [const Icon(Icons.search)],
    );
  }
}
