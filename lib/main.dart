import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List numbers = [];
  List sorted = [];
  num n, mayor, menor, avg;
  String value;
  int group = 1;
  String result = "";
  String collection = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.07,
            MediaQuery.of(context).size.height * 0.2,
            MediaQuery.of(context).size.width * 0.07,
            MediaQuery.of(context).size.height * 0.03,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF8F8F8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              n = n;
                            } else {
                              n = int.parse(value);
                            }
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Insert number",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      )),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                if (n == null) {
                                  print("hola");
                                } else {
                                  numbers.add(n);
                                  collection = numbers.toString();
                                }
                              });
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Add to Collection",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Roboto",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                numbers.clear();
                                collection = numbers.toString();
                              });
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Delete Collection",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Roboto",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05)),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Collection",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.10,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Center(
                            child: Text(collection,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Radio(
                            value: 1,
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                group = value;
                              });
                            }),
                        Text("Bigger-num"),
                      ]),
                      Column(children: [
                        Radio(
                            value: 2,
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                group = value;
                              });
                            }),
                        Text("minor-num")
                      ]),
                      Column(children: [
                        Radio(
                            value: 3,
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                group = value;
                              });
                            }),
                        Text("Order"),
                      ]),
                      Column(children: [
                        Radio(
                            value: 4,
                            groupValue: group,
                            onChanged: (value) {
                              setState(() {
                                group = value;
                              });
                            }),
                        Text("Average"),
                      ]),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              mayor = numbers[0];
                              menor = numbers[numbers.length - 1];
                              avg = 0;
                              num suma = 0;
                              setState(() {
                                if (group == 1) {
                                  for (int x = 0; x < numbers.length; x++) {
                                    if (numbers[x] > mayor) {
                                      mayor = numbers[x];
                                    }
                                  }
                                  result = mayor.toString();
                                } else if (group == 2) {
                                  for (int x = 0; x < numbers.length; x++) {
                                    if (menor > numbers[x]) {
                                      menor = numbers[x];
                                    }
                                  }
                                  result = menor.toString();
                                } else if (group == 3) {
                                  setState(() {
                                    numbers.sort();
                                    result = numbers.toString();
                                  });
                                } else if (group == 4) {
                                  for (int x = 0; x < numbers.length; x++) {
                                    suma += numbers[x];
                                    avg = suma / numbers.length;
                                  }
                                  result = avg.toStringAsFixed(2);
                                }
                              });
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Calculate",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Roboto",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text("Result",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Center(
                                child: Text(result,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ),
                            ],
                          )),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
