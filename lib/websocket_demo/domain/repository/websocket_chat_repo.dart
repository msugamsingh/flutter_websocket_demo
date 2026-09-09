abstract class WebSocketRepository {
  Future<void> connect(String clientId);

  Stream<String> get messages;

  void send(String message);

  Future<void> disconnect();
}