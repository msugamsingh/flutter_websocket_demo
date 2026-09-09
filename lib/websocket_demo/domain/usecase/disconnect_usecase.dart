import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';

class DisconnectUseCase {
  final WebSocketRepository _repository;

  DisconnectUseCase(this._repository);

  Future<void> call() {
    return _repository.disconnect();
  }
}
