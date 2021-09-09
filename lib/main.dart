import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
// _MyHomePageState createState() => _MyHomePageState();
}
final dbRef = FirebaseDatabase.instance.reference();

class HomeScreen extends StatelessWidget {

  final dbRef = FirebaseDatabase.instance.reference();

  TextEditingController accNumController = new TextEditingController();
  TextEditingController receiverAccNumController = new TextEditingController();
  TextEditingController reEnterReceiverAccNumController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 50
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 65
                        ),
                        child: Text("Fund Transfer (M-M)", style: TextStyle(color: Colors.white, fontSize: 16),),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 120,
                      bottom: 35,
                      left: 25,
                      right: 25
                  ),
                  child: Material(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListView(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ElevatedButton(
                                  child: const Text('Retrieve Data'),
                                  onPressed: () {
                                    _navigateToNextScreen(context);
                                  },
                                ),
                                SizedBox(height: 20),
                                Text("Account Number", style: TextStyle(fontSize: 14.0),),
                                SizedBox(height: 10),
                                TextField(
                                  controller: accNumController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '67588881',
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(12),
                                      hintStyle: TextStyle(fontSize: 14.0)
                                  ),
                                ),
                                Text("Receiver Account Number", style: TextStyle(fontSize: 14.0),),
                                SizedBox(height: 10),
                                TextField(
                                  controller: receiverAccNumController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Receiver Account Number',
                                      // prefixText: '675',
                                      prefixIcon: Container(
                                        color: Colors.black12,
                                        child: Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text("675"),
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(15),
                                      prefixStyle: TextStyle(backgroundColor: Colors.black12),
                                      hintStyle: TextStyle(fontSize: 14.0)
                                  ),
                                ),
                                Text("Re-Enter Receiver Account Number", style: TextStyle(fontSize: 14.0),),
                                SizedBox(height: 10),
                                TextField(
                                  controller: reEnterReceiverAccNumController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Receiver Account Number',
                                      prefixIcon: Container(
                                        color: Colors.black12,
                                        child: Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text("675"),
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(15),
                                      prefixStyle: TextStyle(backgroundColor: Colors.black12),
                                      hintStyle: TextStyle(fontSize: 14.0)
                                  ),
                                ),
                                Text("Amount", style: TextStyle(fontSize: 14.0),),
                                SizedBox(height: 10),
                                TextField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Amount',
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(12),
                                      hintStyle: TextStyle(fontSize: 14.0)
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                      value: this.checkboxValue,
                                      onChanged: (bool value) {
                                        // setState(() {
                                        this.checkboxValue = value;
                                        // });
                                      },
                                    ),
                                    Text("I agree to the Terms and Conditions", style: TextStyle(fontSize: 15.0),)
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 45,
                                    child: RaisedButton(
                                      child: Text("Proceed", style: TextStyle(color: Colors.white, fontSize: 16)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      onPressed: () {
                                        validateAccNum();
                                      },
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }


  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }

  void validateAccNum() {
    if (accNumController.text.length == 8 && accNumController.text.isNotEmpty) {
      validateReceiverAccNum();
    } else {
      Fluttertoast.showToast(
          msg: "Enter a valid Account Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      accNumController.clear();
    }
  }

  void validateReceiverAccNum() {
    if(receiverAccNumController.text == reEnterReceiverAccNumController.text) {
      validateAmount();
    } else {
      Fluttertoast.showToast(
          msg: "Re-entered Account Number Mismatched",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      reEnterReceiverAccNumController.clear();
    }
  }

  void validateAmount() {
    if(amountController.text.isNotEmpty) {
      validateCheckbox();
    } else {
      Fluttertoast.showToast(
          msg: "Enter a valid Amount",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  void validateCheckbox() {
    if(checkboxValue == true) {
      proceedData();
    } else {
      Fluttertoast.showToast(
          msg: "Indicate that you agree to the Terms and Conditions",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  void proceedData() {
    dbRef.child(accNumController.text).set({
      'accNumber': accNumController.text,
      'receiverAccNumber': '675' + receiverAccNumController.text,
      'amount': amountController.text
    });

    clearTextInput();
  }

  void clearTextInput() {
    accNumController.clear();
    receiverAccNumController.clear();
    reEnterReceiverAccNumController.clear();
    amountController.clear();
  }

}

class NewScreen extends StatelessWidget {

  List<Map<dynamic, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Retrieve Data')),
      body: Center(
        child: FutureBuilder(
            future: dbRef.once(), // this will retrieve the data only once

            /* Since this is asynchronous, then first the widget CircularProgressIndicator will be executed,
               then if the snapshot has data, the code inside the if block will get executed.
            */
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                items.clear();

                // value - retrieve the whole returned data
                Map<dynamic, dynamic> values = snapshot.data.value;

                // iterate and add the property values to the list.
                values.forEach((key, values) {
                  items.add(values);
                });
                
                return new ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(items[index]["accNumber"]);
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        color: Colors.blue,
                        child: Container(
                          margin: EdgeInsets.all(15),
                          // decoration: BoxDecoration(color: Colors.blue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Account Number: " + items[index]["accNumber"], style: TextStyle(color: Colors.white, fontSize: 16)),
                              Text("Amount: "+ items[index]["amount"], style: TextStyle(color: Colors.white, fontSize: 16)),
                              Text("Receiver Account Number: " +items[index]["receiverAccNumber"], style: TextStyle(color: Colors.white, fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
  
}