import 'package:Get_X/Services/AllApiServeces.dart';
import 'package:Get_X/pages/Home/HomeBinding.dart';
import 'package:get/get.dart';

class DetailsBaind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ApiServices());
    Get.put(HomeBind());
  }
}
