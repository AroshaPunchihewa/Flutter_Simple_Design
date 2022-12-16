import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:musicstore/Screen/ListView/music2FormPage.dart';
import 'package:musicstore/Models/music2.dart';
import 'package:musicstore/Screen/ListView/music2DataPage.dart';
import 'package:musicstore/Screen/login_page/body.dart';
import 'package:musicstore/Services/music2Service.dart';
import 'package:musicstore/Sidebar.dart';

class Music2ListView extends StatefulWidget {
  const Music2ListView({super.key});

  @override
  State<Music2ListView> createState() => _Music2ListViewState();

  static builder({required Null Function() itemBuilder}) {}
}

class _Music2ListViewState extends State<Music2ListView> {
  List<Music2>? music2 = [];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 500), () {
      getMusic2();
    });
  }

  getMusic2() async {
    music2 = await (Servicemusic2.fetchMusic2());
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
          "List View",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.all(5),
                 
                  child: AddRoundedButton(
                    text: "ADD",
                    press: () {
                      showDialog(
                          //dialogbox to get inputs
                          context: context,
                          builder: (context) {
                            return Music2FormPage(
                                operation: "post",
                                refresh: () =>
                                    initState()); //init state called to refresh
                          });
                    },
                  ))),
          Expanded(
            child: ListView.builder(
                itemCount: music2?.length,
                itemBuilder: (context, index) {
                  if (music2?[index] !=null){
                        return ListItem2(
                        title: music2![index].musicid2,
                        subtitle: music2![index].musicName2,
                        objectid: music2![index].objectid,
                        refresh: initState,
                        model:music2![index],
                      );
                  }
                  else{
                    return ListTile();
                  }
                
                }),
          )
        ],
      ),
      drawer: Sidebar(),
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
                  builder: (context) => Music2DataPage(model:model)));
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
    Music2 music2;
    if (item == 1) {
      Servicemusic2.deleteMusic2(objectid);
      refresh!();
    } else if (item == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return Music2FormPage(
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