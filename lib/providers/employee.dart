import 'package:flutter/material.dart';
// import '';

class Employee with ChangeNotifier {
  final String id;
  final String name;
  final String position;
  final int contact;
  final String email;
  final DateTime doj;
  final String imageUrl;

  Employee({
    required this.id,
    required this.name,
    required this.position,
    required this.contact,
    required this.email,
    required this.doj,
    required this.imageUrl,
  });

  bool checkYearsActive() {
    final date1 = doj;
    final date2 = DateTime.now();
    final numOfYears = (date2.difference(date1).inDays / 365).floor();
    if (numOfYears >= 5) {
      return true;
    } else {
      return false;
    }
  }
}
