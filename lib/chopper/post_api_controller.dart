import 'package:chopper/chopper.dart';
import 'package:flutter_extension/chopper/post_api_service.dart';
import 'package:get/get.dart';

class PostApiController extends GetxController {
  late final PostApiService service;

  @override
  void onInit() {
    service = PostApiService.getService();
    super.onInit();
  }

  @override
  void onClose() {
    service.client.dispose();
    super.onClose();
  }
}
