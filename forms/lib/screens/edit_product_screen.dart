import 'package:flutter/material.dart';
import 'package:shopapp/screens/user_products_screen.dart';
import '../providers/product.dart';
class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _priceFocusMode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  var _editedProduct = Product(
    id: '',
    title: '',
    price: 0,
    description: '',
    imageUrl: ''
  );
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  @override
  void initState() {
    // TODO: Setup image URL preview listener
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: Load existing product data
    // 1. Check if this is the first load
    // 2. Get product ID from route arguments
    // 3. If editing existing product, load its data
    // 4. Initialize form fields with product data
    // 5. Set image URL controller
    // 6. Mark initialization as complete
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    // TODO: Clean up form controllers
    // 1. Remove image URL preview listener
    // 2. Dispose of all focus nodes
    // 3. Dispose of image URL controller
    super.dispose();
  }
  // TODO: Implement image URL validation and preview
 void _updateImageUrl() {
    if(!_imageUrlFocusNode.hasFocus) {
      if(!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith(('https')) ||
      !_imageUrlController.text.endsWith('.png') &&
      !_imageUrlController.text.endsWith('.jpg') &&
      !_imageUrlController.text.endsWith('.jpeg')) {
        return;
      }
    }
    setState(() {

    });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(UserProductsScreen.routeName);
          },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(child: ListView(children: [
          TextFormField(
            initialValue: _initValues['title'],
            decoration: InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusMode);
            },
            validator: (value) {
              if(value!.isEmpty) {
                return 'Please enter title';
              }
              return null;
            },
            onSaved: (value) {
              _editedProduct = Product(id: _editedProduct.id, title: value!, description: _editedProduct.description, price: _editedProduct.price, imageUrl: _editedProduct.imageUrl);
            },
          ),
          TextFormField(
            initialValue: _initValues['price'],
            decoration: InputDecoration(labelText: 'Price'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusMode);
            },
            validator: (value) {
              if(value!.isEmpty) {
                return 'Please enter price';
              }
              return null;
            },
            onSaved: (value) {
              _editedProduct = Product(id: _editedProduct.id, title: value!, description: _editedProduct.description, price: _editedProduct.price, imageUrl: _editedProduct.imageUrl);
            },
          ),
          TextFormField(
            initialValue: _initValues['description'],
            decoration: InputDecoration(labelText: 'Description'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusMode);
            },
            validator: (value) {
              if(value!.isEmpty) {
                return 'Please enter description';
              }
              if(value.length < 10) {
                return 'Should be at least 10 characters long';
              }
              return null;
            },
            onSaved: (value) {
              _editedProduct = Product(id: _editedProduct.id, title: value!, description: _editedProduct.description, price: _editedProduct.price, imageUrl: _editedProduct.imageUrl);
            },
          ),
          TextFormField(
            initialValue: _initValues['imageUrl'],
            decoration: InputDecoration(labelText: 'Image URL'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusMode);
            },
            validator: (value) {
              if(value!.isEmpty) {
                return 'Please enter image URL';
              }
              return null;
            },
            onSaved: (value) {
              _editedProduct = Product(id: _editedProduct.id, title: value!, description: _editedProduct.description, price: _editedProduct.price, imageUrl: _editedProduct.imageUrl);
            },
          )
        ],)),
      )
    );
  }
}