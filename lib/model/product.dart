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

class Product {
  const Product({
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.location,
    required this.starCount,
    required this.phoneNumber,
    required this.description,
    required this.url,
  });

  final int id;
  final bool isFeatured;
  final String name;
  final String location; // Add location to product data
  final String phoneNumber; // Add phone number to product data
  final String description; // Add description to product data
  final double starCount;
  final String url; // 이미지 경로

  String get assetName => url; // 이미지 경로 반환
  // String get assetPackage => 'assets';

  @override
  String toString() => "$name (id=$id)";
}
