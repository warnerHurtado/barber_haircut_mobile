import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItemsRight = [
  MenuItem(
      title: 'Theme settings',
      subtitle: 'Change colors',
      link: '/theme-settings',
      icon: Icons.color_lens)
];

const List<MenuItem> appMenuItemsLeft = [
  MenuItem(
      title: 'Home',
      subtitle: 'Home content',
      link: '/',
      icon: Icons.home_max_outlined),
  MenuItem(
      title: 'Theme settings',
      subtitle: 'Change colors',
      link: '/theme-settings',
      icon: Icons.color_lens)
];
