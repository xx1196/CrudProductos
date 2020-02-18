import 'package:crud_productos/src/bloc/login_bloc.dart';
export 'package:crud_productos/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

export 'package:crud_productos/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _currentInstance;

  factory Provider({Key key, Widget child}) {
    if (_currentInstance == null) {
      _currentInstance = Provider._internal(
        key: key,
        child: child,
      );
    }
    return _currentInstance;
  }

  final loginBloc = LoginBloc();

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
