import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text("Görüşmeler",style: TextStyle(fontSize: 24),),
          backgroundColor: Colors.lightBlueAccent,

        ),
        floatingActionButton: Container(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            focusColor: Colors.blue,
            child: Icon(Icons.message,size: 40,),
            onPressed: () {

            },
          ),
        ),///yeni mesaj için tıklama butonu
        body: Container(

          child: ListView(
            children: [
              ListTile(leading: Icon(Icons.person), title: (Text("Ad Soyad")),onTap: (){},),
              ListTile(leading: Icon(Icons.person), title: (Text("Ad Soyad")),onTap: (){},),
              ListTile(leading: Icon(Icons.person), title: (Text("Ad Soyad")),onTap: (){},),
              ListTile(leading: Icon(Icons.person), title: (Text("Ad Soyad")),onTap: (){},),
              ListTile(leading: Icon(Icons.person), title: (Text("Ad Soyad")),onTap: (){},),
            ],
          )
        ),

      ),
    );

  }
}
