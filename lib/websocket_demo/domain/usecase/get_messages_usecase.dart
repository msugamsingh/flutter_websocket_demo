// domain/usecases/get_messages_stream_usecase.dart
import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';

class GetMessagesStreamUseCase {
  final WebSocketRepository repository;

  GetMessagesStreamUseCase(this.repository);

  Stream<String> call() {
    return repository.messages;
  }
}