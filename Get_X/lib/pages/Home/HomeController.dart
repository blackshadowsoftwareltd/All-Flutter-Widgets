import 'package:get/get.dart';

class HomeController extends GetxController {
  var value = 0.obs;

  increment() {
    value++;
  }

  decrement() {
    value--;
  }
}
