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

import 'package:flutter/material.dart';
import 'package:shrine/detail.dart';
import 'package:shrine/favorite.dart';
import 'package:shrine/my.dart';
import 'package:shrine/search.dart';

import 'home.dart';
import 'login.dart';
import 'signUp.dart';
import 'model/product.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/favorites': (context) => const FavoriteHotelsPage(),
        '/mypage': (context) => MyPage(),
        '/signup': (context) => const SignUpPage(),
        '/detail': (context) => DetailPage(
            product: ModalRoute.of(context)!.settings.arguments as Product),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
