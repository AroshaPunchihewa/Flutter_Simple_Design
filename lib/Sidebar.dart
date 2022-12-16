import 'package:flutter/material.dart';
import 'package:musicstore/Screen/ListView/MusicListView.dart';
import 'package:musicstore/Screen/ListView/Music2ListView.dart';
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  
  @override
  Widget build(BuildContext context) {
    List<String> test = [
        "music" ,
        "music2" ,
        ];
    return Drawer(
         child: Column(
            children: [
              SidebarItem(model: test[0],screen: const MusicListView(),),
            SidebarItem(model: test[1],screen: const Music2ListView(),),
            ],
        )
      );
  }
}

class SidebarItem extends StatelessWidget {
  final model;
  final screen;
  const SidebarItem({this.model,this.screen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(Icons.model_training),
      title: Text(model),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
      },
      
    );
  }
}