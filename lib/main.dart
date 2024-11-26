import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'car_list_page.dart'; // Import Car List Page
import 'sales_list_page.dart'; // Import Sales List Page
import 'dealership_list_page.dart'; // Import Dealership List Page
import 'customerListPage.dart'; // Import Customer List Page

void main() {
  // Initialize sqflite_common_ffi for desktop or testing
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/Main': (context) => const MyHomePage(title: 'Flutter Application Home'),
        '/page1': (context) => const CustomerListPage(title: 'Customer List'), // Route for Customer List Page
        '/page2': (context) => CarListPage(), // Route for Car List Page
        '/page3': (context) => const DealershipListPage(), // Route for Dealership List Page
        '/page4': (context) => const SalesListPage(), // Route for Sales List Page
      },
      initialRoute: '/Main',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Define a common style for the buttons
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple, // Button background color
      foregroundColor: Colors.white, // Button text color
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/page1'); // Navigate to Customer List
                },
                child: const Text('Customer List'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/page2'); // Navigate to Car List
                },
                child: const Text('Car List'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/page3'); // Navigate to Dealership List
                },
                child: const Text('Car Dealership List'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/page4'); // Navigate to Sales List
                },
                child: const Text('Sales List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
