import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List usuarios = [];

  CollectionReference collectionReferenceUsuarios = db.collection('usuario');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    usuarios.add(documento.data());
  });

  await Future.delayed(const Duration(seconds: 2));

  return usuarios;
}
