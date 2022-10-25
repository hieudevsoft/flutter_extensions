import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class SimpleAnimationPage extends StatefulWidget {
  const SimpleAnimationPage({super.key});

  @override
  State<SimpleAnimationPage> createState() => _SimpleAnimationPageState();
}

class _SimpleAnimationPageState extends State<SimpleAnimationPage> with SingleTickerProviderStateMixin {
  double angle = 0;
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final Animation<Offset> animationOffset;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animationController);

    /**Any direction of the animation can be changed by changing the offset
     * Note: Offset(a,b)
     * @params a: horizontal direction relatice with widget
     * @params b: vertical direction relatice with widget
    */
    animationOffset = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                position: animationOffset,
                child: const CircleWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animationController),
                child: const CircleWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animationController),
                child: const CircleWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).chain(CurveTween(curve: Curves.linearToEaseOut)).animate(animationController),
                child: const CircleWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: const CircleWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              SizeTransition(
                sizeFactor: animation,
                axis: Axis.vertical,
                child: const Center(child: const CircleWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green.shade400,
      maxRadius: Get.width / 8,
      child: Icon(
        Icons.home_rounded,
        size: Get.width / 8,
        color: Colors.white,
      ),
    );
  }
}
