import 'package:dotslash/widgets/row_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// import 'faq_view.dart';
// import 'package:dotslash/models/video.dart';
import 'package:dotslash/auth/firebase_auth_methods.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                    "Cloud Computing",
                    "UE21CS351B",
                    "41",
                    "Cloud Computing Models",
                    "Virtualization",
                    "Storage Models",
                    "Cluster Coordination"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: rowwidget(
                    "Image Processing",
                    "UE21CS342BA3",
                    "41",
                    "Spatial Domain Operations",
                    "Frequency Domain Operations",
                    "Morphological Processing",
                    "CNN Architectures"),
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
}
