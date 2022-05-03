import 'package:flutter/material.dart';

import '../utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
            title: Text('Join a Meeting',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            centerTitle: true),
        body: Column(children: [
          TextField(
            controller: meetingIdController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              contentPadding: EdgeInsets.all(10),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Username',
              contentPadding: EdgeInsets.all(10),
            ),
            textAlign: TextAlign.center,
          )
        ]));
  }
}
