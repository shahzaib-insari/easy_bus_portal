import 'package:EasyBus/providers/transaction.dart';

class Student {
  final String name;
  final String RegNo;
  final String email;
  final String password;
  final int contactNumber;
  final String selectRoute;
  List<Transaction> transactions;

  Student(
      {this.name,
      this.RegNo,
      this.email,
      this.password,
      this.contactNumber,
      this.selectRoute});
}
