import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  //defining these 4 variable globally to access anywhere, TextEditingController keeps the input
  var nameController = TextEditingController();
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = Colors.white;
  var message = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text('BMI Calculator', style: TextStyle(fontSize: 30),)),
      ),

      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Text("Your Details", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 26),),
                ),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text("Enter your Name", style: TextStyle(color: Colors.grey),),
                      prefixIcon: Icon(Icons.perm_identity_rounded)
                  ),
                ),

                TextField(

                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your weight in Kg', style: TextStyle(color: Colors.grey),),
                      prefixIcon: Icon(Icons.monitor_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 10),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feet', style: TextStyle(color: Colors.grey),),
                      prefixIcon : Icon(Icons.man)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 10),

                TextField(

                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inches', style: TextStyle(color: Colors.grey),),
                    prefixIcon: Icon(Icons.man),
                  ),
                ),

                SizedBox(height: 15,),

                ElevatedButton(
                  onPressed: (){
                    var wt = wtController.text;
                    var ft = ftController.text;
                    var inch = inchController.text;
                    var name = nameController.text;
                    if(wt!="" && ft !="" && inch != ""){

                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);

                      var totalInches = (ift*12) + iinch;
                      var totalCm = totalInches * 2.54;
                      var totalMeter = totalCm/100;
                      var bmi = iwt/(totalMeter*totalMeter);

                      if(bmi > 25){
                        bgColor = Colors.yellowAccent.shade200;
                        message = "you are overweight";
                      }
                      else if(bmi < 18){
                        bgColor = Colors.redAccent.shade100;
                        message = "you are underweight";
                      }
                      else{
                        bgColor = Colors.green.shade300;
                        message = "you are Fit";
                      }

                      setState(() {

                        result =  "Hey $name BMI is ${bmi.toStringAsFixed(2)} & $message";
                      });

                    }
                    else{
                      setState(() {
                        result = "Please all the blanks !";
                      });
                    }
                  },
                  child: Text('Calculate', style: TextStyle(fontSize: 18),),
                ),

                SizedBox(height: 15),

                Text(result,style: TextStyle(color: Colors.blueAccent),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
