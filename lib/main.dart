import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_demo/service_locator.dart';
import 'package:websocket_demo/websocket_demo/presentation/bloc/web_socket_cubit.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                WebSocketCubit(getIt(), getIt(), getIt(), getIt())..connect(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<WebSocketCubit, WebSocketState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error ?? 'Something went wrong!!!'),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<WebSocketCubit>();
            return Center(
              child: Column(
                children: [
                  Text(state.status.name),
                  TextButton(
                    onPressed: () {
                      cubit.send('Hello');
                    },
                    child: Text('Send Hello'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (c, i) {
                        return Text(state.messages[i]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
