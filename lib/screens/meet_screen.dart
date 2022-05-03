import 'package:flutter/material.dart';

import 'widget/reuseable_icon.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ReuseableIcon(
              onPressed: () {
                print('New Meeting');
              },
              icon: Icons.videocam,
              text: 'New Meeting'),
          ReuseableIcon(
              onPressed: () {
                print('Join Meeting');
              },
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
