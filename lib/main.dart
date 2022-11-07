import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var x = 60;
  void add_inc() {setState(() {
    x++;
  });}
  void sub_dec() {setState(() {
    x--;
  });}
  double height = 100;
  var BMI=(((60*10000/(100*100))*100).roundToDouble())/100;
  void calculateBMI(){
    setState(() {
      BMI=x*10000/(height*height);
      BMI=BMI*100;
      BMI=BMI.roundToDouble();
      BMI=BMI/100;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Select your height",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            height:75,
            width: 400,
            color: Colors.cyanAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Height (in cm) : ${height.round()}",
                    style : TextStyle(
                        fontSize: 20,
                    )
                ),
                Slider(value: height, min: 50, max: 300, onChanged: (value) {
                  setState(
                          (){
                        height=value;
                        print(height);

                      }
                  );

                })
              ],

            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("select your weight (in kg) ",style: TextStyle(fontSize: 20),),


                TextButton(
                    child: Text(
                        "-",
                        style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.deepPurple)
                            )
                        )
                    ),
                    onPressed:sub_dec,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    child: Text(
                        "+",
                        style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.deepPurple)
                            )
                        )
                    ),
                    onPressed:add_inc,
                ),
                Text(x.toString())
              ]
          ),
          ElevatedButton(onPressed:calculateBMI, child: Text("Calulate BMI:",style: TextStyle(fontSize: 20))),
          Text("BMI: "+BMI.toString(), style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }
}
