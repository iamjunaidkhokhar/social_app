import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addpost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(7),
                bottomLeft: Radius.circular(7))),
        backgroundColor: Colors.white,
        title: Text(
          "Create Post",
          style: TextStyle(color: Colors.blueGrey),
        ),
        actions: [
          RaisedButton(
            onPressed: null,
            child: Text("Post"),
            color: Colors.lightBlue,
          )
        ],
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Post Your thoughts',
                ),
                minLines: 3,
                maxLines: 5,
              ),
            ),
            Container(
              child: Center(
                child: Text("Add Picture"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.blueGrey,
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 9,
            ),
          ],
        ),
      ),
    );
  }
}
