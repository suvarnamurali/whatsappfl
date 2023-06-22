import 'dart:convert';

SingleChat SingleChatFromJson(String str) => SingleChat.fromJson(json.decode(str));

String SingleChatToJson(SingleChat data) => json.encode(data.toJson());

class SingleChat {
    SingleChat({
        this.isSend,
        this.isReaded,
        this.message,
        this.sendAt,
    });

    bool? isSend;
    bool? isReaded;
    String? message;
    String? sendAt;

    factory SingleChat.fromJson(Map<String, dynamic> json) => SingleChat(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        message: json["message"],
        sendAt: json["sendAt"],
    );

    Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "message": message,
        "sendAt": sendAt,
    };
}