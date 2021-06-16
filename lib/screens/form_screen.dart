import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // const FormScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

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
                autofocus: true,
                validator: (String? value) {
                  return (value!.isEmpty)
                      ? 'กรุณาป้อนชื่อรายการ'
                      : null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if(value!.isEmpty){
                    return 'กรุณาป้อนจำนวนเงิน';
                  }
                  if (double.parse(value) <= 0){
                    return 'กรุณาป้อนจำนวนเงินมากกว่า 0';
                  }
                  return null;
                  /*return (value!.isEmpty)
                      ? 'กรุณาป้อนจำนวนเงิน'
                      : null;*/
                },
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(Text("${formKey.currentState!.validate()}"));
                    Navigator.pop(context);
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
