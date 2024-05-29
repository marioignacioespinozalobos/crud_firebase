import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class UpdNamePage extends StatefulWidget {
  const UpdNamePage({super.key});

  @override
  State<UpdNamePage> createState() => _UpdNamePageState();
}

class _UpdNamePageState extends State<UpdNamePage> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    nameController.text = arguments['name'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la modificación',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await actualizarUsuario(arguments['uid'], nameController.text)
                      .then((value) => {
                            Navigator.pop(context),
                          });
                },
                child: const Text('Actualizar'),
              ),
            ],
          ),
        ));
  }
}
