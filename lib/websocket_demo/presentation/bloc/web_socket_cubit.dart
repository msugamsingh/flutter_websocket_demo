import 'dart:async';
import 'dart:math';

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
  bool _manuallyDisconnected = false;
  int _reconnectCount = 0;

  void _scheduleReconnect() {
    if (_manuallyDisconnected) return;

    final seconds = min(1 << _reconnectCount, 30);

    _reconnectCount++;

    Future.delayed(Duration(seconds: seconds), () {
      print('trying');
      if (!_manuallyDisconnected) {
        connect();
      }
    });
  }

  void _handleDisconnect() {
    if (_manuallyDisconnected) {
      return;
    }

    emit(state.copyWith(status: WebSocketStatus.disconnected));

    _scheduleReconnect();
  }

  Future<void> connect() async {
    if (state.status == WebSocketStatus.connected ||
        state.status == WebSocketStatus.connecting) {
      return;
    }

    emit(state.copyWith(status: WebSocketStatus.connecting, error: null));

    _manuallyDisconnected = false;

    try {
      await _webSocketConnectUseCase();
      emit(state.copyWith(status: WebSocketStatus.connected));
      _reconnectCount = 0;

      await _listenToMessages();
    } catch (e) {
      emit(
        state.copyWith(
          status: WebSocketStatus.disconnected,
          error: e.toString(),
        ),
      );
      _scheduleReconnect();
    }
  }

  Future<void> _listenToMessages() async {
    _subscription = _getMessagesStreamUseCase().listen(
      (message) {
        if (message == 'ping') {
          _sendMessageUseCase('pong');
          return;
        }
        emit(state.copyWith(messages: [...state.messages, message]));
      },
      onError: (error) {
        emit(
          state.copyWith(
            status: WebSocketStatus.disconnected,
            error: error.toString(),
          ),
        );
        _handleDisconnect();
      },
      onDone: () {
        emit(state.copyWith(status: WebSocketStatus.disconnected));
        _handleDisconnect();
      },
    );
  }

  void send(String message) {
    _sendMessageUseCase(message);
  }

  Future<void> disconnect() async {
    _subscription?.cancel();
    _subscription = null;
    _manuallyDisconnected = true;

    await _disconnectUseCase();
    emit(state.copyWith(status: .disconnected));
  }

  @override
  Future<void> close() async {
    await disconnect();
    return super.close();
  }
}
