import 'package:flutter/material.dart';

class Fetchedscreen extends StatefulWidget {
  const Fetchedscreen({super.key});

  @override
  State<Fetchedscreen> createState() => _FetchedscreenState();
}

class _FetchedscreenState extends State<Fetchedscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'API Details Screen',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: const Center(child: Text('Data to be Fetchced',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
    );
  }
}
