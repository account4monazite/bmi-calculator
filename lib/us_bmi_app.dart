

// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_interpolation_to_compose_strings

import 'package:iconify_flutter_plus/iconify_flutter_plus.dart'; // For Iconify Widget
import 'package:iconify_flutter_plus/icons/simple_line_icons.dart';

import 'package:flutter/material.dart';

class BMIcalc_us extends StatefulWidget{
  const BMIcalc_us({super.key});
  @override
  BMicalc_us_state createState()=> BMicalc_us_state();}


class BMicalc_us_state extends State<BMIcalc_us>{
  int i=-1;

  
  final lbs_controller = TextEditingController();
  final feet_controller = TextEditingController();
  final inches_controller = TextEditingController();
  double BMI_result=0.0;

  void Find_bmi(String weight,String feet, String inches) {
  double wt_for_calc= (0.453592*double.parse(weight));
  
  double ht_for_calc= ((double.parse(feet)*30.48)+(double.parse(inches)*2.54))/100;
  
  setState(() {
    BMI_result=wt_for_calc/(ht_for_calc*ht_for_calc);
    });
  }
void clear(){
  setState(() {
    BMI_result=0.0;
    lbs_controller.clear();
    feet_controller.clear();
    inches_controller.clear();
    i=-1;
  });
}

Map<String,Color>finalresult({required double BMI_result}){
    if (BMI_result<10)
    {
     return {"Invalid":Colors.black};
    }
    else if(BMI_result>=10 && BMI_result<=16)
    {
    return {'Severely Underweight':Colors.red};}
    else if(BMI_result>16 && BMI_result<=18.5)
    {
    return {'Underweight':Colors.orange};}
    else if(BMI_result>18.5 && BMI_result<=25)
    {
    return {'Healthy!':Colors.green};}
    else if(BMI_result>25 && BMI_result<=30)
    {
    return {'Overweight':Colors.yellow};}
    else if(BMI_result>30 && BMI_result<=35)
    {
    return {'Obese I':Colors.orange};}
    else 
    {
    return {'Obese II':Colors.red};

  }}
@override
Widget build(BuildContext context){
  final resultData = finalresult(BMI_result: BMI_result);
final resultText = resultData.keys.first;
final resultColor = resultData.values.first;
  return  Scaffold(
    backgroundColor: Color.fromARGB(255, 117, 102, 159),

      resizeToAvoidBottomInset: true, 
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 49, 5, 63),
        title: const Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        centerTitle: true,),
 body: Center(child:
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:SingleChildScrollView(child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:/*<Widget>*/[
          _gender(),
          Text('Height',style: TextStyle(color: Colors.white)),//add more details
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
            height:100,
            width:200,child: TextField(
              controller: feet_controller,
              decoration: InputDecoration(
                hintText: 'ft',
                hintStyle: TextStyle(color: Colors.white),
                border:OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              ),
              ),
              
             SizedBox(
            height:100,
            width:200,
                child: TextField(
                controller: inches_controller,
              decoration: InputDecoration(
                hintText: 'inches',
                hintStyle: TextStyle(color: Colors.white),
                border:OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              ),
              ),
          ],
          ),
          Text('Weight',style: TextStyle(color: Colors.white))
          ,SizedBox(
            height:100,
            width:400, 
            child: TextField(
                controller: lbs_controller,
                decoration:InputDecoration(
                  hintText: 'Weight in lbs',
                  hintStyle: TextStyle(color: Colors.white),
                  border:OutlineInputBorder()
                ),
              keyboardType: TextInputType.number,
              ),),
             Text('Age',style: TextStyle(color: Colors.white)),
          SizedBox(
            height:100,
            width:400,
            child: 
          TextField(
            // controller: lbs_controller,
            decoration:InputDecoration( 
              hintText: '00',
             hintStyle: TextStyle(color: Colors.white),
              border:OutlineInputBorder()
            ),
          keyboardType: TextInputType.number,
          ),),
       // Calculate(),
       //SizedBox(height: 20.0),
        ElevatedButton(onPressed:(){if(lbs_controller.text.isNotEmpty && feet_controller.text.isNotEmpty && inches_controller.text.isNotEmpty){
      Find_bmi(lbs_controller.text,feet_controller.text,inches_controller.text);
      FocusManager.instance.primaryFocus?.unfocus();
    }
    
  },
    child: const Text('Calculate my BMI',style: TextStyle(color: Colors.white),),
    ),
          const SizedBox(height: 20.0),
          BMI_result>0.0? Container(width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration:BoxDecoration(
            color: const Color.fromARGB(255, 49, 5, 63),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:Column(children:[
           const Text('Your BMI:',style: TextStyle(color: Colors.white),),
           const SizedBox(height: 10.0,),
           Text(BMI_result.toStringAsFixed(2),style: TextStyle(color: Colors.white
      ),),
           Text(resultText,style: TextStyle(color:resultColor,fontSize: 20,fontWeight: FontWeight.bold),)
           
          ],
          ),
          ) : const SizedBox.shrink(), 
          const SizedBox(height:20),
          BMI_result>0?ElevatedButton(onPressed: (){clear();}, child: const Text ("CLEAR"),) 
        :const SizedBox.shrink()
        ],
          )
      )
            ),
)
);}


 Widget _gender(){
  return Container(
    height: 100,
    width: 400,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 49, 5, 63),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Column(
    children: [IconButton(
      iconSize: 60,
      onPressed:(){
        setState((){
         i=0;
        });
      }, icon:Iconify(SimpleLineIcons.symbol_female,color: i==0? Colors.pink:Colors.white),
      )
      ,Text("Female",style:TextStyle(color: Colors.white)) 
      ],
  ),
  Column(
    children: [IconButton(
      iconSize: 60,
      onPressed:(){
        setState((){
        i=1;
        });
      }, icon:Iconify(SimpleLineIcons.symbol_male,color: i==1? Colors.blueAccent:Colors.white),
      )
      ,Text("Male",style: TextStyle(color: Colors.white),) 
      ],
  )
  ]
  ,)
  );
}


}