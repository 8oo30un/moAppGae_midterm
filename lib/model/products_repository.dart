// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts() {
    const allProducts = <Product>[
      Product(
        id: 0,
        isFeatured: true,
        name: 'Vagabond sack',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 1,
        isFeatured: true,
        name: 'Stella sunglasses',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 2,
        isFeatured: false,
        name: 'Whitney belt',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 3,
        isFeatured: true,
        name: 'Garden strand',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 4,
        isFeatured: false,
        name: 'Strut earrings',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 5,
        isFeatured: false,
        name: 'Varsity socks',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
        id: 6,
        isFeatured: false,
        name: 'Weave keyring',
        starCount: 3,
        location: 'New York',
        phoneNumber: '123-456-7890',
        description:
            'Stella sunglasses are a stylish and functional accessory that provides UV protection while enhancing your look. With a variety of frame styles and lens colors, they are perfect for any occasion.',
      ),
      Product(
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

    return allProducts;
  }
}
