import 'package:get_it/get_it.dart';
import 'package:websocket_demo/websocket_demo/data/datasource/websocket_demo_datasource.dart';
import 'package:websocket_demo/websocket_demo/data/repository/websocket_chat_repo_impl.dart';
import 'package:websocket_demo/websocket_demo/domain/repository/websocket_chat_repo.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/connect_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/disconnect_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/get_messages_usecase.dart';
import 'package:websocket_demo/websocket_demo/domain/usecase/send_message_usecase.dart';
import 'package:websocket_demo/websocket_demo/presentation/bloc/web_socket_cubit.dart';

GetIt getIt = GetIt.I;

void setup() {
  getIt.registerLazySingleton(() => WebSocketDataSource());

  getIt.registerLazySingleton<WebSocketRepository>(
    () => WebSocketRepositoryImpl(getIt<WebSocketDataSource>()),
  );
  // the below clientId ['mobile'] can be passed to call method of the usecase
  getIt.registerLazySingleton(
    () => WebSocketConnectUseCase(getIt<WebSocketRepository>(), 'Mobile'),
  );
  getIt.registerLazySingleton(
    () => DisconnectUseCase(getIt<WebSocketRepository>()),
  );
  getIt.registerLazySingleton(
    () => SendMessageUseCase(getIt<WebSocketRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetMessagesStreamUseCase(getIt<WebSocketRepository>()),
  );
}
