import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              elevation: 2.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage(
                          'assets/maxresdefault.jpg',
                        )),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: null,
                width: MediaQuery.of(context).size.width,
                height: 240,
              ),
            ),
            preferredSize: Size.fromHeight(210)),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [Text("Posts"), Text("16K")],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [Text("Posts"), Text("16K")],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [Text("Posts"), Text("16K")],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(flex: 2),
                          Text("Roger Fahn"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(flex: 2),
                          Text("Roger Fahn"),
                        ],
                      ),
                    ],
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                ),
              ),
            ],
          ),
        ));
  }
}
