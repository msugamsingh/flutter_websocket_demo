import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';

class SendMessageUseCase {

  final WebSocketRepository _repository;

  const SendMessageUseCase(this._repository);

  void call(String message) => _repository.send(message);
}