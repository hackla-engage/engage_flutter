import 'package:flutter/material.dart';



class CategoryEntry {
  const CategoryEntry(this.title, this.icon, this.description);
  final int id;
  final String title;
  final IconData icon;
  final String description;
}

const List<CategoryEntry> _choices = const<CategoryEntry>[
  const CategoryEntry("Infrastructure", Icons.store, "Infastructure would include agendas dealing " +
  "with basic structures and facilities (e.g., buildings, roads, and power) needed for the city"
  ),
  const CategoryEntry("Bicycle", Icons.directions_bike, "bikes bikes bikes bikes"
  ),
  const CategoryEntry("Housing", Icons.home, "mi cassa, tu cassa"
  ),
  const CategoryEntry("Environment", Icons.bug_report, "environment"
  ),
];