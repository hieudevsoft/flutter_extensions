import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/material.dart';
import 'package:flutter_extension/chopper/post_api_controller.dart';
import 'package:flutter_extension/chopper/post_model.dart';
import 'package:flutter_extension/logger/logger.dart';
import 'package:get/get.dart';

class PostApiPage extends StatelessWidget {
  const PostApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post api')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        onPressed: () async {
          final response = await Get.find<PostApiController>().service.postPost({'title': 'learn dart'});
          AppLogger.logD(response.body);
        },
      ),
      body: FutureBuilder<chopper.Response<List<PostModel>>>(
        future: Get.find<PostApiController>().service.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<chopper.Response<List<PostModel>>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final response = snapshot.data?.body;
            return _buildList(response);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(List<PostModel>? response) {
    return response == null
        ? const Text('Error')
        : ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: response.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  final post = await Get.find<PostApiController>().service.getPost(response[index].id);
                  AppLogger.logD(post.body);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          response[index].title,
                          style: Get.textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          response[index].body,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
