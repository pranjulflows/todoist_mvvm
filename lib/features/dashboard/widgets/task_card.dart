import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoist_mvvm/core/app_assets.dart';
import 'package:todoist_mvvm/core/constants.dart';
import 'package:todoist_mvvm/core/utils.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String commentCount;

  const TaskCard(
      {super.key,
      required this.title,
      required this.dateTime,
      required this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 3.0,
          spreadRadius: 0.0,
          offset: const Offset(4.0, 4.0), // shadow direction: bottom right
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      width: Utils.getWidth(context, percent: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          spaceHeight10,
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              spaceWidth10,
              Text(dateTime)
            ],
          ),
          spaceHeight10,
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SvgPicture.asset(
                  width: 24,
                  height: 24,
                  AppAssets.user,
                ),
              ),
              spaceWidth10,
              const Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.grey,
              ),
              spaceWidth10,
              Text(commentCount)
            ],
          ),
        ],
      ),
    );
  }
}
