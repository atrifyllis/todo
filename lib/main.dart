import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:todo/routes.dart';

import 'AppState.dart';
import 'app_state_reducer.dart';
import 'home_page.dart';

Future main() async {
  var remoteDevtools = RemoteDevToolsMiddleware('192.168.99.1:8000');
  await remoteDevtools.connect();
  final store = Store<AppState>(appReducer,
      initialState: AppState.mock(),
      middleware: [new LoggingMiddleware.printer(), remoteDevtools]);
  remoteDevtools.store = store;

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Initial state: ${store.state.todos}');
    return StoreProvider(
        store: store,
        child: MaterialApp(
            title: 'Flutter Demos',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              Routes.home: (context) {
                return HomePage(title: "Advanced Todoz");
              }
            }));
  }
}
