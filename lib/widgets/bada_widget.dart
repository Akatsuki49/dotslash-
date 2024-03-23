import 'package:dotslash/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
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
            ),
          ],
        ),
      ),
    ),
  );
}
