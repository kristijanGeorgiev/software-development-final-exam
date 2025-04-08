import 'package:flutter/material.dart';

class ProductDetailWidget extends StatelessWidget {
  final String id;
  final List<String> types;
  final String title;
  final String image;
  final int price;
  final String description;

  const ProductDetailWidget({
    super.key,
    required this.id,
    required this.types,
    required this.title,
    required this.image,
    required this.price,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dinosaur Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Dinosaur Name
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 10),

            // Dinosaur Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Types: ${types.join(", ")}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('Price: $price dollars'),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}