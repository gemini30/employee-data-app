// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import './employee.dart';
import 'package:http/http.dart' as http;

class Employees with ChangeNotifier {
  List<Employee> _emps = [
    // Employee(
    //     id: 'e1',
    //     name: 'Michael Scott',
    //     position: 'Regional Manager',
    //     contact: '9811001980',
    //     email: 'MichaelScott@mail.com',
    //     doj: DateTime(2002, 05, 30),
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/en/d/dc/MichaelScott.png?20111015043011'),
    // Employee(
    //     id: 'e2',
    //     name: 'Jim Halpert',
    //     position: 'Senior Paper Salesman',
    //     contact: '9811001123',
    //     email: 'JimHalpert@mail.com',
    //     doj: DateTime(2012, 04, 23),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgIRTOUWUvQazXqEaIxVt_xPq5BFE_0_0MkA&usqp=CAU'),
    // Employee(
    //     id: 'e3',
    //     name: 'Dwight Schrute',
    //     position: 'Asst to Reg Manager',
    //     contact: '9811001346',
    //     email: 'dwightSchrute@mail.com',
    //     doj: DateTime(2010, 11, 20),
    //     imageUrl:
    //         'https://akns-images.eonline.com/eol_images/Entire_Site/2020017/rs_1024x759-200117120856-1024-The-Office-Stress-Relief-2.jpg?fit=around%7C776:576&output-quality=90&crop=776:576;center,top'),
    // Employee(
    //     id: 'e4',
    //     name: 'Pam Beesly',
    //     position: 'Receptionist',
    //     contact: '9811003467',
    //     email: 'pamBeesly@mail.com',
    //     doj: DateTime(2013, 04, 23),
    //     imageUrl:
    //         'https://productplacementblog.com/wp-content/uploads/2019/06/HP-Monitor-Used-by-Jenna-Fischer-Pam-Beesly-in-The-Office-2-16.jpg'),
    // Employee(
    //     id: 'e7',
    //     name: 'Andy Bernard',
    //     position: 'Paper Salesman',
    //     contact: '9811015356',
    //     email: 'BDog@mail.com',
    //     doj: DateTime(2019, 02, 13),
    //     imageUrl:
    //         'https://deadicatedfans.com/wp-content/uploads/2020/11/andy-bernard-funny-quotes.jpg'),
    // Employee(
    //     id: 'e5',
    //     name: 'Kevin Malone',
    //     position: 'Accountant',
    //     contact: '9811012356',
    //     email: 'kevinMalone@mail.com',
    //     doj: DateTime(2011, 09, 13),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2TCA5XfIC6E2iWYBrzIdjetyjh_KXG6_udw&usqp=CAU'),
    // Employee(
    //     id: 'e10',
    //     name: 'Erin Hannon',
    //     position: 'Receptionist',
    //     contact: '9811015316',
    //     email: 'erinHannon@mail.com',
    //     doj: DateTime(2020, 07, 10),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK7RJ9_1rRbQkU3bUN2hi_m23Mn2OS6PvZ4Q&usqp=CAU'),
    // Employee(
    //     id: 'e9',
    //     name: 'Toby Flenderson',
    //     position: 'H.R. Manager',
    //     contact: '9811015356',
    //     email: 'toby@mail.com',
    //     doj: DateTime(2018, 07, 10),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN7vdioBuqbquMX6NYLv5akbfQU3q6dAVnog&usqp=CAU'),
    // Employee(
    //     id: 'e6',
    //     name: 'Angela Martin',
    //     position: 'Accountant',
    //     contact: '9811012356',
    //     email: 'AngelaMartin@mail.com',
    //     doj: DateTime(2010, 09, 13),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA6jRIadcDTg3irhMfLm-TWY45RkkF-57aTA&usqp=CAU'),
    // Employee(
    //     id: 'e8',
    //     name: 'Stanely Hudson',
    //     position: 'Sales Rep',
    //     contact: '9811015356',
    //     email: 'stanley@mail.com',
    //     doj: DateTime(2003, 01, 10),
    //     imageUrl:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9DnqE9OAocBo9Aq1-paISOJ7Ech5OzZBFQw&usqp=CAU'),
    // Employee(
    //     id: 'e11',
    //     name: 'Daryl Philibin',
    //     position: 'Supplies Head',
    //     contact: '9811015316',
    //     email: 'dartl@mail.com',
    //     doj: DateTime(2015, 07, 10),
    //     imageUrl:
    //         'https://external-preview.redd.it/UimuQeEHZUjgolT1qQPtzCcARRFLD8DcXBvuwkolWfo.jpg?width=640&crop=smart&auto=webp&s=0dc8a82cdfadf11db972254e0eeaf931514eefbe'),
    // Employee(
    //     id: 'e12',
    //     name: 'Creed Bratton',
    //     position: 'Quality Assurance',
    //     contact: '9811015316',
    //     email: 'creedB@mail.com',
    //     doj: DateTime(2000, 07, 10),
    //     imageUrl:
    //         'https://sm.ign.com/ign_in/screenshot/default/38ed8916-b159-43a9-a87a-4aca71953360-screen-shot-2018-03-08_5g35.png'),
  ];

  List<Employee> get emps {
    // Returing a copy of list of employees
    return [..._emps];
  }

  Employee findById(String empId) {
    return _emps.firstWhere((empl) => empl.id == empId);
  }

  Future<void> fetchAndSetEmpoyees() async {
    final url = Uri.https(
        'employee-data-fe35b-default-rtdb.firebaseio.com', '/Employee.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Employee> loadedEmployees = [];
      extractedData.forEach((empId, empData) {
        loadedEmployees.add(Employee(
            id: empId,
            name: empData['name'],
            position: empData['position'],
            contact: empData['contact'],
            email: empData['email'],
            doj: DateTime.parse(empData['doj']),
            imageUrl: empData['imageUrl']));
      });
      // ignore: avoid_print
      _emps = loadedEmployees;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> deleteEmployee(String id) async {
    final url = Uri.https('employee-data-fe35b-default-rtdb.firebaseio.com',
        '/Employee/$id.json');
    final existingEmployeeIndex = _emps.indexWhere((prod) => prod.id == id);
    var existingEmployee = _emps[existingEmployeeIndex];
    _emps.removeAt(existingEmployeeIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _emps.insert(existingEmployeeIndex, existingEmployee);
      notifyListeners();
    }
  }
}
