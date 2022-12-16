import 'package:flutter/material.dart';
import 'package:musicstore/Screen/ListView/Music2ListView.dart';
import 'package:musicstore/Screen/ListView/MusicListView.dart';

class NavBar extends StatelessWidget{
    const NavBar({super.key});

  @override
  Widget build(BuildContext context){
    List<String> test = [
        "music" ,
        "music2" ,
        ];
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("namehere",style: TextStyle(color: Colors.black),),
            accountEmail: Text("email",style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.asset(
                  'lib/Assets/propic.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                ),
                 ),
            ),
            decoration: BoxDecoration(
              color: Colors.orange[100],
            ),
          ),
          SidebarItem(model: test[0],screen: const MusicListView(),),
            SidebarItem(model: test[1],screen: const Music2ListView(),),
        ],
        
      ),
      
            
        
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