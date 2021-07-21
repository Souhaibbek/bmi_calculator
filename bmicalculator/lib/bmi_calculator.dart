import 'dart:math';

import 'package:bmicalculator/bmi_result.dart';
import 'package:flutter/material.dart';


class BmiCalculator extends StatefulWidget {

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale=true;
  double height=120.0;
  int age=25;
  int weight =60;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body:Container(
        color: Colors.blue[900],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale=true;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.blue[200] : Colors.blue,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male,size: 100.0,color: Colors.white,),
                              SizedBox(height: 20.0,),
                              Text('MALE',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color:  !isMale ? Colors.blue[200] : Colors.blue,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,size: 100.0,color: Colors.white),
                              SizedBox(height: 20.0,),
                              Text('FEMALE',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(fontSize: 16.0,color: Colors.white),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w900,color: Colors.white),
                          ),
                          Text(
                            'cm',style: TextStyle(color: Colors.white,),
                          ),
                        ],
                      ),
                      Slider(
                          activeColor: Colors.blue[900],
                          inactiveColor: Colors.white,
                          value: height,
                          max: 220,
                          min: 80,
                          onChanged: (value)
                          {
                            setState(() {
                              height=value;
                            });
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                            Text('$weight',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'weight+',
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add_rounded,),
                                  backgroundColor: Colors.blue[900],
                                ),
                                SizedBox(width: 10.0,),
                                FloatingActionButton(
                                  heroTag: 'weight-',
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  backgroundColor: Colors.blue[900],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                            Text('$age',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'age+',
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.add_rounded,),
                                  backgroundColor: Colors.blue[900],
                                ),
                                SizedBox(width: 10.0,),
                                FloatingActionButton(
                                  heroTag: 'age-',
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  backgroundColor: Colors.blue[900],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MaterialButton(height: 50.0,onPressed: (){
                double result=weight / pow(height/100,2);
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context)=>BmiResult(result: result.round(),age: age,isMale: isMale,),
                  ),
                );
              },
                child: Text('CALCULATE',style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                minWidth: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
