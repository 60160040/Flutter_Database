import 'package:flutter/material.dart';
import 'package:flutter_and_database/main.dart';
import 'package:flutter_and_database/models/Transactions.dart';
import 'package:flutter_and_database/providers/transaction_provider.dart';
import 'package:flutter_and_database/main.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  // const FormScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  // controller
  final titleController = TextEditingController(); // รับค่าชื่อรายการ
  final amountController = TextEditingController(); // รับค่าตัวเลขจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: false,
                controller: titleController,
                validator: (String? value) {
                  // ไม่ได้กรอกข้อมูล
                  if (value!.isEmpty) {
                    return "กรุณาป้อนชื่อ";
                  }
                  return null;
                  // *1
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  // ไม่ได้กรอกข้อมูล
                  if (value!.isEmpty) {
                    return 'กรุณาป้อนจำนวนเงิน';
                  }
                  // เงินติดลบ
                  if (double.parse(value) <= 0) {
                    return 'กรุณาป้อนจำนวนเงินมากกว่า 0';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    // เตรียมข้อมูล
                    Transactions statement = Transactions(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now());

                    // เรียก Provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return MyHomePage(title: "หน้าแรก");
                        },
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text('เพิ่มข้อมูล'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
  // 1
  return (value!.isEmpty)
   ? 'กรุณาป้อนชื่อรายการ'
   : null;
*/
