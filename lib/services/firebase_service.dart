import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List usuarios = [];

  Query collectionReferenceUsuarios =
      db.collection('usuario').orderBy('nombre');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  for (var doc in queryUsuarios.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final person = {'nombre': data['nombre'], 'uid': doc.id};

    usuarios.add(person);
  }

  await Future.delayed(const Duration(seconds: 2));

  return usuarios;
}

// Guardar usuario en la bd
Future<void> insertarUsuario(String nombre) async {
  await db.collection('usuario').add({'nombre': nombre});
}

Future<void> actualizarUsuario(String uid, String nombreNuevo) async {
  await db.collection('usuario').doc(uid).set({'nombre': nombreNuevo});
}

Future<void> eliminarUsuario(String uid) async {
  await db.collection('usuario').doc(uid).delete();
}
