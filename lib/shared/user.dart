import 'package:flutter/material.dart';

class User {
  const User(this.email, this.token);
  final String email;
  final String token;
  bool operator ==(Object other) => 
    other is User && other.email == this.email && other.token == this.token;
  int get hashCode => hashValues(this.email, this.token);
}