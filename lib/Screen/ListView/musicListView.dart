import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:musicstore/Screen/ListView/musicFormPage.dart';
import 'package:musicstore/Models/music.dart';
import 'package:musicstore/Screen/ListView/musicDataPage.dart';
import 'package:musicstore/Screen/login_page/body.dart';
import 'package:musicstore/Services/musicService.dart';
import 'package:musicstore/Sidebar.dart';
import 'package:musicstore/navBar.dart';

class MusicListView extends StatefulWidget {
  const MusicListView({super.key});

  @override
  State<MusicListView> createState() => _MusicListViewState();

  static builder({required Null Function() itemBuilder}) {}
}

class _MusicListViewState extends State<MusicListView> {
  List<Music>? music = [];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 500), () {
      getMusic();
    });
  }

  getMusic() async {
    music = await (Servicemusic.fetchMusic());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "List View", //model name eka damoth hondai wage
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: <Widget>[
          // First button - decrement
          IconButton(
            icon: Icon(Icons.add), // The add icon
            onPressed: (){showDialog(
                          //dialogbox to get inputs
                          context: context,
                          builder: (context) {
                            return MusicFormPage(
                                operation: "post",
                                refresh: () =>
                                    initState()); //init state called to refresh
                          });}, // The `_decrementCounter` function
          ),
        ],

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.all(5),
                 
                  // child: AddRoundedButton(
                  //   text: "ADD",
                  //   press: () {
                  //     showDialog(
                  //         //dialogbox to get inputs
                  //         context: context,
                  //         builder: (context) {
                  //           return MusicFormPage(
                  //               operation: "post",
                  //               refresh: () =>
                  //                   initState()); //init state called to refresh
                  //         });
                  //   },
                  // )
                   )),
          Expanded(
            child: ListView.builder(
                itemCount: music?.length,
                itemBuilder: (context, index) {
                  if (music?[index] !=null){
                        return ListItem2(
                        title: music![index].musicid,
                        subtitle: music![index].musicName,
                        objectid: music![index].objectid,
                        refresh: initState,
                        model:music![index],
                      );
                  }
                  else{
                    return ListTile();
                  }
                
                }),
          )
        ],
      ),
      drawer: NavBar(),  //Sidebar here
    );
  }
}

class ListItem2 extends StatelessWidget {
  String objectid;
  final VoidCallback? refresh;
  String title;
  String subtitle;
  final model;
  ListItem2(
      {required this.title,
      required this.subtitle,
      required this.objectid,
      this.refresh,
      this.model,
      Key? key})
      : super(key: key);
  final dishImage =
      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FRectangle%2013.png?alt=media&token=6a5f056c-417c-48d3-b737-f448e4f13321";
  final orangeColor = const Color(0xffFF8527);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MusicDataPage(model:model)));
      },
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset("lib/Assets/modelPic.png")),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
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
              ],
              onSelected: ((item) => selectedItem(context, item, objectid)),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
          ],
        ),
        trailing: Column(
          children: const [
            //Icon(Icons.more_vert_outlined),
          ],
        ),
      ),
    );
  }

  selectedItem(BuildContext context, int item, String objectid) {
    Music music;
    if (item == 1) {
      Servicemusic.deleteMusic(objectid);
      refresh!();
    } else if (item == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return MusicFormPage(
              operation: "put",
              objectid: objectid,
              refresh: refresh,
            );
          });
    }
  }
}

class AddRoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;

  const AddRoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.amber,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.25,
      height: size.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(244, 252, 152, 3)),
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}