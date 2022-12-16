import 'package:flutter/material.dart';
import 'package:musicstore/Widgets/EvoTextField.dart';
import 'package:musicstore/Models/music2.dart';
import 'package:musicstore/Screen/ListView/music2ListView.dart';
import 'package:musicstore/Screen/login_page/body.dart';
import 'package:musicstore/Services/music2Service.dart';

class Music2FormPage extends StatelessWidget {
  final operation;
  final objectid;
  final VoidCallback? refresh;
  const Music2FormPage({this.objectid, this.operation, this.refresh});

  @override
  Widget build(BuildContext context) {
            final objectidController = TextEditingController(text: objectid);
    final musicid2Controller = TextEditingController();
    final musicName2Controller = TextEditingController();
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
              EvoTextField(textController: musicid2Controller,hintText : "Enter the musicid2"),
                Padding(padding: EdgeInsets.all(10)),
              EvoTextField(textController: musicName2Controller,hintText : "Enter the musicName2"),
                Padding(padding: EdgeInsets.all(10)),
              AddRoundedButton(
                text: "Submit",
                press: () async {
                  // change this button
                  final newMusic2 = Music2(
                      objectid :objectidController.text,
                    musicid2: musicid2Controller.text,
                    musicName2: musicName2Controller.text,
                    );
                  if (operation == "post") {
                    response = await Servicemusic2.postMusic2(newMusic2);
                  } else {
                    response = await Servicemusic2.updateMusic2(newMusic2);
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
