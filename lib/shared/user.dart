import 'package:flutter/material.dart';

class User {
  const User(this.user, this.email, this.token);
  final String user;
  final String email;
  final String token;
  bool operator ==(Object other) => 
    other is User && other.email == this.email && other.token == this.token && this.user == other.user;
  int get hashCode => hashValues(this.email, this.token);
}