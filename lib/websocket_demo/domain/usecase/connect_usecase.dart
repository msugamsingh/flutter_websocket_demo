import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';

class WebSocketConnectUseCase {
  final WebSocketRepository repository;
  final String clientId;

  WebSocketConnectUseCase(this.repository, this.clientId);

  Future<void> call() {
    return repository.connect(clientId);
  }
}