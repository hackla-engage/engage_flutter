import 'package:flutter/material.dart';

class AgendaEntry {
  final String tag;
  final int id;
  final String title;
  final String summary;
  final String department;
  final String background;
  final String supplemental;
  final String sponsors;
  final int agenda;
  const AgendaEntry(this.id, this.title, this.tag, this.summary, this.department, this.background, this.supplemental, this.sponsors, this.agenda);
}