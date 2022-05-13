import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LogoutController extends GetxController {
  Future<void> logOut() async {
    var box = await Hive.openBox("userBox");
    box.clear();
    box.close();
  }
}
