import 'package:dotslash/views/list_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_widget.dart'; // Import your timewidget file

class ChotaWidget extends StatelessWidget {
  final String unitTitle;
  final String unitNo;
  final String courseID;

  const ChotaWidget(
      {Key? key,
      required this.unitTitle,
      required this.unitNo,
      required this.courseID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 5),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CourseListView(courseID: courseID)),
        ),
        child: Container(
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
                    child: Text(
                      unitNo,
                      style: GoogleFonts.josefinSans(
                        fontSize: 23,
                        color: Color(0xff2C2C2C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    unitTitle,
                    style: GoogleFonts.inter(
                      color: Color(0xff2C2C2C),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '+12 more',
                    style: GoogleFonts.inter(
                      color: Color(0xffAEAEAE),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                timewidget(), // Assuming TimeWidget is a stateless widget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
