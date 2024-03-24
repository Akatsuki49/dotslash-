import 'package:dotslash/auth/firebase_auth_methods.dart';
import 'package:dotslash/views/chat_page.dart';
import 'package:dotslash/widgets/video_player_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoView extends StatefulWidget {
  final String courseID;
  VideoView({Key? key, required this.courseID}) : super(key: key);
  // const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showSwipeButton =
      true; // Flag to control the visibility of the swipe button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/padh.ai.png',
                      height: 55,
                      width: 90,
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () async {
                        await FirebaseAuthMethods(_auth).signOut(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Introduction to Cloud Computing',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cloud Computing (UE21CS541A)',
                            style: GoogleFonts.inter(
                              color: Color(0xff8C8C8C),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        VideoPlayerWidget(
                          // videoAsset: 'assets/videos/V1.mp4',
                          videoAsset: widget.courseID == "UE21CS341B"
                              ? 'assets/videos/V1.mp4'
                              : widget.courseID == "UE21CS351B"
                                  ? 'assets/videos/V2.mp4'
                                  : 'assets/videos/V3.mp4',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Text(
                  'Up Next',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              upNextWidgets(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  'assets/images/Need_Help.png',
                  height: 90,
                  width: 350,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Image.asset(
                  'assets/images/VP.png',
                  height: 95,
                  width: 150,
                ),
              ),
              // if (_showSwipeButton) // Only show the swipe button if _showSwipeButton is true
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.up,
                  onDismissed: (_) {
                    setState(() {
                      _showSwipeButton =
                          false; // Hide the swipe button after dismissing
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatPage(courseID: widget.courseID),
                    ));
                  },
                  child: Image.asset(
                    'assets/images/swipeUp.png',
                    height: 100,
                    width: 350,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget upNextWidgets() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          10,
          (index) => nextWidget(),
        ),
      ),
    );
  }

  Widget nextWidget() {
    return Image.asset(
      'assets/images/NextVids.png',
      height: 150,
      width: 150,
    );
  }
}
