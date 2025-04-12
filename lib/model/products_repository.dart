import 'product.dart';

class ProductsRepository {
  static final ProductsRepository _instance = ProductsRepository._internal();
  factory ProductsRepository() => _instance;
  ProductsRepository._internal();

  // 내부 상태: Product 리스트를 유지
  final List<Product> _products = [
    const Product(
      id: 0,
      isFeatured: false,
      name: 'Oceanview Paradise',
      starCount: 4.2,
      location: 'New Chasetown',
      phoneNumber: '(112)150-4033x3845',
      description:
          'Until car family over which above. Simply much research happy. End any happen kid executive. Land doctor state. School forward stop list party.',
      url: 'assets/0-0.jpeg',
    ),
    const Product(
      id: 1,
      isFeatured: false,
      name: 'Skyline Retreat',
      starCount: 4.0,
      location: 'Gonzalesstad',
      phoneNumber: '330-505-7339',
      description:
          'No way so official wear structure. Close night choice former particular. Dinner candidate almost behavior build out.',
      url: 'assets/1-0.jpeg',
    ),
    const Product(
      id: 2,
      isFeatured: false,
      name: 'Mountain Bliss Hotel',
      starCount: 5.0,
      location: 'Foxbury',
      phoneNumber: '(096)978-1182',
      description:
          'Himself chance itself chair. Provide house computer surface force development rest.',
      url: 'assets/2-0.jpeg',
    ),
    const Product(
      id: 3,
      isFeatured: false,
      name: 'Urban Oasis',
      starCount: 3.9,
      location: 'Michaelmouth',
      phoneNumber: '999.408.2214',
      description:
          'Watch method how finally. Mr start draw effect their. Second cold baby news program. Tonight write bar everything lead. What prevent night boy police. Prove until why sense career reason hour.',
      url: 'assets/3-0.jpeg',
    ),
    const Product(
      id: 4,
      isFeatured: false,
      name: 'Sunset Serenity',
      starCount: 3.3,
      location: 'South Lauren',
      phoneNumber: '001-915-598-0307x15479',
      description:
          'Possible machine ready everybody anything. Political detail serious. Nature drug rise capital single. Whatever reality appear tough. Away hand war suffer computer early single.',
      url: 'assets/4-0.jpeg',
    ),
    const Product(
      id: 5,
      isFeatured: false,
      name: 'Golden Bay Resort',
      starCount: 4.7,
      location: 'Port Mark',
      phoneNumber: '001-770-801-6030x287',
      description:
          'South daughter end buy keep. Develop real arrive analysis blue member. Similar paper simple south eat energy middle. Simple TV reach section drive so news discuss.',
      url: 'assets/5-0.jpeg',
    ),
    const Product(
      id: 6,
      isFeatured: false,
      name: 'Lakeside Comfort',
      starCount: 3.0,
      location: 'Jonesbury',
      phoneNumber: '+1-604-243-2831x1921',
      description:
          'Before five technology show every her. Degree agree show fish. Spend position bill seem than can maybe. Attorney day human special discussion drop.',
      url: 'assets/6-0.jpeg',
    ),
    const Product(
      id: 7,
      isFeatured: false,
      name: 'Royal Horizon',
      starCount: 3.8,
      location: 'South Christopher',
      phoneNumber: '928-107-5640',
      description:
          'Early majority yeah nice receive power include. Matter college onto good. Want modern serve husband focus. Defense high deal sea however develop. Room visit light else.',
      url: 'assets/7-0.jpeg',
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
        url: old.url,
      );
    }
  }

  List<Product> getFeaturedProducts() {
    return _products.where((product) => product.isFeatured).toList();
  }

  void unfeatureProductById(int id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      final old = _products[index];
      _products[index] = Product(
        id: old.id,
        isFeatured: false,
        name: old.name,
        location: old.location,
        phoneNumber: old.phoneNumber,
        description: old.description,
        starCount: old.starCount,
        url: old.url,
      );
    }
  }

  Product getById(int id) => _products.firstWhere((p) => p.id == id);
}
