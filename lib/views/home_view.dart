import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'video_view.dart';
import 'faq_view.dart';
// import 'package:dotslash/models/video.dart';
import 'package:dotslash/auth/firebase_auth_methods.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // List<Video> videos = [
  //   Video(
  //     id: '1',
  //     title: 'Introduction to Flutter',
  //     url: 'https://example.com/flutter-intro.mp4',
  //     description: 'Learn the basics of Flutter development',
  //     materials: ['https://example.com/flutter-intro.pdf'],
  //   ),
  //   Video(
  //     id: '2',
  //     title: 'State Management in Flutter',
  //     url: 'https://example.com/state-management.mp4',
  //     description: 'Explore different state management techniques',
  //     materials: ['https://example.com/state-management.pdf'],
  //   ),
  //   // Add more videos here
  // ];

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
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Align(
                  alignment: Alignment.centerLeft, // Align the text to the left
                  child: Text(
                    'Hi, Siddhant',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Text(
                  'What do you want to study today?',
                  style: GoogleFonts.inter(
                    color: Color(0xff8C8C8C),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                        // width: MediaQuery.of(context).size.width - 10.0,
                        // height: 200,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset('assets/images/av_summary1.png')),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Text(
                  'Your subjects',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Compiler Design",
                    "UE21CS341B",
                    "41",
                    "Lexical Analysis",
                    "Syntax Analysis",
                    "Syntax Trees - SDTs",
                    "Code Generation"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Compiler Design",
                    "UE21CS341B",
                    "41",
                    "Lexical Analysis",
                    "Syntax Analysis",
                    "Syntax Trees - SDTs",
                    "Code Generation"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Compiler Design",
                    "UE21CS341B",
                    "41",
                    "Lexical Analysis",
                    "Syntax Analysis",
                    "Syntax Trees - SDTs",
                    "Code Generation"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Compiler Design",
                    "UE21CS341B",
                    "41",
                    "Lexical Analysis",
                    "Syntax Analysis",
                    "Syntax Trees - SDTs",
                    "Code Generation"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Compiler Design",
                    "UE21CS341B",
                    "41",
                    "Lexical Analysis",
                    "Syntax Analysis",
                    "Syntax Trees - SDTs",
                    "Code Generation"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowwidget(String subjname, String courseID, String lessons, String u1,
      String u2, String u3, String u4) {
    return Padding(
        padding: EdgeInsets.only(right: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              badawidget(subjname, courseID, lessons),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: Color(0xff7F7F7F), size: 40),
              chotawidget(u1, "Unit 1"),
              chotawidget(u2, "Unit 2"),
              chotawidget(u3, "Unit 3"),
              chotawidget(u4, "Unit 4"),
            ],
          ),
        ));
  }

  Widget badawidget(String subjectName, String subjectID, String lessons) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 5),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(subjectName,
                    style: GoogleFonts.josefinSans(
                        fontSize: 23,
                        color: Color(0xff2C2C2C),
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(subjectID,
                    style: GoogleFonts.inter(
                        color: Color(0xff2C2C2C),
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('(${lessons} lessons)',
                    style: GoogleFonts.inter(
                        color: Color(0xffAEAEAE),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  timewidget(),
                  SizedBox(width: 15),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  Text('4.9',
                      style: TextStyle(color: Color(0xffAEAEAE), fontSize: 10))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chotawidget(String unitTitle, String unitNo) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 5),
        child: Container(
          // height: 150,
          // width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(unitNo,
                        style: GoogleFonts.josefinSans(
                            fontSize: 23,
                            color: Color(0xff2C2C2C),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(unitTitle,
                      style: GoogleFonts.inter(
                          color: Color(0xff2C2C2C),
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('+12 more',
                      style: GoogleFonts.inter(
                          color: Color(0xffAEAEAE),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 12),
                timewidget(),
              ],
            ),
          ),
        ));
  }

  Widget timewidget() {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 25,
          width: 105,
          decoration: BoxDecoration(
            color: Color(0xffEAF4FF),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_filled_rounded,
                  color: Color(0xff3D8FEF),
                  size: 15,
                ),
                SizedBox(width: 5),
                Text('36h 40min',
                    style: TextStyle(color: Color(0xff3D8FEF), fontSize: 15)),
              ],
            ),
          ),
        ));
  }
}
