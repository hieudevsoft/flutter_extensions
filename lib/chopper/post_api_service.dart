import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_extension/chopper/custom_converter.dart';
import 'package:flutter_extension/chopper/post_model.dart';
import 'package:flutter_extension/connectivity/connectivity.dart';
import 'package:flutter_extension/logger/logger.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<List<PostModel>>>? getPosts();

  @Get(path: '/{id}')
  Future<Response<PostModel>> getPost(@Path('id') int id);

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService getService() {
    final client = ChopperClient(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services: [
          _$PostApiService(),
        ],
        converter: JsonToSafeTypeConverter(typeToJsonFactoryMap: {PostModel: (jsonData) => PostModel.fromJson(jsonData)}),
        interceptors: [
          const HeadersInterceptor({'Cache-control': 'no-cache'}),
          HttpLoggingInterceptor(),
          MobileDataInterceptor(),
          (Request request) async {
            AppLogger.logI(request);
            AppLogger.logI(request.headers);
            AppLogger.logI(request.parameters);
            AppLogger.logI(request.body);
            return request;
          }
        ]);
    return _$PostApiService(client);
  }
}
