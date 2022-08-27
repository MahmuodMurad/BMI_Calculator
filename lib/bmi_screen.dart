import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale=true;
  double height=170.0;
  double weight=40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title:
              Text(
                  'BMI Calculator',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
           ),
      body: SafeArea(
        child: Container(
          color: Colors. black54,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'GENDER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: isMale==true?Colors.white:Colors.white54,
                              ),
                              width: 140,
                              height: 40,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 20.0,
                                    color: Colors.red[900],
                                  ),
                                  const SizedBox(width: 10.0,),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width:20.0,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: isMale==true?Colors.white54:Colors.white,
                              ),
                              width: 140,
                              height: 40,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: 20.0,
                                    color: Colors.red[900],
                                  ),
                                  const SizedBox(width: 10.0,),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),

                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                         mainAxisAlignment: MainAxisAlignment.center,
                         textBaseline: TextBaseline.alphabetic,
                         children: [
                           Text(
                            '${height.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                           const Text(
                             'CM',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 8.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),

                      const SizedBox(height: 20.0,),
                      Slider(
                          value: height,
                          min: 80,
                          max: 220,
                          onChanged: (value){
                            setState(() {
                              height=value;
                            });
                          },
                        activeColor: const Color(0xff9C1212 ),
                        inactiveColor: Colors.red[200],
                        thumbColor: Colors.white70,
                        label: 'value',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${weight.round()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'KG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Slider(
                        value: weight,
                        min: 30,
                        max: 250,
                        onChanged: (value){
                          setState(() {
                            weight=value;
                          });
                        },
                        activeColor: const Color(0xff9C1212 ),
                        inactiveColor: Colors.red[200],
                        thumbColor: Colors.white70,
                        label: 'value',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FloatingActionButton.large(
                    onPressed: (){
                      double result = weight / pow(height / 100, 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)  => BMIResultScreen(
                            isMale: isMale,
                            result: result,
                          ),
                        ),
                      );
                    },
                    backgroundColor: Colors.white,
                    splashColor: Colors.white54,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.red[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
