import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ingrese el'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese el nuevo nombre de la persona',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await insertarUsuario(nameController.text).then((_) => {
                        Navigator.pop(context),
                      });
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ));
  }
}
