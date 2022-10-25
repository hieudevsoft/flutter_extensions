import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhtoViewPage extends StatefulWidget {
  const PhtoViewPage({super.key});

  @override
  State<PhtoViewPage> createState() => _PhtoViewPageState();
}

class _PhtoViewPageState extends State<PhtoViewPage> {
  final imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png';
  late final PhotoViewController _photoScaleViewController;
  @override
  void initState() {
    _photoScaleViewController = PhotoViewController();
    super.initState();
  }

  @override
  void dispose() {
    _photoScaleViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _photoScaleViewController.outputStateStream,
          builder: (BuildContext context, AsyncSnapshot<PhotoViewControllerValue> snapshot) {
            if (snapshot.hasData) {
              return InkWell(
                  onTap: () {
                    _photoScaleViewController.scale = _photoScaleViewController.initial.scale;
                  },
                  child: Text('Scale compared to the original: ${snapshot.data!.scale!.toStringAsFixed(2)}'));
            }
            return Text('1');
          },
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: PhotoView(
          controller: _photoScaleViewController,
          imageProvider: NetworkImage(
            imageUrl,
          ),
          minScale: PhotoViewComputedScale.contained * 0.5,
          maxScale: PhotoViewComputedScale.covered * 2,
          scaleStateChangedCallback: (state) {
            print(state.isScaleStateZooming);
            print(state.name);
            print(state.index);
          },
          gestureDetectorBehavior: HitTestBehavior.translucent,
          enableRotation: true,
          backgroundDecoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          loadingBuilder: (context, event) {
            //!Event custom byte download ( can show progess bar loading percent)
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
