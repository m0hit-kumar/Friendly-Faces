import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  final File? imageFile;
  final Function(File?) onImageSelected;

  const ImagePickerDialog({
    Key? key,
    required this.imageFile,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  late File? _imageFile;

  @override
  void initState() {
    _imageFile = widget.imageFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Choose an image'),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 100,
        child: Center(
          child: _imageFile != null
              ? Image.file(_imageFile!)
              : const Icon(Icons.image, size: 50),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                _imageFile = File(pickedFile.path);
              });
              widget.onImageSelected(_imageFile);
            }
          },
          child: const Text('From Gallery'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.camera);
            if (pickedFile != null) {
              setState(() {
                _imageFile = File(pickedFile.path);
              });
              widget.onImageSelected(_imageFile);
            }
          },
          child: const Text('From Camera'),
        ),
      ],
    );
  }
}
