import 'package:flutter/material.dart';
import 'package:app/Model/User/user_Model.dart';
import '../../Controller/Authentication/UserBox.dart';
import 'profile_DiceBear_Image.dart';
import 'package:app/Controller/Authentication/SignOut.dart';
import 'package:get/get.dart';

class NavigationDrawerWidget extends StatelessWidget {
  //const NavigationDrawerWidget({Key? key}) : super(key: key);
  //instantiate user model
  user_Model user = user_Model();
  //instantial dicebare url image
  profile_DiceBear_Image img = profile_DiceBear_Image();
  //
  final signoutController = Get.put(SignOutController());

  final Padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final mybox = UserBox.getUser();
    final user = mybox.get(0);
    var email = user!.email;
    var firstName = user.firstName.toString();
    var lastName = user.lastName.toString();
    return Drawer(
        child: Material(
      color: Colors.grey[700],
      child: ListView(
        children: [
          buildHeader(
              urlImage: img.makeuriImage().toString(),
              name: firstName + ' ' + lastName,
              email: email.toString(),
              onClicked: () {}),
          Divider(color: Colors.white70),
          Container(
            padding: Padding,
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                buildMenuItem(
                  text: 'Account',
                  icon: Icons.account_box,
                  onClicked: () => selectedItem(context, 0),
                ),
                buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 0)),
                buildMenuItem(
                    text: 'About us',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 1)),
                buildMenuItem(
                    text: 'Help',
                    icon: Icons.help,
                    onClicked: () => selectedItem(context, 2)),
                SizedBox(
                  height: 24,
                ),
                Divider(color: Colors.white70),
                SizedBox(
                  height: 24,
                ),
                buildMenuItem(
                    text: 'Favourites',
                    icon: Icons.favorite,
                    onClicked: () => selectedItem(context, 3)),
                buildMenuItem(
                    text: 'Purchased',
                    icon: Icons.shop,
                    onClicked: () => selectedItem(context, 4)),
                buildMenuItem(
                    text: 'Downloads',
                    icon: Icons.download,
                    onClicked: () => selectedItem(context, 5)),
                buildMenuItem(
                    text: 'Upload',
                    icon: Icons.upload,
                    onClicked: () => selectedItem(context, 6)),
                buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 7)),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildHeader(
      {required String urlImage,
      required String name,
      required String email,
      required VoidCallback onClicked}) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: Padding.add(
          EdgeInsets.symmetric(vertical: 40),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                urlImage,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
                child: Wrap(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final Color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: Color,
      ),
      title: Text(
        text,
        style: TextStyle(color: Color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Get.back();
    switch (index) {
      case 0:
        //Get.toNamed('/login');
        break;
      case 1:
        //
        break;
      case 2:
        //
        break;
      case 3:
        //
        break;
      case 4:
        //
        break;
      case 5:
        //
        break;
      case 6:
        Get.toNamed('/upload');
        break;
      case 7:
        signoutController.signOut();
        //
        break;
    }
  }
}
