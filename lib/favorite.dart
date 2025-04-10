import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class FavoriteHotelsPage extends StatefulWidget {
  const FavoriteHotelsPage({super.key});

  @override
  _FavoriteHotelsPageState createState() => _FavoriteHotelsPageState();
}

class _FavoriteHotelsPageState extends State<FavoriteHotelsPage> {
  final ProductsRepository _productsRepository = ProductsRepository();

  @override
  Widget build(BuildContext context) {
    List<Product> favoriteHotels = _productsRepository.getFeaturedProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Favorite Hotels'),
      ),
      body: ListView.builder(
        itemCount: favoriteHotels.length,
        itemBuilder: (context, index) {
          final hotel = favoriteHotels[index];

          return Dismissible(
            key: Key(hotel.name),
            direction: DismissDirection.endToStart, // 오른쪽에서 왼쪽으로 슬라이드
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                _productsRepository.unfeatureProductById(hotel.id);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${hotel.name} removed from favorites')),
              );
            },
            child: ListTile(
              title: Text(hotel.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          );
        },
      ),
    );
  }
}
