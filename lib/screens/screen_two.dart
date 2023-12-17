import 'dart:io';

import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final List<String> images;
  const Screen2({Key? key, required this.images}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gallary'),
          elevation: 1,
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              File image = File(widget.images[index]);
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(image), fit: BoxFit.fill),
                    ),
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 150,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.images.removeAt(index);
                        });
                      },
                      child: const Icon(
                        Icons.delete,
                        size: 27,
                      ),
                    )),
              ]);
            }));
  }
}
