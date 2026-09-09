import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/connect_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/disconnect_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/get_messages_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/send_message_usecase.dart';

part 'web_socket_state.dart';

part 'web_socket_cubit.freezed.dart';

class WebSocketCubit extends Cubit<WebSocketState> {
  final GetMessagesStreamUseCase _getMessagesStreamUseCase;
  final WebSocketConnectUseCase _webSocketConnectUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final DisconnectUseCase _disconnectUseCase;

  WebSocketCubit(
    this._getMessagesStreamUseCase,
    this._webSocketConnectUseCase,
    this._sendMessageUseCase,
    this._disconnectUseCase,
  ) : super(const WebSocketState(status: WebSocketStatus.disconnected));

  StreamSubscription<String>? _subscription;

  Future<void> connect() async {
    emit(state.copyWith(status: WebSocketStatus.connecting));

    try {
      await _webSocketConnectUseCase();
      emit(state.copyWith(status: WebSocketStatus.connected));
      _subscription = _getMessagesStreamUseCase().listen(
        (message) {
          emit(state.copyWith(messages: [...state.messages, message]));
        },
        onError: (error) {
          emit(
            state.copyWith(
              status: WebSocketStatus.error,
              error: error.toString(),
            ),
          );
        },
        onDone: () {
          emit(state.copyWith(status: WebSocketStatus.disconnected));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: WebSocketStatus.error, error: e.toString()));
    }
  }

  void send(String message) {
    _sendMessageUseCase(message);
  }

  Future<void> disconnect() async {
    _subscription?.cancel();
    _subscription = null;

    await _disconnectUseCase();
    emit(state.copyWith(status: .disconnected));
  }

  @override
  Future<void> close() async {
    await disconnect();
    return super.close();
  }
}
