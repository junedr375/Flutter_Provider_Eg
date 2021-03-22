import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providereg/Home/Home.dart';

import 'package:providereg/Model/ItemModel.dart';
import 'package:providereg/Model/bgColorMode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BgColorProvider>(
            create: (context) => BgColorProvider(),
          ),
          ChangeNotifierProvider<CartItemListProvider>(
            create: (context) => CartItemListProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Privider Eg',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home()));
  }
}

// ChangeNotifierProvider(
//         create: (context) => BgColorProvider(),
//         child:

// ChangeNotifierProvider(
//         create: (context) => BgColorProvider(),
//         child: ChangeNotifierProvider(
//             create: (context) => CartItemListProvider(),
//             child:
