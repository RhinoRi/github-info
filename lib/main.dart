import 'package:flutter/material.dart';
import 'package:githubrepo/RepoInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
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
  TextEditingController _controller =TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,

          child: Column(

            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'enter a username',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic,fontSize: 30)
                  ),
                  validator: (value){
                    if(value!.isEmpty || value==null) {
                      return 'please enter username';

                    }
                    return null;
                  },


                ),
              ),
              SizedBox(height: 30.0,),
              ElevatedButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:  (context) =>RepoInfo(username: _controller.text.trim(),))
                      );
                    }





              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
