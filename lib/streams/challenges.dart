import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

Future<void> main() async {
  //dataStream();
  headsOrTails();
}

Future<void> dataStream() async {
  final url = Uri.parse('https://kodeco.com');
  final client = http.Client();
  try {
    final request = http.Request('GET', url);
    final response = await client.send(request);
    final stream = response.stream;
    await for (var data in stream.transform(utf8.decoder)) {
      print(data.length);
    }
  } on Exception catch (error) {
    print(error);
  } finally {
    client.close();
  }
}

Future<void> headsOrTails() async {
  final coinFlipper = CoinFlippingService();

  coinFlipper.onFlip.listen((coin) {
    print(coin);
  });

  coinFlipper.start();
}

enum Coin {
  heads,
  tails,
}

class CoinFlippingService {
  final _controller = StreamController<Coin>();

  Stream<Coin> get onFlip => _controller.stream;

  Future<void> start() async {
    for (int i = 0; i < 10; i++) {
      Future.delayed(
        Duration(milliseconds: 500 * i),
        () => _controller.add(Random().nextBool() ? Coin.heads : Coin.tails),
      );
    }
  }

  void dispose() => _controller.close();
}
