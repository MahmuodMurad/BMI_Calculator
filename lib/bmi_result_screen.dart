import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;

  const BMIResultScreen({
    required this.result,
    required this.isMale,
  });

  String get resultPhrase{
    String resultText='';
    if(result>40){
      resultText='Morbidly Obese';
    }else if(result>34.9&&result<=39.9){
      resultText='Severely Obese';
    }else if(result>29.9&&result<=34.9){
      resultText='Obese';
    }else if(result>=25&&result<=29.9){
      resultText='Overweight';
    }else if(result>=18.5&&result<=24.9){
      resultText='Normal';
    }else{
      resultText='Underweight';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.red[900],
          ),
        ),
        //backgroundColor: Colors.white,
        title:
        Text(
          'Your BMI',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gender : ${isMale ? 'Male' : 'Female'}',
                    style: const TextStyle(
                      color:Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height:50.0),
                  Text(
                    'Result : ${result.toStringAsFixed(1)}',
                    style: const TextStyle(
                      color:Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height:50.0),
                    Text(
                      textAlign: TextAlign.center,
                      'Classification : $resultPhrase',
                      style: const TextStyle(
                        color:Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
