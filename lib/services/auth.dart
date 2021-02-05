import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance.collection('users');
  signupWithemailandPassword(
      String mail, String password, String name, String phone, context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: mail, password: password)
          .then((value) {
        firebaseInstance.doc(value.user.uid).set({
          'uid': value.user.uid,
          'userName': name,
          'userPhone': phone,
          'userEmail': mail,
          'password': password,
        });
      });
      Navigator.of(context).pushReplacementNamed('mainpage');
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }
}
