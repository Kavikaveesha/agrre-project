import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
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
              .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
          final uploadTask = storageRef.putFile(_imageFile!);
          final TaskSnapshot downloadUrl = await uploadTask;
          final String imageUrl = await downloadUrl.ref.getDownloadURL();

          await FirebaseFirestore.instance.collection('products').add({
            'name': _nameController.text,
            'price': double.parse(_priceController.text),
            'description': _descriptionController.text,
            'category': _categoryController.text,
            'image_url': imageUrl,
          });

          // Clear form fields
          _nameController.clear();
          _priceController.clear();
          _descriptionController.clear();
          _categoryController.clear();
          setState(() {
            _imageFile = null;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select an image')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: const Text('Add Product'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Uploaded Products:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.docs.map((document) {
                      return ProductCard(
                        imageUrl: document['image_url'],
                        name: document['name'],
                        price: document['price'],
                        description: document['description'],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String description;

  ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${price.toStringAsFixed(2)}'),
            Text(description),
          ],
        ),
      ),
    );
  }
}
