import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
             ListTile(title: Text('data'),),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:180,
                itemBuilder: (context,index){
                  return  ListTile(title: Text(' $index'),);
                })
          ],
        ),
      ),
    );
  }
}
