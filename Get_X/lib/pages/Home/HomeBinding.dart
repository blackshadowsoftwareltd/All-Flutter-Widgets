import 'package:Get_X/Services/AllApiServeces.dart';
import 'package:Get_X/pages/Home/HomeController.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(HomeController());
    Get.put(ApiServices());
  }
}
