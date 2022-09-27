import 'package:flutter/material.dart';
import 'package:githubrepo/BranchInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class RepoInfo extends StatefulWidget {
  final String username;
  const RepoInfo({Key? key, required this.username}) : super(key: key);

  @override
  State<RepoInfo> createState() => _RepoInfoState();
}

class _RepoInfoState extends State<RepoInfo> {
  List data=[];

  _getUserRepo() async {
    var url = Uri.https('api.github.com','/users/${widget.username}/repos') ;
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    data = jsonResponse;
    //print(data);
    return data;

  }

  @override
  Widget build(BuildContext context) {
    _getUserRepo();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username + "'s  Repositories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child:   ListView.builder(
            itemCount: data.length ,
            itemBuilder: (BuildContext ctx, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]['name'], style: TextStyle(fontSize: 26.0, color: Colors.black),),
                      SizedBox(height: 8.0,),
                      Text(data[index]['created_at'],style: TextStyle(fontSize: 20.0, color: Colors.black87),),
                      SizedBox(height: 20.0,)
                    ],
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder:  (context) =>BranchInfo(repoLink: data[index]['full_name'],
                                  ))
                      );
                    },
                      child: Icon(Icons.arrow_forward,color: Colors.blue,))
                ],
              );
            }
            )
      )
    );
  }
}
