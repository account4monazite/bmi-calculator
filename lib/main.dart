// ignore: unused_import
import 'package:bmi_calculator/us_bmi_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:bmi_calculator/metric_bmi_app.dart';

void main(){
  runApp(MaterialApp(home:myApp(),debugShowCheckedModeBanner: false,
  ));
}

// ignore: camel_case_types
class myApp extends StatelessWidget{
  const myApp({super.key});
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 117, 102, 159),

    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 117, 102, 159),

      title: Text('Welcome to the BMI calculator'),
      centerTitle: true,
    ),
    body:Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/giphy.lottie.json"),
        ElevatedButton(onPressed: (){
          Navigator.push(
            context,MaterialPageRoute(builder: (context)=>BMIcalc_metric())
          );
        }, child: Text('Metric System',style: TextStyle(color: const Color.fromARGB(255, 49, 5, 63)),)),
        SizedBox(height:20),
        ElevatedButton(onPressed: (){
          Navigator.push(
            context,MaterialPageRoute(builder: (context)=>BMIcalc_us())
          );
        }, child: Text('Imperial System',style:TextStyle(color:const Color.fromARGB(255, 49, 5, 63))))
      ],
    ))
  );
  }


}
