import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return ListTile(
      leading: ClipOval(
          child: Image.network(
        contactImage,
        width: 60,
        height: 60,
      )),
      title: (Text(contactName)),
      onTap: () {},
    );
  }
}
