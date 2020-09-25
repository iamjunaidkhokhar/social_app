import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset('assets/maxresdefault.jpg'),
                    ),
                    title: Text("Roger Fahn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text("56 min ago"),
                    trailing:
                        IconButton(icon: Icon(Icons.apps), onPressed: null),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                            image: ExactAssetImage('assets/maxresdefault.jpg'),
                            fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 4.5,
                    child: null,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 15,
                    child: ListView(
                      children: [
                        Text(
                          "Roger Fahn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("#satisfied........ #nice_hogya"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: null),
                      IconButton(icon: Icon(Icons.textsms), onPressed: null),
                      Spacer(
                        flex: 2,
                      ),
                      IconButton(icon: Icon(Icons.share), onPressed: null),
                    ],
                  )
                ],
              ),
            ),
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      },
      itemCount: 6,
    );
  }
}
