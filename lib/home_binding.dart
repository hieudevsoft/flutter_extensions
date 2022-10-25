import 'package:flutter_extension/chopper/post_api_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostApiController>(() => PostApiController());
  }
}
