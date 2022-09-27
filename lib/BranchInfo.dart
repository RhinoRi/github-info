import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class BranchInfo extends StatefulWidget {

  final String repoLink;

  const BranchInfo({Key? key, required this.repoLink}) : super(key: key);

  @override
  State<BranchInfo> createState() => _BranchInfoState();
}

class _BranchInfoState extends State<BranchInfo> {
 // example Url = "https://api.github.com/repos/RhinoRi/TryingFlaskApi/branches";

  List data=[];

  _getBranchNames() async {
    var url = Uri.https('api.github.com','/repos/${widget.repoLink}/branches') ;
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    data = jsonResponse;
    print(data);
    return data;




  }

  @override
  Widget build(BuildContext context) {
    _getBranchNames();
    return Scaffold(
      appBar: AppBar(title: Text('Branches'),),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            data[index]['name'],
            style: TextStyle(fontSize: 35.0, color: Colors.black),),
        );
      })
    );
  }
}


