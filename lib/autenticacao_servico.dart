import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    cadastrarUsuario({
      required String usuario,
      required String senha,
    }) {
      _firebaseAuth.createUserWithEmailAndPassword(
        email: usuario, 
        password: senha,
        );
    }
}