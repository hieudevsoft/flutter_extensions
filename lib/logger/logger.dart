import 'package:logger/logger.dart' as logger;
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';

class AppLogger {
  static final log = (String name) => logger.Logger(printer: _SimpleLogPrinter(name));
  static void setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((event) {
      log(event.loggerName).d('_${event.level.name}: ${DateFormat('HH:mm:ss:SS').format(event.time)} - ${event.message}');
    });
  }

  static void logD(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).d(message);
  }

  static void logE(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).e(message);
  }

  static void logI(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).i(message);
  }

  static void logV(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).v(message);
  }

  static void logW(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).w(message);
  }

  static void logWTF(dynamic message, [String nameDebug = 'log']) {
    log(nameDebug).wtf(message);
  }
}

class _SimpleLogPrinter extends logger.LogPrinter {
  final String className;
  _SimpleLogPrinter(this.className);

  @override
  List<String> log(logger.LogEvent event) {
    var color = logger.PrettyPrinter.levelColors[event.level];
    var emoji = logger.PrettyPrinter.levelEmojis[event.level];
    var message = event.message;
    return [color!('$emoji $className - $message')];
  }
}
