part of 'web_socket_cubit.dart';

enum WebSocketStatus { disconnected, connecting, connected, error }

@freezed
abstract class WebSocketState with _$WebSocketState {
  const factory WebSocketState({
    required WebSocketStatus status,
    @Default([]) List<String> messages,
    String? error,
  }) = _WebSocketState;
}
