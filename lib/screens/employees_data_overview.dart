// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/employees_provider.dart';
// import '../models/employee.dart';
// import '../widgets/employee_card.dart';
import '../widgets/employee_grid.dart';

class EmployeeDataOverview extends StatefulWidget {
  EmployeeDataOverview({Key? key}) : super(key: key);

  @override
  State<EmployeeDataOverview> createState() => _EmployeeDataOverviewState();
}

class _EmployeeDataOverviewState extends State<EmployeeDataOverview> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Employees>(context).fetchAndSetEmpoyees().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMPLOYEES'),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const EmployeesGrid(),
    );
  }
}
