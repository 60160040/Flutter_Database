import 'package:flutter/material.dart';
import 'package:flutter_and_database/providers/transaction_provider.dart';
import 'package:flutter_and_database/screens/form_screen.dart';
import 'package:flutter_and_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'หน้าแรก'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: TabBarView(
          children: [
            HomeScreen(),
            FormScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.store),
              text: "รายการธุระกรรม",
            ),
            Tab(
              icon: Icon(Icons.add),
              text: "เพิ่มข้อมูล",
            ),
          ],
        ),
      ),
    );
  }
}

// initState()  =>
