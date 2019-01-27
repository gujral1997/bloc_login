import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.ancestorInheritedElementForWidgetOfExactType(Provider)
            as Provider)
        .bloc;
  }
}
