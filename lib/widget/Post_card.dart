import 'package:facebook/Widgets/avatar.dart';
import 'package:facebook/Widgets/blueTick.dart';
import 'package:facebook/assets.dart';
import 'package:facebook/widget/avatar.dart';
import 'package:facebook/widget/blueTick.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String publisheAdt;
  final String postTitle;
  final String postImage;
  final bool showBlueTick;


  PostCard({
    required this.avatar,
    required this.name,
    required this.publisheAdt,
    required this.postTitle,
    required this.postImage,
    this.showBlueTick = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          postCardHeader(),
          titleSection(),
          imageSection(),
          footerSection(),
        ],
      ),
    );
  }

  Widget footerSection() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.thumb_up),
          Text("15k", style: TextStyle(
              color: Colors.grey[700]
          ),),
        ],
      ),
    );
  }

  Widget imageSection() {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Image.asset(
          postImage
      ),
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      child: Text(
        postTitle == null ? "" : postTitle,
        style: TextStyle(
            color: Colors.black,
            fontSize: 16),
      ),
    );
  }


  Widget postCardHeader() {
    return ListTile(
      leading: Avatar(displayImage: avatar,
        displayStatus: false,
      ),
      title: Row(
        children: [
          Text(name,
            style: TextStyle(
                color: Colors.black
            ),
          ),
          SizedBox(width: 10
          ),
          showBlueTick ? BlueTick() : SizedBox(),
          BlueTick(),
        ],
      ),
      subtitle: Row(
        children: [
          Text(publisheAdt == null ? "" : publisheAdt),
          SizedBox(width: 10),
          Icon(Icons.public,
            color: Colors.grey[700],
            size: 15,
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          ("open more menu");
        },
        icon: Icon(
          Icons.more_horiz,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}