import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_and_database/providers/transaction_provider.dart';
import 'package:flutter_and_database/screens/form_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/Transactions.dart';

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
        home: MyHomePage(title: 'แอพบัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormScreen();
              }));
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget? child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text("ไม่มีสมาชิกในฐานข้อมูล",style: TextStyle(fontSize: 20),),
            );
          }else{
            return ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text(NumberFormat("#,###").format(data.amount)),
                          // child: Text(data.amount.toString()),
                        ),
                        radius: 30,
                      ),
                      title: Text(data.title),
                      subtitle: Text(DateFormat("dd-mm-yyyy").format(data.date)),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
