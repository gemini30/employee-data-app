import 'package:flutter/material.dart';
import 'screens/employees_data_overview.dart';
import './models/palette.dart';
import './screens/empoyee_details_screen.dart';
import './providers/employees_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Employees(),
      child: MaterialApp(
          title: 'EmployeeData',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: createMaterialColor(const Color(0xFF4d1a00)))
                .copyWith(
                    secondary: createMaterialColor(const Color(0xFFEAECC6))),
          ),
          home: EmployeeDataOverview(),
          routes: {
            EmployeeDetailsScreen.routeName: (ctx) => EmployeeDetailsScreen(),
          }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Data'),
      ),
      body: const Center(
        child: Text('Employee Data'),
      ),
    );
  }
}
