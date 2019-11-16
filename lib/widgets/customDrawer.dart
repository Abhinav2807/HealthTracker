import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue[400],
          ),
          ListTile(
            leading: Icon(
              MdiIcons.faceProfile,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("Profile",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.facebook,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("ConnectTo",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.google,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("ConnectTo",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.shareCircle,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("Share",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.settings,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("Settings",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              MdiIcons.logout,
              size: 30,
              color: Colors.blue,
            ),
            title: Text("Signout",
                style: TextStyle(fontSize: 17, color: Colors.blue[400])),
          ),
          
        ],
      ),
    );
  }
}
