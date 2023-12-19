import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/shared/shared.dart';
import '/features/shop/domain/domain.dart';
import '/features/shop/presentation/providers/providers.dart';

class ShopsScreen extends ConsumerStatefulWidget {
  const ShopsScreen({super.key});

  @override
  ShopsScreenState createState() => ShopsScreenState();
}

class ShopsScreenState extends ConsumerState<ShopsScreen> {
  @override
  Widget build(BuildContext context) {
    final shops = ref.watch(shopsProvider).shops;

    return GeneralMenus(
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 20),
          itemCount: shops.length,
          itemBuilder: (context, index) {
            return _ShopItem(shop: shops[index]);
          }),
    );
  }
}

class _ShopItem extends StatelessWidget {
  final Shop shop;

  const _ShopItem({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: GestureDetector(
          onTap: () {
            context.go('/shop/${shop.uid}');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadeInImage(
                image: NetworkImage('https://picsum.photos/id/10/600/350'),
                placeholder: AssetImage('assets/loaders/bottle-loader.gif'),
                height: 100,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      shop.description,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
