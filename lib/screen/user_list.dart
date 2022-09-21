import 'package:flutter/material.dart';

import 'package:github_api_app/network/network_request.dart';

import '../model/users.dart';
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Users> userDataList=  [];
  @override
  initState() {
    super.initState();
    NetworkRequest.fetchUsers().then((dataFromServer) => setState((){
      userDataList=dataFromServer;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github User List"),
        ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: userDataList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${userDataList[index].id} - ${userDataList[index].login}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),),
                            SizedBox(height: 5),
                            Text("${userDataList[index].avatarUrl}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue
                            ),),
                            Image.network("${userDataList[index].avatarUrl}")
                          ],
                        ),
                      ),
                    );
                  }
              ))
        ],
      )
    );
  }
}
