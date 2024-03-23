import 'package:flutter/material.dart';

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
