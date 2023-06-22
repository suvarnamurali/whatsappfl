import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/models/single_chat_model.dart';
import 'package:whatsapp/ui/pages/chat_bubble.dart';
import 'package:whatsapp/ui/widgets/utility_widget.dart';

class ChatDetails extends StatefulWidget {
  
  ChatDetails({super.key, required this.chatdata});
  Chat chatdata;
  
  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}



class _ChatDetailsState extends State<ChatDetails> {
  
  List<SingleChat> messages = [
    SingleChat(
        isReaded: true, isSend: true, message:'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: true, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: false, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: true, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: false, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: true, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: false, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: true, isSend: false, message: 'hii', sendAt: '10.00 am'),
    SingleChat(
        isReaded: false, isSend: true, message: 'hii', sendAt: '10.00 am'),
  ];

  bool showSend = false;

  bool showEmoji = false;

  TextEditingController _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back)),
            CircleAvatar(
              backgroundImage: (widget.chatdata.avatar == "")
                  ? NetworkImage((widget.chatdata.isGroup!)
                      ? 'https://tse2.mm.bing.net/th?id=OIP.EiG8C90jVLQrKTMX_yrbzwHaHa&pid=Api&P=0'
                      : 'https://tse4.mm.bing.net/th?id=OIP.gtYDGnVfcJH3fx8d7M0AfwAAAA&pid=Api&P=0')
                  : NetworkImage(widget.chatdata.avatar!),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatdata.name!,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              widget.chatdata.status!,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          UilityWidget().widthSpacer(10),
          Icon(Icons.call),
          UilityWidget().widthSpacer(10),
          PopupMenuButton(itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text('View contact'),
              ),
              PopupMenuItem(
                child: Text('media,links and docs'),
              ),
              PopupMenuItem(
                child: Text('search'),
              ),
              PopupMenuItem(
                child: Text('wallpaper'),
              ),
              PopupMenuItem(
                child: InkWell(
                  child: Text('more'),
                ),
              ),
            ];
          }),
        ],
      ),
      
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/whatsapp_bg.png',
              fit: BoxFit.cover,
            ),
          ),


          ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                message: messages[index],
              );
            },
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),


                          
                      child: TextField(
                        cursorColor: Colors.teal,
                        style: TextStyle(
                          fontSize: 20
                        ),
                        controller: _msgController,
                        onChanged: (value) {
                          print(value);
                          if (value.length > 0) {
                            setState(() {
                              showSend = true;
                            });
                          } else {
                            setState(() {
                              showSend = false;
                            });
                          }
                        },
                        onTap: () {
                          setState(() {
                            showEmoji = true;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                if (showEmoji) {
                                  FocusScope.of(context).unfocus();
                                }
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              },
                              icon: (showEmoji)
                                  ? Icon(Icons.emoji_emotions_outlined)
                                  : Icon(Icons.keyboard),
                            ),
                            border: InputBorder.none,
                            hintText: 'Type a message',
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => bottemMenu(),
                                  ),
                                  icon: Icon(Icons.attach_file),
                                  
                                ),
                                Icon(Icons.currency_rupee_rounded),
                                Icon(Icons.camera_alt),
                                UilityWidget().widthSpacer(10)
                              ],
                            )),
                      ),
                    ),
//  need to continue ......
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: FloatingActionButton(
                        onPressed: () {
                          print(_msgController.text.length);
                          setState(() {
                            messages.add(SingleChat(
                                isReaded: false,
                                isSend: true,
                                message: _msgController.text,
                                sendAt: '10.am'));
                          });
                          _msgController.clear();
                        },
                        child: (showSend) ? Icon(Icons.send) : Icon(Icons.mic),
                      ),
                    )
                  ],
                ),
                Offstage(
                    offstage: showEmoji,
                    child: SizedBox(
                        height: 300,
                        child: EmojiPicker(
                          textEditingController: _msgController,
                          onEmojiSelected: (category, emoji) {
                            setState(() {
                              showSend = true;
                            });
                          },
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container bottemMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: 350,
      height: 350,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            menuIcon(text: 'Document', color: Colors.indigo, icon: Icon(Icons.insert_drive_file, color: Colors.white,size: 25,)),
            menuIcon(text: 'Camera', color: Colors.pink, icon: Icon(Icons.camera_alt, color: Colors.white,size: 25,)),
            menuIcon(text: 'Gallery', color: Colors.purple, icon: Icon(Icons.insert_photo, color: Colors.white,size: 25,)),
            
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            menuIcon(text: 'Audio', color: Colors.orange, icon: Icon(Icons.headset, color: Colors.white,size: 25,)),
            menuIcon(text: 'Location', color: Colors.teal, icon: Icon(Icons.location_pin, color: Colors.white,size: 25,)),
            menuIcon(text: 'Contact', color: Colors.blue, icon: Icon(Icons.contact_phone, color: Colors.white,size: 25,)),
          ],
        ),
      ]),
    );
  }

  Column menuIcon({required String text, required Icon icon, required Color color}) {
    return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
                child:icon,
              ),
              SizedBox(height: 10,),
              Text(text)
            ],
          );
  }
}
