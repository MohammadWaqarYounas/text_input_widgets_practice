import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
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
  @override
  Widget build(BuildContext context) {

    var emailText=TextEditingController();
    var passText=TextEditingController();
    var text1="";
    var text2="";
    var time=DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.maxFinite,height: double.maxFinite,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                        margin: EdgeInsets.all(12),
                        child: Text("Seconds Here: ${DateFormat("yMd").format(time)}", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 21),)),

                    TextField(
                      enabled: true,
                      controller: emailText,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 25,
                    ),

                    TextField(
                      controller: passText,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Password",
                        // suffixText: "Hello",
                         suffixIcon: IconButton(
                             icon: Icon(Icons.remove_red_eye),
                           onPressed: () {

                         },),
                         enabledBorder : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.pinkAccent),
                        ),
                        focusedBorder : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(onPressed: (){

                        print("Email here: ${emailText.text}   Password: ${passText.text}");
                        text1=emailText.text;
                        text2=passText.text;
                        print("Text 1 : ${text1}   Text 2 : ${text2}");
                        emailText.text="";
                        passText.text="";

                        setState(() {

                        });

                      }, child: Text("Login")),
                    ),

                    Container(
                      width: double.infinity,
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Email Here: ${text1}", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 21),),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )
                        ),
                    ),

                    Container(
                      width: double.infinity,
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Password Here: ${text2}", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 21),),
                        ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
