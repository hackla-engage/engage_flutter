import 'package:flutter/material.dart';

class CategoryEntry {
  const CategoryEntry(this.id, this.title, this.icon, this.description);
  final int id;
  final String title;
  final IconData icon;
  final String description;
  bool operator ==(Object other) => other is CategoryEntry && other.id == this.id;
  int get hashCode => hashValues(this.id, this.title);
}

