import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageInputWidget extends StatelessWidget {
  const MessageInputWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,//klavye mesaj kutumuz
      child: TextField(
        onTap: () {
          
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,style: BorderStyle.solid, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: 'Mesaj yazınız',
          border: OutlineInputBorder(

              borderRadius: BorderRadius.all(Radius.circular(15))),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.attach_file,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.send,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () {

            },
          ),
        ),
      ),
    );
  }
}