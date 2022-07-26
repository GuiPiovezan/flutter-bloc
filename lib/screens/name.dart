import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit("Guilherme Piovezan"),
      child: NameView(),
    );
  }
}

class NameView extends StatelessWidget{
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change name"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Desired name'
            ),
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              child: const Text('Change'),
              onPressed: () {
                String name = _nameController.text;
                context.read<NameCubit>().change(name);
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      )
    );
  }
}
