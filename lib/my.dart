import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Lottie 애니메이션 사용
import 'model/product.dart';
import 'detail.dart'; // 호텔 상세 페이지
import 'model/products_repository.dart'; // ProductsRepository import

class MyPage extends StatelessWidget {
  // ProductsRepository 인스턴스를 가져와서, isFeatured가 true인 호텔만 필터링
  final List<Product> favoriteHotels =
      ProductsRepository().getFeaturedProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 프로필 이미지, 이름, 학번
          const SizedBox(height: 16),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey, // 테두리 색상
                width: 1.0, // 테두리 두께
              ),
            ),
            child: ClipOval(
              child: Lottie.asset(
                'assets/lottie.json', // Lottie 애니메이션 경로
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '김우현', // 이름
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '22100157', // 학번
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 32),
          // "My Favorite Hotel List" 텍스트
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'My Favorite Hotel List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 즐겨찾기 호텔 리스트
          Expanded(
            child: ListView.builder(
              itemCount: favoriteHotels.length,
              itemBuilder: (context, index) {
                final hotel = favoriteHotels[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(
                              'Navigating to DetailPage with product: ${hotel.name}, id: ${hotel.id}');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                product: hotel, // 호텔 상세 페이지로 이동
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          hotel.assetName,
                          package: hotel.assetPackage,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              hotel.location,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
