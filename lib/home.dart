import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGridView = true; // To toggle between GridView and ListView

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 1.0),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < 5; i++)
                          Icon(
                            i < 4
                                ? Icons.star
                                : Icons.star_half, // 4개 별은 전체 별, 마지막은 반 별
                            color: Colors.amber,
                            size: 12.0, // 별 크기
                          ),
                      ],
                    ),
                    Text(
                      product.name,
                      style: theme.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w900),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      product.location, // Add location to product data
                      style: TextStyle(
                        fontSize: 8.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: product);
                      },
                      child: Text(
                        'more',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 10.0, // 텍스트 크기 작게 설정
                          color: Colors.blue, // 파란색 텍스트
                        ),
                      ),
                    )
                    // Align(
                    //   alignment: Alignment.bottomRight, // 오른쪽 하단에 배치
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0), // 여백을 주어 버튼을 살짝 띄움
                    //     child: TextButton(
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, '/detail',
                    //             arguments: product);
                    //       },
                    //       child: const Text(
                    //         'more',
                    //         style: TextStyle(
                    //           fontSize: 10.0, // 텍스트 크기 작게 설정
                    //           color: Colors.blue, // 파란색 텍스트
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _buildListCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Widget>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );

    return products.map((product) {
      return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.asset(
          product.assetName,
          package: product.assetPackage,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          product.name,
          style: theme.textTheme.titleLarge,
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.amber),
            Text('4.5'), // Add dynamic star rating
            const SizedBox(width: 8.0),
            Text(
              product.location, // Add location to product data
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail', arguments: product);
          },
          child: const Text('More'),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'language',
            ),
            onPressed: () {
              // Handle language change logic
            },
          ),
        ],
      ),

      // 👇 Drawer menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Pages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Favorite Hotels'),
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: <Widget>[
          ToggleButtons(
            children: const <Widget>[
              Icon(Icons.grid_on),
              Icon(Icons.list),
            ],
            isSelected: [_isGridView, !_isGridView],
            onPressed: (int index) {
              setState(() {
                _isGridView = index == 0;
              });
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Adjust the number of columns based on screen orientation
                int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                return _isGridView
                    ? GridView.count(
                        crossAxisCount: crossAxisCount,
                        padding: const EdgeInsets.all(16.0),
                        childAspectRatio: 8.0 / 9.0,
                        children: _buildGridCards(context),
                      )
                    : ListView(
                        children: _buildListCards(context),
                      );
              },
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
