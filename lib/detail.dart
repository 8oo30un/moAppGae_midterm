import 'package:flutter/material.dart';
import 'model/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('가격: \$${product.price}'),
            const SizedBox(height: 10),
            Text('위치: ${product.location}'),
            const SizedBox(height: 10),
            Text('ID: ${product.id}'),
            const SizedBox(height: 10),
            Text('Featured: ${product.isFeatured ? 'Yes' : 'No'}'),
          ],
        ),
      ),
    );
  }
}
