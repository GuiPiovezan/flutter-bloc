import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(BytebankApp());
    },

    // Na prática evitar log do gênero,
    // pois pode vazar informações sensíveis para o log
    blocObserver: LogObserver(),
  );
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('${bloc.runtimeType} > $change');
    super.onChange(bloc, change);
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme,
      home: NameContainer(),
    );
  }
}
