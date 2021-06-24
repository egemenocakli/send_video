import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_video/views/chat_view.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key key,
    @required this.contactName,
    @required this.contactImage,
  }) : super(key: key);

  final String contactName;
  final String contactImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipOval(
            child: Image.network(
          contactImage,
          width: 50,
          height: 50,
        )),
        title: (Text(contactName)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatView()));
        },
      ),
    );
  }
}
