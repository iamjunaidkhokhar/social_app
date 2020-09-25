import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messageicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(7),
                bottomLeft: Radius.circular(7))),
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/maxresdefault.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Junaid Arshad"),
                  subtitle: Text("Hey, What happened?"),
                ),
              ),
            ),
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
