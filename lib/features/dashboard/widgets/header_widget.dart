import 'package:flutter/material.dart';
import 'package:todoist_mvvm/core/app_style.dart';
import 'package:todoist_mvvm/core/constants.dart';

class Header extends StatelessWidget {
  final totalCount;
  final title;
  final icon;

  const Header(
      {super.key,
      required this.totalCount,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                width: 40,
                height: 40,
                color: Colors.white,
                child: Center(
                    child: Text(
                  icon,
                  style: headLine2,
                ))),
          ),
          spaceWidth10,
          Text(title),
          spaceWidth10,
          Text(
            totalCount,
            style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
