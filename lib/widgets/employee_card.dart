// ignore_for_file: use_key_in_widget_constructors

import '../providers/employee.dart';
import '../screens/empoyee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeCard extends StatelessWidget {
  // final String id;
  // final String name;
  // final String imageUrl;
  // final String position;
  // final double yearsActive;

  // const EmployeeCard(
  //     this.id, this.name, this.imageUrl, this.position, this.yearsActive);

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<Employee>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(EmployeeDetailsScreen.routeName,
              arguments: employee.id);
        },
        child: GridTile(
          child: Image.network(
            employee.imageUrl,
            fit: BoxFit.fill,
          ),
          footer: Consumer<Employee>(
            builder: (ctx, employee, child) => (GridTileBar(
              title: child,
              backgroundColor: employee.checkYearsActive()
                  ? Colors.teal.shade800
                  : Theme.of(context).colorScheme.primary,
            )),
            child: Text(
              '${employee.name}\n${employee.position}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
