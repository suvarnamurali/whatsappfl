import 'package:flutter/material.dart';
import 'package:whatsapp/ui/pages/camera_page.dart';
import 'package:whatsapp/ui/pages/chat_page.dart';
import 'package:whatsapp/ui/pages/status_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{
      late TabController _controller;
      @override 
      void initState(){
        super.initState();
        _controller = TabController(length: 4,initialIndex: 1, vsync:this);
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('whatsapp'),
      actions: [
        Row(
          children: [
            
            // search icon
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            // add space
            const SizedBox(
              width: 20.00,
            ),
            PopupMenuButton(onSelected:(value){
              print(value);
            }, itemBuilder: (BuildContext context){
              return const [
                 PopupMenuItem(value: 1, child: Text('New group')),
                 PopupMenuItem(value: 2, child: Text('New broadcast')),
                 PopupMenuItem(value: 3, child: Text('Linked devices')),
                 PopupMenuItem(value: 4, child: Text('Starred messages')),
                 PopupMenuItem(value: 5, child: Text('Payments')),
                 PopupMenuItem(value: 6, child: Text('Settings')),
              ];
            })
          ],
        ),
      ],

      bottom: TabBar(
        tabs: const [
          Tab(
            icon: Icon(
              Icons.camera_alt,
            ),
          ),
          Tab(
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          ),
          ],
          controller: _controller,
      ),
    ), 
    body: TabBarView(
      controller: _controller,
      children: [
        Camera(),
        ChatPage(),
        StatusPage(),
        Text('Calls'),
      ],
      ),
    
    );
  }
    }
