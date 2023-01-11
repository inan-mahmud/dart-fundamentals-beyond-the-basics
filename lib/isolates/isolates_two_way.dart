import 'dart:io';
import 'dart:isolate';

class Work {
  Future<int> doSomething() async {
    print('doing some work');
    sleep(Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print('doing some other work');
    sleep(Duration(seconds: 1));
    return 24;
  }
}

class Earth {
  final _receiveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> contactMars() async {
    if (_marsIsolate != null) return;

    _marsIsolate = await Isolate.spawn<SendPort>(
      _entryPoint,
      _receiveOnEarthPort.sendPort,
    );
  }

  void dispose() {
    _receiveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
  }
}

Future<void> _entryPoint(SendPort sendToEarthPort) async {
  final receiveOnMarsPort = ReceivePort();
  sendToEarthPort.send(receiveOnMarsPort.sendPort);

  final work = Work();

  receiveOnMarsPort.listen((Object? messageFromEarth) async {
    await Future<void>.delayed(Duration(seconds: 1));
    print('Message from earth: $messageFromEarth');

    if (messageFromEarth == "Hey from Earth") {
      sendToEarthPort.send('Hey from Mars');
    } else if (messageFromEarth == 'Can you help?') {
      sendToEarthPort.send('sure');
    } else if (messageFromEarth == 'doSomething') {
      final result = await work.doSomething();

      sendToEarthPort.send({
        'method': 'doSomething',
        'result': result,
      });
    } else if (messageFromEarth == 'doSomethingElse') {
      final result = await work.doSomethingElse();
      sendToEarthPort.send({
        'method': 'doSomethingElse',
        'result': result,
      });
      sendToEarthPort.send('done');
    }
  });
}
