import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AdArticalePage extends StatefulWidget {
  @override
  _AdArticalePageState createState() => _AdArticalePageState();
}

class _AdArticalePageState extends State<AdArticalePage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  late TextEditingController _titleController;
  late TextEditingController _linkController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _linkController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _linkController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  Future<void> _uploadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _addProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (_imageFile != null) {
          final Reference storageRef = FirebaseStorage.instance
              .ref()
              .child('artical_images/${DateTime.now().millisecondsSinceEpoch}');
          final uploadTask = storageRef.putFile(_imageFile!);
          final TaskSnapshot downloadUrl = await uploadTask;
          final String imageUrl = await downloadUrl.ref.getDownloadURL();

          await FirebaseFirestore.instance.collection('articals').add({
            'title': _titleController.text,
            'link': _linkController.text,
            'description': _descriptionController.text,
            'category': _categoryController.text,
            'image_url': imageUrl,
          });

          // Clear form fields
          _linkController.clear();
          _titleController.clear();
          _descriptionController.clear();
          _categoryController.clear();
          setState(() {
            _imageFile = null;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Artical added successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select an image')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add Artical: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Artical'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_imageFile != null) Image.file(_imageFile!, height: 150),
              ElevatedButton(
                onPressed: _uploadImage,
                child: const Text('Upload Image'),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Artical Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Artical Title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration:
                    const InputDecoration(labelText: 'Artical Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Artical Category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 6,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _linkController,
                decoration: const InputDecoration(labelText: 'link'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: const Text('Add Artical'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
