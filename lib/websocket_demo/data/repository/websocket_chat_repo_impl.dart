import 'dart:convert';

import 'package:websocket_demo/websocket_demo/data/datasource/websocket_demo_datasource.dart';
import 'package:websocket_demo/websocket_demo/data/model/message_model.dart';
import 'package:websocket_demo/websocket_demo/domain/entity/meesage_entity.dart';
import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';

class WebSocketRepositoryImpl
    implements WebSocketRepository {

  final WebSocketDataSource dataSource;

  WebSocketRepositoryImpl(this.dataSource);

  @override
  Future<void> connect(String clientId) {
    return dataSource.connect(clientId);
  }

  @override
  Stream<String> get messages {
    return dataSource.messages.map(
          (message) => message.toString(),
    );
  }

  @override
  void send(String message) {
    dataSource.send(message);
  }

  @override
  Future<void> disconnect() {
    return dataSource.disconnect();
  }
}