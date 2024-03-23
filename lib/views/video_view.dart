import 'package:dotslash/auth/firebase_auth_methods.dart';
import 'package:dotslash/widgets/video_player_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
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
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  // height: 250,
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
                            videoAsset: 'assets/videos/Av_video1.mp4'),
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
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: rowwidget(
              //       "Compiler Design",
              //       "UE21CS341B",
              //       "41",
              //       "Lexical Analysis",
              //       "Syntax Analysis",
              //       "Syntax Trees - SDTs",
              //       "Code Generation"),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: rowwidget(
              //       "Compiler Design",
              //       "UE21CS341B",
              //       "41",
              //       "Lexical Analysis",
              //       "Syntax Analysis",
              //       "Syntax Trees - SDTs",
              //       "Code Generation"),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: rowwidget(
              //       "Compiler Design",
              //       "UE21CS341B",
              //       "41",
              //       "Lexical Analysis",
              //       "Syntax Analysis",
              //       "Syntax Trees - SDTs",
              //       "Code Generation"),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: rowwidget(
              //       "Compiler Design",
              //       "UE21CS341B",
              //       "41",
              //       "Lexical Analysis",
              //       "Syntax Analysis",
              //       "Syntax Trees - SDTs",
              //       "Code Generation"),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: rowwidget(
              //       "Compiler Design",
              //       "UE21CS341B",
              //       "41",
              //       "Lexical Analysis",
              //       "Syntax Analysis",
              //       "Syntax Trees - SDTs",
              //       "Code Generation"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
