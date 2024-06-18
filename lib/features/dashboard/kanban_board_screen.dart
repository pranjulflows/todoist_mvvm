import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoist_mvvm/common/widgets/kanban_app_bar.dart';
import 'package:todoist_mvvm/core/app_assets.dart';
import 'package:todoist_mvvm/core/app_style.dart';
import 'package:todoist_mvvm/core/constants.dart';
import 'package:todoist_mvvm/core/utils.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/header_widget.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/task_card.dart';


/// Kanban Main Screen
class KanbanBoardScreen extends StatelessWidget {
  const KanbanBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const BoardAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(totalCount: "0", title: toDo, icon: '📦'),
          SizedBox(
            height: taskCardSize150,
            child: PageView.builder(
                itemCount: 4,
                itemBuilder: (ctx, index) {
                  return TaskCard(
                      title: "Created the Tasks UI",
                      dateTime: DateTime.now().toString().split('.')[0],
                      commentCount: "0");
                }),
          ),
          Header(totalCount: "0", title: inProgress, icon: '🛠️'),
          SizedBox(
            height: taskCardSize150,
            child: PageView.builder(
                itemCount: 4,
                itemBuilder: (ctx, index) {
                  return TaskCard(
                      title: "Created the Tasks UI",
                      dateTime: DateTime.now().toString().split('.')[0],
                      commentCount: "0");
                }),
          ),
          Header(totalCount: "0", title: done, icon: '✅'),
        ],
      ),
    );
  }
}
