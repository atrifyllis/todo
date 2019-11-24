import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:todo/routes.dart';

import 'AppState.dart';
import 'app_state_reducer.dart';
import 'home_page.dart';

void main() {
  final store = DevToolsStore<AppState>(appReducer,
      initialState: AppState.mock(),
      middleware: [new LoggingMiddleware.printer()]);
  runApp(ReduxDevToolsContainer(
      store: store,
      child: MyApp(
        store: store,
        // Since we want a Dev Drawer that includes the Redux Dev Tools, we'll
        // provide a function that returns one! In production, notice we don't
        // provide one.
        devDrawerBuilder: (context) {
          return new Drawer(
            child: new Padding(
              padding: new EdgeInsets.only(top: 24.0),
              child: new ReduxDevTools(store),
            ),
          );
        },
      )));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final WidgetBuilder devDrawerBuilder;

  const MyApp({Key key, this.store, this.devDrawerBuilder}) : super(key: key);

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
                return HomePage(
                  title: "Advanced Todoz",
                  devDrawerBuilder: devDrawerBuilder,
                );
              }
            }));
  }
}
