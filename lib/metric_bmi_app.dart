
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart'; // For Iconify Widget
import 'package:iconify_flutter_plus/icons/simple_line_icons.dart';
import 'package:flutter/material.dart';
int i=-1;
class BMIcalc_metric extends StatefulWidget{
  const BMIcalc_metric({super.key});
  @override
  State<BMIcalc_metric> createState() => _BMI();
}
class _BMI extends State<BMIcalc_metric>{
  final TextEditingController kg_control=TextEditingController();
  final TextEditingController cm_control=TextEditingController();
  final TextEditingController Age_controller =TextEditingController();
  double bmiresult=0.0;
  Color color_result =Colors.transparent;
  void findbmi( {required String kg_control,required String cm_control}){
    double wt =double.parse(kg_control);
    double ht=double.parse(cm_control)/100;
        //final double bmi=double.parse(kg_control)/((double.parse(cm_control)*(double.parse(cm_control)))/100*100);
    setState((){
    bmiresult=wt/(ht*ht);
    });
  }

  void clearResult(){
    setState(() {
      bmiresult=0.0;
      kg_control.clear();
      cm_control.clear();
      Age_controller.clear();
      i=-1;
    });
  }
 Map<String,Color> finalresult({required double bmiresult}){
    if (bmiresult<10)
    {
     return {"Invalid":Colors.black};
    }
    else if(bmiresult>=10 && bmiresult<=16)
    {
    return {'Severely Underweight':Colors.red};}
    else if(bmiresult>16 && bmiresult<=18.5)
    {
    return {'Underweight':Colors.orange};}
    else if(bmiresult>18.5 && bmiresult<=25)
    {
    return {'Healthy!':Colors.green};}
    else if(bmiresult>25 && bmiresult<=30)
    {
    return {'Overweight':Colors.yellow};}
    else if(bmiresult>30 && bmiresult<=35)
    {
    return {'Obese I':Colors.orange};}
    else 
    {
    return  {'Obese II':Colors.red};}

  }
  @override
  Widget build(BuildContext context) {
    final resultData = finalresult(bmiresult: bmiresult);
final resultText = resultData.keys.first;
final resultColor = resultData.values.first;
    return  Scaffold(
      resizeToAvoidBottomInset: true, 
      backgroundColor: Color.fromARGB(255, 117, 102, 159),

      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 49, 5, 63),
        title: const Text('BMI Calculator',style: TextStyle(color: Colors.white)),
        centerTitle: true,
    ),
    body: Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal:10.0),
    child: SingleChildScrollView( 
    child:Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _gender(),
      Text('Height',style: TextStyle(color: Colors.white),),
    SizedBox(height: 100,width:400,
    child: TextField(
      controller: cm_control,
      keyboardType: TextInputType.number,
      decoration:const InputDecoration(hintText: "cm",hintStyle: TextStyle(color:Colors.white),border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      iconColor:const Color.fromARGB(255, 49, 5, 63),
),
       
    ),),
      Text('Weight',style: TextStyle(color: Colors.white),),
      SizedBox( height: 100,width: 400,
      child: TextField(
      controller: kg_control,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(hintText: 'kg',hintStyle: TextStyle(color: Colors.white),border: OutlineInputBorder()
      ,contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      iconColor: const Color.fromARGB(255, 49, 5, 63)
      ),
    ),),
    Text('Age',style: TextStyle(color: Colors.white),),
          SizedBox(
            height:100,
            width:400,
            child: 
          TextField(
            controller: Age_controller,
            decoration:InputDecoration( 
              hintText: '00',
              hintStyle: TextStyle(color: Colors.white),
              border:OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            ),
          keyboardType: TextInputType.number,
          ),),
    const SizedBox(height: 20),
    // ignore: unused_label
    ElevatedButton(onPressed:(){if(kg_control.text.isNotEmpty && cm_control.text.isNotEmpty){
      findbmi(kg_control:kg_control.text, cm_control:cm_control.text);
      FocusManager.instance.primaryFocus?.unfocus();
    }
    
  }, child: const Text('Calculate my bmi',style: TextStyle(color: Colors.deepPurple),),),
    const SizedBox(height: 20),
    bmiresult >0.0 ? Container(width:double.infinity,
    padding: const EdgeInsets.all(10),
    decoration:BoxDecoration(
      color: const Color.fromARGB(255, 49, 5, 63),
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(children:[
      const Text('Your BMI',style: TextStyle(color: Colors.white)),
      const SizedBox(height:10),
      Text(
        bmiresult.toStringAsFixed(2),style: TextStyle(color: Colors.white
      ),),
      Text(resultText,style:TextStyle(color: resultColor,fontSize: 20,fontWeight: FontWeight.bold),),
    ],),
    )
    : const SizedBox.shrink(),
     const SizedBox(height:20),
     bmiresult >0 ?ElevatedButton(onPressed: (){clearResult();},child: const Text('CLEAR'),)
     :const SizedBox.shrink()
    ],
    )
    ),)
    
    ));
  }
  
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
      ,Text("Female",style: TextStyle(color: Colors.white),) 
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
      ,Text("Male",style:TextStyle(color: Colors.white)) 
      ],
  )
  ]
  ,)
  );
}
  
  }
