import 'package:dotslash/widgets/bada_widget.dart';
import 'package:dotslash/widgets/chota_widget.dart';
import 'package:flutter/material.dart';

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
            ChotaWidget(unitNo: u1, unitTitle: "Unit 1", courseID: courseID),
            ChotaWidget(unitNo: u2, unitTitle: "Unit 2", courseID: courseID),
            ChotaWidget(unitNo: u3, unitTitle: "Unit 3", courseID: courseID),
            ChotaWidget(unitNo: u4, unitTitle: "Unit 4", courseID: courseID),
          ],
        ),
      ));
}
