import 'package:flutter/material.dart';
import 'package:flutter_extension/hive/hive.dart';
import 'package:flutter_extension/logger/logger.dart';
import 'package:hive/hive.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void dispose() {
    HiveApp.instance.dispose(HiveApp.instance.nameContactsBox);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HiveApp.instance.openBox(HiveApp.instance.nameContactsBox),
      builder: (BuildContext context, AsyncSnapshot<Box> snapshot) {
        if (snapshot.hasData) {
          final box = snapshot.data;
          //HiveApp.instance.insert(HiveApp.instance.nameContactsBox, 'hieu', 3);
          box?.keys.forEach((e) => AppLogger.logV('value: $e, ${e.runtimeType}'));
          return Text('Have data');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
