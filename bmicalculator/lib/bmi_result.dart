import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BmiResult extends StatelessWidget {

   final bool isMale ;
   final int age;
   final int result;

   BmiResult({ required this.isMale ,required this.age, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('BMI RESULT',),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isMale? 'Gender : Male' : 'Gender : Female',style: TextStyle(fontSize: 25,color: Colors.white),),
                Text('Age : $age',style: TextStyle(fontSize: 25,color: Colors.white),),
                SizedBox(height: 30.0,),
                Text('Result is $result',style:TextStyle(fontSize: 35,color: Colors.blue[900]),),
              ],
            ),

      ),
        ),
      ),
    );
  }
}
