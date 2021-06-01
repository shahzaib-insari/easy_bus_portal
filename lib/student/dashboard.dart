import 'package:EasyBus/loginBody/chart.dart';
import 'package:EasyBus/loginBody/transaction_list.dart';
import 'package:EasyBus/student/drawer.dart';
import 'package:flutter/material.dart';
import '../providers/transaction.dart';

class StudentDashboardScreen extends StatefulWidget {
  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', price: 30, date: DateTime.now()),
    Transaction(id: 't2', price: 40.67, date: DateTime.now()),
    Transaction(id: 't3', price: 101.5, date: DateTime.now())
  ];

  List<Transaction> get _updatedMainTransaction {
    return _userTransaction.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void DeleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My DashBoard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/glowing-neon-symbol-bus.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 240, top: 20),
              height: 40,
              width: 135,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 4, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 20,
                    ),
                    Text("View Location"),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                boxShadow: [
                  BoxShadow(
                      color: Colors.purple[200],
                      blurRadius: 6,
                      offset: Offset(2, 2))
                ],
                //border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 160, left: 70),
              child: Text(
                "DashBoard",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0, left: 15, right: 15),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    color: Colors.purple[50],
                    shadowColor: Colors.purple[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Container(
                      height: 220,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [Text("Selected Route")],
                              ),
                              Column(
                                children: [Text("Route Number ")],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Total Rides"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("\$123(tempeorary price)"),
                                  Text("Price (as text)")
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple[200],
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            height: 150,
                            width: 300,
                            //children: [Text("Chart")],
                            child: Chart(_updatedMainTransaction),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 60),
                    child: Text(
                      "Yours Transaction",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.purple[200],
                            blurRadius: 3,
                            offset: Offset(2, 2))
                      ],
                      //border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.only(left: 10),
                    height: 200,
                    width: 300,
                    child: TransactionList(
                      _userTransaction,
                      DeleteTransaction,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
