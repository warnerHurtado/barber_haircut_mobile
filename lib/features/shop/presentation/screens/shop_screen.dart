import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  final String shopId;

  const ShopScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('BARBER VIEW $shopId'),
      ),
    );
  }
}
