// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_extension/logger/logger.dart';

class RetryInterceptor extends Interceptor {
  final DioRetryOnConnectionChangeInterceptor dioRetryOnConnectionChangeInterceptor;
  RetryInterceptor({
    required this.dioRetryOnConnectionChangeInterceptor,
  });

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      if (_shouldRetry(err)) {
        final response = await dioRetryOnConnectionChangeInterceptor.scheduleRequestRetry(err.requestOptions);
        handler.resolve(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  _shouldRetry(DioError error) {
    return error.type == DioErrorType.other && error.error != null && error.error is SocketException;
  }
}

class DioRetryOnConnectionChangeInterceptor {
  final Dio dio;
  final Connectivity connectivity;
  DioRetryOnConnectionChangeInterceptor({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions options) {
    final responseCompleter = Completer<Response>();
    StreamSubscription? streamSubcription;
    streamSubcription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        streamSubcription?.cancel();
        dio
            .request(
              options.path,
              cancelToken: options.cancelToken,
              data: options.data,
              onReceiveProgress: options.onReceiveProgress,
              onSendProgress: options.onSendProgress,
              queryParameters: options.queryParameters,
            )
            .then((value) => {
                  responseCompleter.complete(value),
                });
      }
    });
    return responseCompleter.future;
  }
}
