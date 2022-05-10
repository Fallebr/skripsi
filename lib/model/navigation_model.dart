import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Kasir", icon: Icons.insert_chart),
  NavigationModel(title: "Report", icon: Icons.error),
  NavigationModel(title: "Inventaris", icon: Icons.search),
];
