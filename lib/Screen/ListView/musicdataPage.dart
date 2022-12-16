import 'package:flutter/material.dart';
import 'package:musicstore/Sidebar.dart';
import 'package:musicstore/Models/music.dart';

class MusicDataPage extends StatelessWidget {

    Music model;
  MusicDataPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          model.musicName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: <Widget>[
          // First button - decrement
          PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Update"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Delete"),
                ),
              ]
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:Container(
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            IllustrationFb4(),
            Padding(padding: EdgeInsets.all(4)),
            Container(
              height: 300,
              width: 600,
              //decoration: BoxDecoration(
              //  border: Border.all(color: Colors.orange),
              //  borderRadius: BorderRadius.circular(50)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
                Text("musicid : " + model.musicid),
                Text("musicName : " + model.musicName),
                ],),
            )
           
          ],
        ),
      ) ,
     
    );
  }
}
class IllustrationFb4 extends StatelessWidget {
  const IllustrationFb4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "lib/Assets/modelPic.png",
      //"https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Social_friends_re_7uaa%201.png?alt=media&token=25201ff9-7b37-4f0d-ac86-66d98283d4c4",
      //fit: BoxFit.cover,
      width:  150,
      
    );
  }
}
class BackgroundImageFb0 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb0(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          
        ),
      ),
      child: child,
    );
  }
}
