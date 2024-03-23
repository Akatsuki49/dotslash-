import 'package:dotslash/views/video_view.dart';
import 'package:flutter/material.dart';
import 'package:dotslash/auth/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseListView extends StatefulWidget {
  final String courseID;

  CourseListView({Key? key, required this.courseID}) : super(key: key);

  // const CourseListView({Key? key}) : super(key: key);

  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

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
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Unit Overview',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTab(
                    title: 'Lessons',
                    isSelected: _selectedTabIndex == 0,
                    onTap: () => _selectTab(0),
                  ),
                  CustomTab(
                    title: 'Description',
                    isSelected: _selectedTabIndex == 1,
                    onTap: () => _selectTab(1),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _selectedTabIndex == 0
                  ? LessonsList()
                  : Center(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Description Content',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LessonsList() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) => custom_containers()),
      ),
    );
  }

  Widget custom_containers() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          // print(widget.courseID);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoView(courseID: widget.courseID),
            ),
          );
        },
        child: Container(
          // height: 100,
          width: MediaQuery.of(context).size.width - 50,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(Icons.play_circle_outline, color: Color(0xff3D8FEF)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Structure of a Compiler',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '04:28 min',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4A4A4A),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_sharp, color: Color(0xff3D8FEF)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Color(0xff3D8FEF) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
