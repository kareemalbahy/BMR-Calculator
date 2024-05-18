import 'package:bmr_calcultor/claculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget{
  const result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)
        ),
        title: const Text("BMR result"),
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          const Expanded(child: Center(child: Text("your result",style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold)))),
          Expanded(
            flex: 5,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("BMR = ",style: TextStyle(fontSize: 30.0),),
                                Text(calculatorState.result.toStringAsFixed(2),
                                  style: const TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),
                                ),
                                const Text("calories/day")
                              ],
                            ),
                          ),
                        )
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 120)
                      ),
                      child: const Text(
                        "recalculate",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),) ,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

}