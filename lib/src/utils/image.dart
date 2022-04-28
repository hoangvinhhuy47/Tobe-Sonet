import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGallery extends StatefulWidget {
  @override
  State<ImageGallery> createState() => _ImageGallery();
}

class _ImageGallery extends State<ImageGallery> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 250,
        width: size.width,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                selectImages();
              },
              child: Text('Select Images'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: imageFileList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
