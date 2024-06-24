import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:todoist_mvvm/common/widgets/kanban_app_bar.dart';
import 'package:todoist_mvvm/core/app_string.dart';
import 'package:todoist_mvvm/core/app_style.dart';
import 'package:todoist_mvvm/core/utils.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/task_card.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/text_item.dart';
import 'package:todoist_mvvm/di/injection.dart';
import 'package:todoist_mvvm/repository/todoTask/task_repository.dart';

/// Kanban Main Screen
class KanbanBoardScreen extends StatefulWidget {
  KanbanBoardScreen({super.key});

  @override
  State<KanbanBoardScreen> createState() => _KanbanBoardScreenState();
}

class _KanbanBoardScreenState extends State<KanbanBoardScreen> {
  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  @override
  void initState() {
    final group1 = AppFlowyGroupData(
        id: "To Do",
        items: [
          TextItem("Card 1"),
          TextItem("Card 2"),
        ],
        name: 'To Do');
    // group1.items.add(TextItem("s"));
    final group2 = AppFlowyGroupData(
        id: "In Progress",
        items: [
          TextItem("Card 3"),
          TextItem("Card 4"),
        ],
        name: 'In Progress');

    final group3 = AppFlowyGroupData(id: "Done", items: [], name: 'Done');

    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((duration) {
      getIt<TaskRepository>().getTasks().then((result) {
        result.when(
            success: (data) => print(data), failure: (error) => print(error));
      });
    });
    final config = AppFlowyBoardConfig(
      groupBackgroundColor: HexColor.fromHex('#F7F8FC'),
      stretchGroupHeight: false,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const BoardAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Header(totalCount: "0", title: toDo, icon: '📦'),
          // SizedBox(
          //   height: taskCardSize150,
          //   child: PageView.builder(
          //       itemCount: 4,
          //       itemBuilder: (ctx, index) {
          //         return TaskCard(
          //             title: "Created the Tasks UI",
          //             dateTime: DateTime.now().toString().split('.')[0],
          //             commentCount: "0");
          //       }),
          // ),
          // const Header(totalCount: "0", title: inProgress, icon: '🛠️'),
          // SizedBox(
          //   height: taskCardSize150,
          //   child: PageView.builder(
          //       itemCount: 4,
          //       itemBuilder: (ctx, index) {
          //         return TaskCard(
          //             title: "Created the Tasks UI",
          //             dateTime: DateTime.now().toString().split('.')[0],
          //             commentCount: "0");
          //       }),
          // ),
          //  Header(totalCount: "0", title: done, icon: '✅'),

          Expanded(
            child: AppFlowyBoard(
              config: config,
              controller: controller,
              headerBuilder: (context, columnData) {
                return AppFlowyGroupHeader(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.white,
                          child: const Center(
                              child: Text(
                            '📦',
                            style: headLine2,
                          ))),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(columnData.headerData.groupName),
                  ),
                  // addIcon: const Icon(Icons.add, size: 20),
                  // moreIcon: const Icon(Icons.more_horiz, size: 20),
                  height: 50,
                  // margin: config.groupBodyPadding,
                );
              },
              cardBuilder: (context, group, groupItem) {
                final textItem = groupItem as TextItem;
                return AppFlowyGroupCard(
                  decoration: const BoxDecoration(),
                  key: ObjectKey(textItem),
                  child: TaskCard(
                      title: "Created the Tasks UI",
                      dateTime: DateTime.now().toString().split('.')[0],
                      commentCount: "0"),
                );
              },
              groupConstraints:
                  BoxConstraints.tightFor(width: Utils.getWidth(context)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(AppString.addTask),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class HexColor {
  static Color fromHex(String hexColor) {
    var color = hexColor.replaceAll("#", "0xFF");
    try {
      return Color(int.parse(color));
    } catch (e) {
      rethrow;
    }
  }
}
