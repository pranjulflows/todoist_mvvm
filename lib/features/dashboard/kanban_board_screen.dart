import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist_mvvm/common/bloc/generic_bloc.dart';
import 'package:todoist_mvvm/common/widgets/kanban_app_bar.dart';
import 'package:todoist_mvvm/core/app_extension.dart';
import 'package:todoist_mvvm/core/app_string.dart';
import 'package:todoist_mvvm/core/constants.dart';
import 'package:todoist_mvvm/data/model/task.dart';
import 'package:todoist_mvvm/features/dashboard/bloc/tasks_bloc.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/header_widget.dart';
import 'package:todoist_mvvm/features/dashboard/widgets/task_card.dart';

/// Kanban Main Screen
class KanbanBoardScreen extends StatefulWidget {
  const KanbanBoardScreen({super.key});

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
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final config = AppFlowyBoardConfig(
    //   groupBackgroundColor: HexColor.fromHex('#F7F8FC'),
    //   stretchGroupHeight: false,
    // );
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const BoardAppBar(),
      body: BlocBuilder<TasksBloc, GenericBlocState<Tasks>>(
        builder: (context, GenericBlocState<Tasks> state) {
          switch (state.status) {
            case Status.empty:
              return const Text('No Data Fond');
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.failure:
              return Text(
                  'Oh-ho There is something Error which is ${state.error}');
            case Status.success:

              ///TODO: Controller Items list is @UnmodifiableListView we can't add the tasks directly from the api
              //  loadData(state.data);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// To Do📦 Card View
                  Header(
                      totalCount: "${state.data?.length}",
                      title: toDo,
                      icon: '📦'),
                  SizedBox(
                    height: taskCardSize150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data?.length ?? 0,
                        itemBuilder: (ctx, index) {
                          final item = state.data![index];
                          return TaskCard(
                              title: item.content ?? "",
                              dateTime: item.createdAt
                                  // ,
                                  .changeDateFormat(),
                              commentCount: "0");
                        }),
                  ),

                  /// InProgress Task Card View
                  const Header(totalCount: "0", title: inProgress, icon: '🛠️'),
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

                  /// Completed Task Card View
                  const Header(totalCount: "0", title: done, icon: '✅'),

                  ///TODO: Make Task item draggable below AppFlowyBoard doesn't work with custom widgets.
                  // Expanded(
                  //   child: AppFlowyBoard(
                  //     config: config,
                  //     controller: controller,
                  //     headerBuilder: (context, columnData) {
                  //       return AppFlowyGroupHeader(
                  //         icon: Padding(
                  //           padding: const EdgeInsets.only(left: 18.0, top: 6),
                  //           child: ClipRRect(
                  //             borderRadius: BorderRadius.circular(50),
                  //             child: Container(
                  //                 width: 40,
                  //                 height: 40,
                  //                 color: Colors.white,
                  //                 child: const Center(
                  //                     child: Text(
                  //                   '📦',
                  //                   style: headLine2,
                  //                 ))),
                  //           ),
                  //         ),
                  //         title: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 10.0,
                  //           ),
                  //           child: Text(columnData.headerData.groupName),
                  //         ),
                  //         // addIcon: const Icon(Icons.add, size: 20),
                  //         // moreIcon: const Icon(Icons.more_horiz, size: 20),
                  //         height: 50,
                  //         // margin: config.groupBodyPadding,
                  //       );
                  //     },
                  //     cardBuilder: (context, group, groupItem) {
                  //       final textItem = groupItem as TextItem;
                  //       return AppFlowyGroupCard(
                  //         decoration: const BoxDecoration(),
                  //         key: ObjectKey(textItem),
                  //         child: TaskCard(
                  //             title: textItem.s,
                  //             dateTime: DateTime.now().toString().split('.')[0],
                  //             commentCount: "0"),
                  //       );
                  //     },
                  //     groupConstraints: BoxConstraints.tightFor(
                  //         width: Utils.getWidth(context)),
                  //   ),
                  // ),
                ],
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(AppString.addTask),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void getData() {
    if (!mounted) return;
    context.read<TasksBloc>().add(const TasksEvent.fetched());
  }

// void loadData(List<Tasks>? data) {
//   List<TextItem> items = [];
//   if (data?.isNotEmpty == true) {
//     items = data!
//         .map((task) => TextItem(task.content ?? task.description ?? ""))
//         .toList();
//   }
//
//   final group1 = AppFlowyGroupData(id: "To Do", items: items, name: 'To Do');
//   // group1.items.add(TextItem("s"));
//   final group2 = AppFlowyGroupData(
//       id: "In Progress",
//       items: [
//         TextItem("Card 3"),
//         TextItem("Card 4"),
//       ],
//       name: 'In Progress');
//
//   final group3 = AppFlowyGroupData(id: "Done", items: [], name: 'Done');
//   controller.addGroups([group1, group2, group3]);
// }
}
