import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFeatured; // 초기 값 설정
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'productImage_${product.id}',
                  child: Image.asset(
                    product.assetName,
                    // package: product.assetPackage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: InkWell(
                    onDoubleTap: () {
                      setState(() {
                        isFavorite = !isFavorite; // 상태 반전
                        ProductsRepository()
                            .toggleIsFeatured(product.id); // 데이터 변경
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      if (index < product.starCount.floor()) {
                        return const Icon(Icons.star,
                            color: Colors.amber, size: 16);
                      } else if (index < product.starCount &&
                          product.starCount % 1 != 0) {
                        return const Icon(Icons.star_half,
                            color: Colors.amber, size: 16);
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  ),
                  const SizedBox(height: 10),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        product.name,
                        textStyle: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.lightBlue),
                      const SizedBox(width: 4),
                      Text(product.location,
                          style: const TextStyle(color: Colors.lightBlue)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone,
                          size: 16, color: Colors.lightBlue),
                      const SizedBox(width: 4),
                      Text(product.phoneNumber,
                          style: const TextStyle(color: Colors.lightBlue)),
                    ],
                  ),
                  const Divider(color: Colors.blue, thickness: 1, height: 20),
                  Text(
                      product.description ??
                          'This is a wonderful hotel with great amenities.',
                      style: const TextStyle(
                          fontSize: 16, color: Colors.lightBlue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
