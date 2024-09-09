import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListMenu{
  final String? title;
  final String? subtitle;
  final IconData? icon;
  ListMenu({this.title, this.subtitle, this.icon});
}
List<ListMenu> menus = [
  ListMenu(title: 'MENU-1', subtitle: 'SUB-1', icon: Icons.person),
  ListMenu(title: 'MENU-2', subtitle: 'SUB-2', icon: Icons.person_add),
  ListMenu(title: 'MENU-3', subtitle: 'SUB-3', icon: Icons.wifi),
  ListMenu(title: 'MENU-4', subtitle: 'SUB-4', icon: Icons.build),
];

class ListViewMenu extends StatelessWidget {
  const ListViewMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: const Text("List Virew menu"),
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context,index) {
          return ListTile(
            title: Text("${menus[index].title}"),
            subtitle: Text("${menus[index].subtitle}"),
            leading: CircleAvatar(child: Icon(menus[index].icon)),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              debugPrint(menus[index].title);
              if(Navigator.canPop(context)) {
                Navigator.pop(context, menus[index].title);
              }
            },
          );
        },separatorBuilder: (context ,index){
          return const Divider(
            color: Colors.amber,
          );
        },
        itemCount: 4),
      ),
    );
  }
}