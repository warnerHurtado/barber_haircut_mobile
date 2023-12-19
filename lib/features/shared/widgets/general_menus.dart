import 'package:barber_haircut_mobile/features/auth/presentation/providers/providers.dart';
import 'package:barber_haircut_mobile/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barber_haircut_mobile/config/constants/menus_items.dart';

final navDrawerIndexLeftProvider = StateProvider<int>((ref) => 0);
final navDrawerIndexRightProvider = StateProvider<int>((ref) => 0);

class GeneralMenus extends ConsumerStatefulWidget {
  final Widget body;

  const GeneralMenus({super.key, required this.body});

  @override
  GeneralMenusState createState() => GeneralMenusState();
}

class GeneralMenusState extends ConsumerState<GeneralMenus> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Haircut barbershot'),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          })
        ],
      ),
      drawer: NavigationDrawer(
          selectedIndex: ref.watch(navDrawerIndexLeftProvider),
          onDestinationSelected: (value) {
            setState(() {
              ref.read(navDrawerIndexLeftProvider.notifier).state = value;
            });

            final menuItem = appMenuItemsLeft[value];

            context.push(menuItem.link);
            scaffoldKey.currentState?.closeDrawer();
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
              child: const Text('Main'),
            ),
            ...appMenuItemsLeft.map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('Otras opciones'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomFilledButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).logout();
                  },
                  text: 'Cerrar sesión'),
            ),
          ]),
      endDrawer: NavigationDrawer(
          selectedIndex: ref.watch(navDrawerIndexRightProvider),
          onDestinationSelected: (value) {
            setState(() {
              ref.read(navDrawerIndexRightProvider.notifier).state = value;
            });

            final menuItem = appMenuItemsRight[value];

            context.push(menuItem.link);
            scaffoldKey.currentState?.closeDrawer();
          },
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
              child: const Text('Settings'),
            ),
            ...appMenuItemsRight.map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            )
          ]),
      body: widget.body,
    );
  }
}
