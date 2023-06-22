import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Call_Screen/Call%20Model/call_model.dart';

import 'callTiles.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  List<CallModel> callsData = [
    CallModel(name: 'Ron',image: 'https://wallpaperaccess.com/full/2213426.jpg',callAt: '3:40pm', isCall: true),
    CallModel(name: 'Kate',image:'https://1fid.com/wp-content/uploads/2022/07/aesthetic-profile-picture-2-1024x1024.jpg' ,callAt: '4:15pm', isCall: false),
    CallModel(name: 'John',image: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',callAt: 'Yesterday, 11:05 am', isCall: false),
    CallModel(name: 'Henna',image: 'https://xyzshayari.com/wp-content/uploads/2022/05/girl-photo-with-cap-1024x1024.png', isCall: true, callAt: '3.11'),
    CallModel(name: 'John',image: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',callAt: '15 December, 9:17 am', isCall: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Center(
                            child: Scaffold(
                          appBar: AppBar(
                            title: Text('Create call link'),
                          ),
                          body: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                      'Anyone with WhatsApp can use this link to join this call.'),
                                  Text(
                                    'Only share it with people you trust',
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                    ));
              },
              child: ListTile(
                leading: Stack(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.attach_file),
                    ),
                  ],
                ),
                title: Text(
                  'Create call link',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Share a link for your WhatsApp call',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                      style: TextStyle(fontWeight: FontWeight.bold), 'Recent'),
                ),
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: callsData.length,
                itemBuilder: (context, index) {
                  print(callsData[index].image);
                  return CallTile(callsData: callsData[index]);
                })
          ],
        ),
      ),
    );
  }
}
