import 'package:chat/Screens/message.dart';
import 'package:chat/Screens/post.dart';
import 'package:chat/Screens/profile.dart';
import 'package:chat/Screens/homeicon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _index = 0;
  bool flag = true;
  Widget _animateswitch = Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        "Home",
        style: GoogleFonts.oswald(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ));

  List<Widget> _children = [
    HomeIcon(),
    Addpost(),
    Messageicon(),
    Profileicon(),
  ];

  void _navigator(int indexnew) {
    setState(() {
      _index = indexnew;
    });
  }

  Widget mycontainer() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      child: Center(
        child: ListTile(
          trailing:
              IconButton(icon: FaIcon(FontAwesomeIcons.sun), onPressed: null),
          title: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _animateswitch,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          leading: IconButton(
            icon: flag
                ? FaIcon(FontAwesomeIcons.search)
                : FaIcon(Icons.highlight_off),
            onPressed: () {
              setState(() {
                if (flag == true) {
                  _animateswitch = TextFormField(
                    decoration: InputDecoration(labelText: 'Search'),
                  );
                  flag = !flag;
                } else {
                  _animateswitch = Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Feed",
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ));
                  flag = !flag;
                }
              });
            },
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _index == 0
            ? PreferredSize(
                child: AppBar(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  flexibleSpace: mycontainer(),
                ),
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height / 4.5),
              )
            : null,
        body: _children[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          elevation: 5,
          backgroundColor: Colors.blueGrey,
          fixedColor: Colors.blueGrey,
          currentIndex: _index,
          // selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), title: Text("Post")),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text("Message")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ],
          onTap: _navigator,
        ));
  }
}
