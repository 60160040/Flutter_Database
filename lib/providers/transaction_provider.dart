import 'package:flutter/foundation.dart';
import 'package:flutter_and_database/models/Transaction.dart';

class TransactionProvider with ChangeNotifier{
  List<Transaction> transactions = [
    Transaction(title: "ซื้อหนังสือ",amount: 500,date:DateTime.now()),
    Transaction(title: "ซื้อเสื้อ",amount: 900,date:DateTime.now()),
    Transaction(title: "ซื้อกางเกง",amount: 400,date:DateTime.now()),
    Transaction(title: "นาฬิกา",amount: 1400,date:DateTime.now()),

  ];

  List<Transaction> getTransaction(){
    return transactions;
  }

  void addTransaction(Transaction statement){
    transactions.add(statement);
  }
}


