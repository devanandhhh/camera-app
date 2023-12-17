import 'dart:io';

import 'package:camera_app/screens/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    // print(images);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Screen2(
                          images: images,
                        )));
              },
              icon: const Icon(Icons.image))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              pickImageFromCamera();
            },
            child: const Text('Open Camera')),
      )),
    );
  }

//Future<File?>
  pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
       String addedImage = File(pickedImage!.path).path;
       images.add(addedImage);
  }
}
