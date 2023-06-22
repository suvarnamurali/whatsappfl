// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:whatsapp_clone/chat_screeen/chat_bubble.dart';
// import 'package:whatsapp_clone/chat_screeen/models/chat_model.dart';
// import 'package:whatsapp_clone/chat_screeen/models/message_model.dart';

// class ChatDetails extends StatefulWidget {
//   ChatDetails({super.key, required this.chatsDetail});

  

//   ChatList chatsDetail;

//   @override
//   State<ChatDetails> createState() => _ChatDetailsState();
// }

// class _ChatDetailsState extends State<ChatDetails> {
//   List<MessageModel> messageList = [
//     MessageModel(message: 'hi',sendAt: '4:15 pm',isSend: true, isReaded: true),
//     MessageModel(message: 'hi',sendAt: '4:17 pm',isSend: false, isReaded: true),
//     MessageModel(message: 'where r u??',sendAt: '4:17 pm',isSend: true, isReaded:true ),
//     MessageModel(message: 'home',sendAt: '4:18 pm',isSend: false, isReaded: true),
//     MessageModel(message: 'em here',sendAt: '4:20 pm',isSend: true, isReaded: false),
//   ];
//   bool showSend = false;
//   bool showEmoji = true;
//   TextEditingController messageControler = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leadingWidth: 65,
//           leading: Row(
//             children: [
//               InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: Icon(Icons.arrow_back)),
//               CircleAvatar(
//                   backgroundImage: (widget.chatsDetail.image == "")
//                       ? NetworkImage((widget.chatsDetail.isGroup!)
//                           ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
//                           : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL9sqiich1IS50oUYm677xwB9QKRy_3hs-Eg&usqp=CAU')
//                       : NetworkImage(widget.chatsDetail.image!))
//             ],
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(widget.chatsDetail.name!),
//               Text(
//                 "online",
//                 style: TextStyle(fontSize: 15),
//               )
//             ],
//           ),
//           actions: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.call)),
//             IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
//             PopupMenuButton(
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(
//                       child: (widget.chatsDetail.isGroup!)
//                           ? Text('Group info')
//                           : Text('View contacts')),
//                   PopupMenuItem(
//                       child: (widget.chatsDetail.isGroup!)
//                           ? Text('Group media')
//                           : Text('Media,links,and docs')),
//                   PopupMenuItem(child: Text('Search')),
//                   PopupMenuItem(child: Text('Mute notification')),
//                   PopupMenuItem(child: Text('Disappearing messages')),
//                   PopupMenuItem(child: Text('Wallpaper')),
//                   PopupMenuItem(child: Text('More')),
//                 ];
//               },
//             )
//           ],
//         ),
//         body: Stack(
//           children: [
//             Image.asset(
//               'assets/images/whatspp wp.jpg',
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               fit: BoxFit.cover,
//             ),
//             ListView.builder(
//               itemCount: messageList.length,
//               itemBuilder: (context, index) {
//                 return ChatBubble(
//                   messageData: messageList[index],
//                 );
//               },
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width - 70,
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 5, vertical: 3),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(35),
//                             color: Colors.white),
//                         child: TextField(
//                           controller: messageControler,
//                           onTap: () {
//                             if (!showEmoji) {
//                               setState(() {
//                                 showEmoji = true;
//                               });
//                             }
//                           },
//                           onChanged: (value) {
//                             // print(value);
//                             if (value.length > 0) {
//                               setState(() {
//                                 showSend = true;
//                               });
//                             } else {
//                               setState(() {
//                                 showSend = false;
//                               });
//                             }
//                           },
//                           decoration: InputDecoration(
//                               hintText: 'Message',
//                               prefixIcon: IconButton(
//                                 onPressed: () {},
//                                 icon: InkWell(
//                                     onTap: () {
//                                       print(showEmoji);
//                                     if (showEmoji) {
//                                       FocusScope.of(context)
//                                               .unfocus();
//                                     }
                                          
//                                       setState(() {
//                                         showEmoji = !showEmoji;
//                                       });
//                                     },
//                                     child: Icon((showEmoji)
//                                         ? Icons.emoji_emotions_outlined
//                                         : Icons.keyboard)),
//                               ),
//                               suffixIcon: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         showModalBottomSheet(
//                                           context: context,
//                                           builder: (context) => menu(),
//                                         );
//                                       },
//                                       icon: Icon(Icons.attach_file)),
//                                   IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.currency_rupee_rounded)),
//                                   IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.camera_alt))
//                                 ],
//                               )),
//                         ),
//                       ),
//                       FloatingActionButton(
//                         onPressed: () {
//                           print(messageControler.text);
//                           setState(() {
//                             messageList.add(
//                               MessageModel(message: messageControler.text, isSend: true, sendAt: '10:00 am', isReaded: false)
//                             );
//                           });
//                           messageControler.clear(); 
//                         },
//                         child: (showSend) ? Icon(Icons.send) : Icon(Icons.mic),
//                       )
//                     ],
//                   ),
//                   Offstage(
//                     offstage: showEmoji,
//                     child: SizedBox(height: 300, child: EmojiPicker()),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ));
//   }

//   Container menu() {
//     return Container(
//       height: 300,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 menuItem('Document', Colors.blueAccent,
//                     Icon(Icons.insert_drive_file)),
//                 menuItem('Camera', Colors.red, Icon(Icons.camera_alt)),
//                 menuItem('Gallery', Colors.pink, Icon(Icons.insert_photo))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 menuItem('Audio', Colors.orange, Icon(Icons.headset)),
//                 menuItem('location', Colors.green, Icon(Icons.location_pin)),
//                 menuItem('Payment', Colors.teal, Icon(Icons.currency_rupee))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 menuItem('Contact', Colors.indigo, Icon(Icons.person)),
//                 menuItem('Poll', Colors.teal, Icon(Icons.poll)),
//                 SizedBox(
//                   width: 50,
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Column menuItem(String text, Color color, Icon icon) {
//     return Column(
//       children: [
//         CircleAvatar(
//           child: icon,
//           backgroundColor: color,
//           radius: 30,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(text)
//       ],
//     );
//   }
// }

