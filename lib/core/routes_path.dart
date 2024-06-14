
enum PAGES {
  board,
  taskDetail,
  home,
  error,
}

extension AppPageExtension on PAGES {

  String get screenPath {

    switch (this) {
      case PAGES.home:
        return "/";

      case PAGES.board:
        return "/board";

      case PAGES.board:
        return "/board";

      case PAGES.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.home:
        return "HOME";
      case PAGES.board:
        return "BOARD";
      case PAGES.taskDetail:
        return "TASK DETAILS";
      case PAGES.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGES.home:
        return "Home";
      case PAGES.board:
        return "Board";
      case PAGES.taskDetail:
        return "Task Details";
      case PAGES.error:
        return "Error";
      default:
        return "Home";
    }
  }

}