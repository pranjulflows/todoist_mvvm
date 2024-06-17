import 'package:flutter/material.dart';

class BoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double height;

  const BoardAppBar({
    super.key,
    this.title,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Kanban Board'),
    );
  }
}
