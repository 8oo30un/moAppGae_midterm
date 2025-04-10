import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'model/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

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
            Hero(
              tag: 'productImage_${product.id}',
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
                        return const SizedBox.shrink(); // 빈 별 숨김
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
                      Text(
                        product.location,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone,
                          size: 16, color: Colors.lightBlue),
                      const SizedBox(width: 4),
                      Text(
                        product.phoneNumber,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.blue, // 구분선 색상
                    thickness: 1, // 구분선 두께
                    height: 20, // 구분선 높이
                  ),
                  Text(
                      product.description ??
                          'This is a wonderful hotel with great amenities.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
