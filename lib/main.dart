import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
final TextEditingController _heightController=TextEditingController();
final TextEditingController _weightController=TextEditingController();
double _result=0;

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              "BMI Calculator"
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.pinkAccent,
                        border: OutlineInputBorder(),
                          hintText: "Height:"
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.pinkAccent,
                        border: OutlineInputBorder(),
                        hintText: "Weight:"
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    CalculateBMI();
                  },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                        primary: Colors.deepPurpleAccent
                      ),
                      child: Text("calculate",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                  _result==null? "enter value" :"${_result.toStringAsFixed(2)}",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void CalculateBMI(){
    double height=double.parse(_heightController.text)/100;
    double weight=double.parse(_weightController.text);
    double heightSquare=height*height;
    double result=weight/heightSquare;
    _result=result;
    setState(() {

    });

  }
}
