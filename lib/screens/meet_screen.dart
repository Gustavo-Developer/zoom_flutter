import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/jitsi_controller.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';

import 'widget/reuseable_icon.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiController = JitsiMeetMethods();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ReuseableIcon(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting'),
          ReuseableIcon(
              onPressed: joinMeeting,
              icon: Icons.add_box,
              text: 'Join Meeting'),
          ReuseableIcon(
              onPressed: () {
                print('Schedule');
              },
              icon: Icons.calendar_today,
              text: 'Schedule'),
          ReuseableIcon(
            onPressed: () {
              print('Share Screen');
            },
            icon: Icons.arrow_upward_rounded,
            text: 'Share Screen',
          ),
        ]),
        Expanded(
          child: Center(
              child: Text('Create/Join Meetings with just a Click',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
        )
      ],
    ));
  }
}
