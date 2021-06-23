import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100,70),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Görüşmeler",style: TextStyle(fontSize: 27),),
          ),
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Colors.red,
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

    );

  }
}
