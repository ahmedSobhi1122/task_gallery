import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List Ldata = [];
  List<PhotoModel> photo = [];

  void getData() async {
    //http package
    await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'))
        .then((val) {
      Ldata = jsonDecode(val.body);

      for (int i = 0; i < Ldata.length; i++) {
        photo.add(PhotoModel.fromJson(Ldata[i]));
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (photo.length == 0)
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, i) {
                return Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text('${photo[i].id}'),
                        Expanded(
                          child: Container(
                            child: GridTile(
                              child: Image.network(photo[i].url),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: photo.length,
            ),
    );
  }
}

class PhotoModel {
  final int albumId, id;
  final String title, url,thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

  factory PhotoModel.fromJson(Map jData) {
    return PhotoModel(
      albumId: jData['albumId'],
      id: jData['id'],
      title: jData['title'],
      url: jData['url'],
      thumbnailUrl: jData['thumbnailUrl'],
    );
  }
}
