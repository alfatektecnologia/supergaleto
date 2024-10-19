// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future login2Firebase(
    BuildContext context, String email, String password) async {
  // create a code to login a userEmail and password to firebase
// This function will take in the user's email and password and use Firebase Authentication to log them in

  try {
    // Prompt the user to enter their email and password
    // String email = email;
    //String password = "password123";

    // Use Firebase Authentication to log the user in
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // If the login is successful, print a success message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login successful: ${userCredential.user?.email}"),
    ));
    //print("Login successful: ${userCredential.user?.email}");
  } catch (e) {
    // If the login fails, print an error message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login failed: $e"),
    ));
    //print("Login failed: $e");
  }
}
