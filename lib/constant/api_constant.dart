class ConstantApiPath {
  static const String serverName = "https://pleasantly-divine-bear.ngrok-free.app";//"http://192.168.0.103/";
  static const String projectPath = "/project/note_application/query";
  static const String categoryPath = "$projectPath/category/";
  static const String notePath = "$projectPath/note/";
  static const String imageFold = "project/note_application/upload/";
  static const String displayFile = "display.php";
  static const String insertFile = "insert.php";
  static const String deleteFile = "delete.php";
  static const String editFile = "edit.php";
  static const String passwordFile = "password.php";
}

class ConstantCategoryApiPath {
  static const String displayCategoryPath = ConstantApiPath.serverName +
      ConstantApiPath.categoryPath +
      ConstantApiPath.displayFile;
  static const String insertCategoryPath = ConstantApiPath.serverName +
      ConstantApiPath.categoryPath +
      ConstantApiPath.insertFile;
  static const String deleteCategoryPath = ConstantApiPath.serverName +
      ConstantApiPath.categoryPath +
      ConstantApiPath.deleteFile;
  static const String editCategoryPath = ConstantApiPath.serverName +
      ConstantApiPath.categoryPath +
      ConstantApiPath.editFile;
}

class ConstantNoteApiPath {
  static const String displayNotePath = ConstantApiPath.serverName +
      ConstantApiPath.notePath +
      ConstantApiPath.displayFile;
  static const String insertNotePath = ConstantApiPath.serverName +
      ConstantApiPath.notePath +
      ConstantApiPath.insertFile;
  static const String deleteNotePath = ConstantApiPath.serverName +
      ConstantApiPath.notePath +
      ConstantApiPath.deleteFile;
  static const String editNotePath = ConstantApiPath.serverName +
      ConstantApiPath.notePath +
      ConstantApiPath.editFile;
  static const String passwordPath = ConstantApiPath.serverName +
      ConstantApiPath.notePath +
      ConstantApiPath.passwordFile;
}

class ConstantImageApiPath {
  static const String imagePath =
      ConstantApiPath.serverName + ConstantApiPath.imageFold;
}

class ConstantCategoryApi {
  static const String id = "id";
  static const String categoryName = "categoryName";
  static const String image = "image";
  static const String timeDate = "date";
  static const String idUser = "userId";
}

class ConstantNoteApi {
  static const String id = "id";
  static const String title = "title";
  static const String content = "content";
  static const String image = "image";
  static const String password = "password";
  static const String idCategory = "categoryId";
}

class ConstantResultApi {
  static const String status = "status";
  static const String data = "data";
  static const String success = "success";
  static const String fail = "fail";
}
