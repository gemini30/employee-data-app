import '../widgets/employee_card.dart';

import '../providers/employees_provider.dart';
import 'package:flutter/material.dart';
// import '../models/employee.dart';
import 'package:provider/provider.dart';

class EmployeesGrid extends StatelessWidget {
  const EmployeesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeData = Provider.of<Employees>(context);
    final emplyoees = employeeData.emps;
    return GridView.builder(
      itemCount: emplyoees.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: emplyoees[i],
        child: EmployeeCard(
            // emplyoees[i].id,
            // emplyoees[i].name,
            // emplyoees[i].imageUrl,
            // emplyoees[i].position,
            // emplyoees[i].yearsActive,
            ),
      ),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
