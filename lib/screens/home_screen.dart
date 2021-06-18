import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_and_database/models/Transactions.dart';
import 'package:flutter_and_database/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แอพบัญชี"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget? child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่มีสมาชิกในฐานข้อมูล",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
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
                          child:
                              Text(NumberFormat("#,###").format(data.amount)),
                          // child: Text(data.amount.toString()),
                        ),
                        radius: 30,
                      ),
                      title: Text(data.title),
                      subtitle:
                          Text(DateFormat("dd-mm-yyyy").format(data.date)),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

/*onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) {
return FormScreen();
}),
);
},*/
