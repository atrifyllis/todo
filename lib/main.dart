import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo/routes.dart';

import 'AppState.dart';
import 'app_state_reducer.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.mock(),
  );

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
                return HomePage(title: "Advancedd Todoz");
              }
            }));
  }
}
