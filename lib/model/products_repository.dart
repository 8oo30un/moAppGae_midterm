import 'product.dart';

class ProductsRepository {
  static final ProductsRepository _instance = ProductsRepository._internal();
  factory ProductsRepository() => _instance;
  ProductsRepository._internal();

  // 내부 상태: Product 리스트를 유지
  final List<Product> _products = [
    const Product(
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 1,
      isFeatured: true,
      name: 'Stella sunglasses',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 2,
      isFeatured: false,
      name: 'Whitney belt',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 3,
      isFeatured: true,
      name: 'Garden strand',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 4,
      isFeatured: false,
      name: 'Strut earrings',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 5,
      isFeatured: false,
      name: 'Varsity socks',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 6,
      isFeatured: false,
      name: 'Weave keyring',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
    const Product(
      id: 7,
      isFeatured: true,
      name: 'Gatsby hat',
      starCount: 3,
      location: 'New York',
      phoneNumber: '123-456-7890',
      description:
          'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
    ),
  ];

  // 모든 제품 가져오기
  List<Product> getAllProducts() => _products;

  void toggleIsFeatured(int id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      final old = _products[index];
      _products[index] = Product(
        id: old.id,
        isFeatured: !old.isFeatured,
        name: old.name,
        location: old.location,
        phoneNumber: old.phoneNumber,
        description: old.description,
        starCount: old.starCount,
      );
    }
  }

  Product getById(int id) => _products.firstWhere((p) => p.id == id);
}
