import 'package:flutter/material.dart';
import 'package:todoist_mvvm/common/widgets/kanban_app_bar.dart';
import 'package:todoist_mvvm/core/app_style.dart';

class KanbanBoardScreen extends StatelessWidget {
  const KanbanBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: const BoardAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                      '📦',
                      style: headLine1,
                    ))),
              ),
              const Text('To Do'),
            ],
          )
        ],
      ),
    );
  }
}
