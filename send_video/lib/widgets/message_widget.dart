import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key key,
    @required this.messageText,
    @required this.sendTime,
    @required this.ownMessage,
  }) : super(key: key);

  final String messageText;
  final Timestamp sendTime;
  final bool ownMessage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: ownMessage == true ?  MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ///burada mesajımızın kim tarafından atıldığına bağlı olarak saatin sağ veya solda çıkmasını ayarladık.

          ownMessage == true ? Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(sendTime != null ? " ${sendTime.toDate().hour}:${sendTime.toDate().second} "  : '',style: TextStyle(fontSize: 13),),
          ): Container(),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ) ,
            child: (
                Text(messageText != null ? messageText : "")
            ),

          ),
         ownMessage == false ? Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(sendTime != null ? " ${sendTime.toDate().hour}:${sendTime.toDate().second} "  : '',style: TextStyle(fontSize: 13),),
          ) : Container(),

        ],
      ),
      onTap: (){},
    );
  }
}