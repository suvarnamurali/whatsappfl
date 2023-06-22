import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/ui/pages/chat_tile.dart';


class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<Chat> chatList = [
    Chat(
      avatar:
          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
      name: "cybersquare flutter team",
      isGroup: true,
      updatedAt: '3.00 pm',
      message: "Haai",
      status: "last seen 3 min ago",
    ),
    Chat(
      avatar:
          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
      name: "john",
      isGroup: false,
      updatedAt: "9.00 pm",
      message: "hello",
      status: "last seen 4 min ago",
    ),
    Chat(
      avatar: "",
      name: "Family",
      isGroup: true,
      updatedAt: "7.00 am",
      message: "Good morning",
      status: "online",
    ),
    Chat(
      avatar: "",
      name: "Emily",
      isGroup: false,
      updatedAt: "7.00 am",
      message: "Good morning",
      status: "online",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
         itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatTile(chatdata: chatList[index],);
        },
       
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
