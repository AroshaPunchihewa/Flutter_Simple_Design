import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:musicstore/Screen/login_page/body.dart';
import 'package:musicstore/navBar.dart';

class FileUpload extends StatefulWidget{
  @override
  State<FileUpload> createState()=>_FileUploadState();
}
class _FileUploadState extends State<FileUpload>{
  File? pfdfile;

  @override
  Widget build(BuildContext context){
        Size size = MediaQuery.of(context).size;

    return SafeArea(
      
    child: Scaffold(
                backgroundColor: Colors.white,
                appBar:  AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Upload Page",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
                ),
                drawer: NavBar(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
               SizedBox(height: size.height * 0.03),
             Image.asset(
               "lib/Assets/5370051.jpg",
               height: size.height * 0.3,
             ),
             
                Container(
                  
               height: 300,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(),
                          borderRadius: BorderRadius.circular(35),

                color: Color.fromARGB(220, 250, 211, 166),
            ),
            
            alignment: Alignment.center,
                
            
          
            child:  UplRoundedButton(
                text: "File Upload",
                press: ()async{
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf','doc'],
                  );
                  if (result !=null){
                    final path = result.files.single.path;
                    setState((){
                       pfdfile = File(path!);
                    });
                  }
                } ),
)
      ]),
    
    )
    );
  }
}

class UplRoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const UplRoundedButton({
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
      width: size.width * 0.45,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(244, 252, 152, 3)),
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor,fontSize: 17)),
        ),
      ),
    );
  }
}



