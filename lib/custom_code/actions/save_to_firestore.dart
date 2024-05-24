// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supergaletto/auth/firebase_auth/auth_util.dart';
import 'package:supergaletto/backend/firebase_storage/storage.dart';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

Future saveToFirestore(
  BuildContext context,
  FFUploadedFile? image,
) async {
  // give me a code to upload an image from gallery device to cloud storage
// Import necessary packages

// Get the current date and time
  final now = DateTime.now();

// Get reference to Firebase storage
  final FirebaseStorage storage = FirebaseStorage.instance;

  // Format the date and time as a string
  final formattedDateTime =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';

// Set the file name to the formatted date and time string
  final fileName = '$formattedDateTime.png';
  String directoryPath = '/users/' + currentUserUid + '/images';

  final storagePath = '$directoryPath/$fileName';
  var uint8List;

// Get reference to the image file
  // File file = File(image! as String);

// Get the file name
  // String fileName = Path.basename(file.path);

// Create a reference to the image file in Firebase storage
  // Reference ref = storage.ref().child("images/$fileName");

// Upload the image file to Firebase storage
  // UploadTask uploadTask = ref.putFile(image);

// Wait for the upload to complete
  // TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  if (image != null) {
    final bytes = await image.bytes;
    final file = File.fromRawPath(bytes!);
    uint8List = await file.readAsBytes();
    // Now you can use the uint8List to save the file to Firestore or any other storage service
  }

// Get the download URL of the uploaded image
  String downloadUrl = (await uploadData(storagePath, uint8List))!;

  FFAppState().photoProdutoUrl = downloadUrl;

// Save the download URL to Firestore
//Firestore.instance.collection('images').add({
//  'url': downloadUrl,
}
