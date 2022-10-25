import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/dio/retry_interceptor.dart';
import 'package:flutter_extension/logger/logger.dart';

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  late Dio dio;
  late bool isLoading;
  final url = 'https://jsonplaceholder.typicode.com/posts';
  @override
  void initState() {
    dio = Dio();
    isLoading = false;
    dio.interceptors.add(
      RetryInterceptor(
        dioRetryOnConnectionChangeInterceptor: DioRetryOnConnectionChangeInterceptor(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              child: CircularProgressIndicator(),
              visible: isLoading,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final data = await dio.get(url);
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text(
                'Press button here 👇',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
