import 'dart:isolate';

String playHideAndSeekLongVersion() {
  var counting = 0;
  for (var i = 0; i <= 100000000000; i++) {
    counting = i;
  }
  return '$counting! Ready or not here I come';
}

Future<String> playHideAndSeekLongVersionFuture() async {
  var counting = 0;
  await Future(() {
    for (var i = 0; i <= 100000000000; i++) {
      counting = i;
    }
  });
  return '$counting! Ready or not here I come';
}

//single message
void playHideAndSeekIsolateSingleMessage(SendPort sendPort) {
  var counting = 0;
  for (var i = 0; i <= 100000000000; i++) {
    counting = i;
  }
  final message = '$counting! Ready or not here I come';
  Isolate.exit(sendPort, message);
}

//multiple message
void playHideAndSeekIsolateMultipleMessage(SendPort sendPort) {
  sendPort.send("Ok, I'm counting....");
  var counting = 0;
  for (var i = 0; i <= 100000000000; i++) {
    counting = i;
  }
  sendPort.send('$counting! Ready or not here I come');
  sendPort.send(null);
}

//list of arguments

void playHideAndSeekListOfArguments(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final countTo = arguments[1] as int;

  sendPort.send("Ok I'm counting....");

  var counting = 0;
  for (var i = 1; i <= countTo; i++) {
    counting = i;
  }

  sendPort.send('$counting! Ready or not, here I come');
  sendPort.send(null);
}

// Future<void> main() async {
//   print("Ok I'm counting");
//   print(await playHideAndSeekLongVersionFuture());
// }

/// using Isolates
Future<void> main() async {
  final receivePort = ReceivePort();

  // await Isolate.spawn<SendPort>(
  //     playHideAndSeekIsolateSingleMessage, receivePort.sendPort);

  // final message = await receivePort.first as String;

  // print(message);

  ///single argument
  // final isolate = await Isolate.spawn<SendPort>(
  //   playHideAndSeekIsolateMultipleMessage,
  //   receivePort.sendPort,
  // );

  ///list of arguments
  final isolate = await Isolate.spawn<List<Object>>(
    playHideAndSeekListOfArguments,
    [receivePort.sendPort, 999999999],
  );

  receivePort.listen((Object? message) {
    if (message is String) {
      print(message);
    } else if (message == null) {
      receivePort.close();
      isolate.kill();
    }
  });
}
