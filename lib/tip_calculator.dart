import 'package:flutter/material.dart';

class tipcalculator extends StatefulWidget {
  @override
  _tipcalculatorState createState() => _tipcalculatorState();
}

class _tipcalculatorState extends State<tipcalculator> {
  int __percentage = 0;
  int __year = 1;
  double __amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Total Per Person",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "\$${calculate_amount(__percentage, __year, __amount)}",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.lightBlue.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on_outlined)),
                    onChanged: (String value) {
                      try {
                        __amount = double.parse(value);
                      } catch (e) {
                        __amount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Year",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (__year > 1) {
                                  __year--;
                                } else {}
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade50,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                "-",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$__year",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (__year >= 1) {
                                  __year++;
                                } else {}
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 50,
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade50,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(fontSize: 18),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Interest Rupees",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "\$${calculate_interest(__percentage, __year, __amount)}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$__percentage%",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        min: 0,
                        max: 20,
                        divisions: 10,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey,
                        value: __percentage.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            __percentage = value.round();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculate_interest(int percentage, int year, double amount) {
    double interest_amount = 0.0;
    if (__amount < 0 || __amount.toString().isEmpty || __amount == null) {
    } else {
      interest_amount = (__amount * percentage * year) / 100;
    }
    return interest_amount;
  }

  calculate_amount(int percentage, int year, double amount) {
    double total_amount = 0.0;

    total_amount = this.calculate_interest(percentage, year, amount) + __amount;

    return total_amount;
  }
}
