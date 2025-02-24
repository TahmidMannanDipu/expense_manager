import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'data/expense_provider.dart';
import 'view/Screens/category_management_screen.dart';
import 'view/Screens/home_screen.dart';
import 'view/screens/tag_management_screen.dart'; // Corrected import path case

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize and create LocalStorage instance
  final localStorage = LocalStorage('expenses.json');
  await localStorage.ready;

  runApp(MyApp(localStorage: localStorage));
}

class MyApp extends StatelessWidget {
  final LocalStorage localStorage;

  const MyApp({Key? key, required this.localStorage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider(localStorage)),
      ],
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/manage_categories': (context) => CategoryManagementScreen(),
          '/manage_tags': (context) => TagManagementScreen(),
        },
      ),
    );
  }
}
