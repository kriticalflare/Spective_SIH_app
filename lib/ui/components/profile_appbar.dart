import 'package:flutter/material.dart';

class ProfileAppbar extends StatefulWidget implements PreferredSizeWidget{
  const ProfileAppbar({
    Key key,
  }) : super(key: key);

  @override
  _ProfileAppbarState createState() => _ProfileAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _ProfileAppbarState extends State<ProfileAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Color(0xffFAFAFA),
      elevation: 0,
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1),
            borderRadius: BorderRadius.circular(22)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              child: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Mahendra',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
