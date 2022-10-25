import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:connectivity/connectivity.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isHaveInternet = connectivityResult != ConnectivityResult.none;
    if (!isHaveInternet) {
      throw NoInternetException();
    }
    return request;
  }
}

class NoInternetException implements Exception {
  final message = 'No internet connection';

  @override
  String toString() => message;
}
