
import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/ui/pages/chat_detailscreen.dart';

class ChatTile extends StatelessWidget {
   ChatTile({
    Key? key,
    required this.chatdata
   
  }) : super(key: key);

  Chat chatdata;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatdata.name!),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetails(chatdata: chatdata),) ),
      leading: CircleAvatar(
        backgroundImage:(chatdata.avatar=="")? NetworkImage((chatdata.isGroup!)?'https://tse2.mm.bing.net/th?id=OIP.EiG8C90jVLQrKTMX_yrbzwHaHa&pid=Api&P=0':'https://tse4.mm.bing.net/th?id=OIP.gtYDGnVfcJH3fx8d7M0AfwAAAA&pid=Api&P=0'):
        NetworkImage(chatdata.avatar!)
        ,

      ),
      subtitle: Text(chatdata.message!),
      trailing: Text(chatdata.updatedAt!),
    );
  }
}
