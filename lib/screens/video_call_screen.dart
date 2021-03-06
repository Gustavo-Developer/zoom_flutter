import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/meeting_option.dart';

import '../controllers/auth_controller.dart';
import '../controllers/jitsi_controller.dart';
import '../utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final AuthController _authController = AuthController();
  final JitsiMeetMethods _jitsiController = JitsiMeetMethods();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController =
        TextEditingController(text: _authController.user.displayName);

    super.initState();
  }

  _joinMeeting() {
    _jitsiController.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

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
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Join',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          SizedBox(height: 10),
          MeetingOption(
            text: 'Turn off Video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ]));
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
