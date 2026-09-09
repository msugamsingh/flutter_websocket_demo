import 'dart:async';
import 'dart:math';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rxdart/rxdart.dart';

class WebSocketDataSource {
  WebSocketChannel? _channel;

  Future<void> connect(String clientId) async {
    _channel = WebSocketChannel.connect(
      Uri.parse(
        'ws://localhost:8000/ws/$clientId',
      ),
    );

    await _channel!.ready;
  }

  Stream<dynamic> get messages {
    return _channel!.stream;
  }

  void send(String message) {
    _channel!.sink.add(message);
  }

  Future<void> disconnect() async {
    await _channel?.sink.close();
    _channel = null;
  }
}