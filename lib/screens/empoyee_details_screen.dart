// ignore_for_file: use_key_in_widget_constructors

import '../providers/employees_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  // final String name;
  // const EmployeeDetailsScreen(this.name);
  static const routeName = '/employee-detail';
  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7.5)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      height: 150,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final empId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedEmployee =
        Provider.of<Employees>(context, listen: false).findById(empId);
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(selectedEmployee.doj);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          selectedEmployee.name,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedEmployee.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('  Employee Details  ', context),
            buildContainer(
              Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(
                            'NAME:    ${selectedEmployee.name}\n\nPOSITION:   ${selectedEmployee.position}\n\nDATE OF JOINING:   $formattedDate\n\nEMAIL:   ${selectedEmployee.email}\n\nCONTACT:  ${selectedEmployee.contact}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
