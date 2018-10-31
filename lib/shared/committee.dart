import 'package:flutter/material.dart';

class Committee {
    final num id;
    final String name;
    final String email;
    final String timezone;
    final num latitude;
    final num longitude;
    const Committee(this.id, this.name, this.email, this.timezone, this.latitude, this.longitude);
}