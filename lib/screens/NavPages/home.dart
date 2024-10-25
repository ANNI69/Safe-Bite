import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as ShadCn;

import '../../widgets/Alerts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();

  Future<void> openCamera() async {
    // Pick an image from the camera
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File imageFile = File(image.path);
      // Handle the captured image file
      print("Image captured at path: ${imageFile.path}");
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home',
            style: TextStyle(color: Colors.white, fontFamily: 'Nexa')),
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.history),
          Icon(Icons.person),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Alerts();
        },
        child: const Icon(Icons.camera_alt_outlined),
        backgroundColor: Colors.white,
      ),
    );
  }
}
