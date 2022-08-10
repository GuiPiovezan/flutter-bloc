import 'package:bytebank/components/bloc_container.dart';
import 'package:bytebank/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return NameView();
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
