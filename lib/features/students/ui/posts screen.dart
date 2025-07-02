// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'widgets/custom _card _posts _screen.dart';
import 'widgets/custom text _one _and _text _two.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(children: [
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 60, bottom: 0),
                      width: double.infinity,
                      color: Color(0xFF002B5B),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextOneAndTextTwo(),
                          CustomCardPostsScreen(),
                        ],
                      )),
                ],
              ),
              SizedBox(height: 20),
              CustomCardPostsScreen(),
            ]),
          ],
        ));
  }
}
