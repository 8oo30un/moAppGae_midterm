import 'package:flutter/material.dart';

class FavoriteHotelsPage extends StatelessWidget {
  const FavoriteHotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Hotels'),
      ),
      body: const Center(
        child: Text('This is the Favorite Hotels Page'),
      ),
    );
  }
}
