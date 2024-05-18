import 'package:flutter/material.dart';
import 'package:bmr_calcultor/main.dart';
import 'package:bmr_calcultor/result.dart';

class calculator extends StatefulWidget{
  const calculator({super.key});

  @override
  State<StatefulWidget> createState() => calculatorState();

}

class calculatorState extends State<calculator>{
  bool isfemale =false;
  double height = 120.0;
  int weight = 40;
  int age= 20;
  static double result=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI calculator"),
        centerTitle: true,
        ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Card(
                color: isfemale? Colors.pink : null,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      isfemale=true;
                    });
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.woman , size: 100,),
                      Text("female")
                    ],
                  ),
                ),
              )),
              Expanded(child: Card(
                color: isfemale? null : Colors.blue,
                child: InkWell(
                    onTap: (){setState(() { isfemale=false; });},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.man , size: 100), Text("male")]
                  )
                )
              )
              )
            ]
           )
          ),

          Expanded(child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("height"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${height.round()}",style: const TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold),),
                    const Text("cm")
                ],),
                Slider(value: height,
                  onChanged: (double value){
                    setState(() {
                      height=value;
                    });
                  },
                  min: 100,
                  max: 250,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                )
              ],
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("weight"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$weight", style: const TextStyle(fontSize: 60.0 ,fontWeight: FontWeight.bold),),
                        const Text("kg")
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(child: IconButton(
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            icon: const Icon(Icons.add)),),
                        const SizedBox(width: 5.0),
                        CircleAvatar(child: IconButton(
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            icon: const Icon(Icons.remove)),),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(child:Card(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("age"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$age", style: const TextStyle(fontSize: 60.0 ,fontWeight: FontWeight.bold),),
                      const Text("yr")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(child: IconButton(
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          icon: const Icon(Icons.add)),),
                      const SizedBox(width: 5.0),
                      CircleAvatar(child: IconButton(
                          onPressed: (){
                            setState(() {
                              if (age>1)  age--;
                            });
                          },
                          icon: const Icon(Icons.remove)),),
                    ],
                  )
                ],
              )),)
            ],
          )),
          ElevatedButton(
            onPressed: (){
              if (isfemale){
                result=66+(13.7*weight)+(5*height)-(6.8*age);
              }
              else{
                result=655+(9.6*weight)+(1.8*height)-(4.7*age);
              }
              Navigator.of(context).pushNamed("result");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 120)
            ),
            child: const Text(
              "calculate",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),) ,
          )

        ],
      ),
      );
  }

}