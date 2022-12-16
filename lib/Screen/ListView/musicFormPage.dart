import 'package:flutter/material.dart';
import 'package:musicstore/Widgets/EvoTextField.dart';
import 'package:musicstore/Models/music.dart';
import 'package:musicstore/Screen/ListView/musicListView.dart';
import 'package:musicstore/Screen/login_page/body.dart';
import 'package:musicstore/Services/musicService.dart';

class MusicFormPage extends StatelessWidget {
  final operation;
  final objectid;
  final VoidCallback? refresh;
  const MusicFormPage({this.objectid, this.operation, this.refresh});

  @override
  Widget build(BuildContext context) {
            final objectidController = TextEditingController(text: objectid);
    final musicidController = TextEditingController();
    final musicNameController = TextEditingController();
    var response;
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "Enter Student details",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      content: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              EvoTextField(textController: objectidController,hintText : "Enter the object id"),
              Padding(padding: EdgeInsets.all(10)),
              EvoTextField(textController: musicidController,hintText : "Enter the musicid"),
                Padding(padding: EdgeInsets.all(10)),
              EvoTextField(textController: musicNameController,hintText : "Enter the musicName"),
                Padding(padding: EdgeInsets.all(10)),
              AddRoundedButton(
                text: "Submit",
                press: () async {
                  // change this button
                  final newMusic = Music(
                      objectid :objectidController.text,
                    musicid: musicidController.text,
                    musicName: musicNameController.text,
                    );
                  if (operation == "post") {
                    response = await Servicemusic.postMusic(newMusic);
                  } else {
                    response = await Servicemusic.updateMusic(newMusic);
                  }
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title: Text("Response"),
                            content: Text(response),
                          )));

                  return refresh!();
                },
              ) //child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
