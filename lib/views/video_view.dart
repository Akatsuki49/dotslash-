// // import 'package:dotslash/auth/firebase_auth_methods.dart';
// // import 'package:dotslash/widgets/video_player_widget.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class VideoView extends StatefulWidget {
// //   const VideoView({super.key});

// //   @override
// //   State<VideoView> createState() => _VideoViewState();
// // }

// // class _VideoViewState extends State<VideoView> {
// //   FirebaseAuth _auth = FirebaseAuth.instance;
// //   double _chatSheetHeight = 0.1; // Initial height of the chat sheet

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Stack(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(top: 30, bottom: 30),
// //             child: SingleChildScrollView(
// //               scrollDirection: Axis.vertical,
// //               physics: BouncingScrollPhysics(),
// //               child: Column(
// //                 crossAxisAlignment:
// //                     CrossAxisAlignment.start, // Align children to the start
// //                 children: [
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 30, right: 5),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Image.asset(
// //                           'assets/images/padh.ai.png',
// //                           height: 55,
// //                           width: 90,
// //                         ),
// //                         IconButton(
// //                           icon: Icon(Icons.logout, color: Colors.white),
// //                           onPressed: () async {
// //                             await FirebaseAuthMethods(_auth).signOut(context);
// //                           },
// //                         ),
// //                       ],
// //                     ),
// // //                   ),
// // //                   Padding(
// // //                     padding: const EdgeInsets.symmetric(vertical: 10),
// // //                     child: Container(
// // //                       // height: 250,
// // //                       width: MediaQuery.of(context).size.width,
// // //                       decoration: BoxDecoration(
// // //                         image: DecorationImage(
// // //                           image:
// // //                               AssetImage('assets/images/background_image.png'),
// // //                           fit: BoxFit.cover,
// // //                         ),
// // //                       ),
// // //                       child: Padding(
// // //                         padding: EdgeInsets.all(5.0),
// // //                         child: Column(
// // //                           children: [
// // //                             Align(
// // //                               alignment: Alignment.centerLeft,
// // //                               child: Text(
// // //                                 'Introduction to Cloud Computing',
// // //                                 style: GoogleFonts.inter(
// // //                                   color: Colors.white,
// // //                                   fontSize: 17,
// // //                                   fontWeight: FontWeight.w500,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             Align(
// // //                               alignment: Alignment.centerLeft,
// // //                               child: Text(
// // //                                 'Cloud Computing (UE21CS541A)',
// // //                                 style: GoogleFonts.inter(
// // //                                   color: Color(0xff8C8C8C),
// // //                                   fontSize: 13,
// // //                                   fontWeight: FontWeight.w500,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             VideoPlayerWidget(
// // //                                 videoAsset: 'assets/videos/Av_video1.mp4'),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 30, right: 5),
// // //                     child: Text(
// // //                       'Up Next',
// // //                       style: GoogleFonts.inter(
// // //                         color: Colors.white,
// // //                         fontSize: 17,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   upnextwidgets(),
// // //                   Padding(
// // //                     padding: const EdgeInsets.only(left: 30),
// // //                     child: Image.asset('assets/images/Need_Help.png',
// // //                         height: 90, width: 350),
// // //                   ),
// // //                   Padding(
// // //                     padding: const EdgeInsets.only(left: 130),
// // //                     child: Image.asset('assets/images/VP.png',
// // //                         height: 95, width: 150),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           AnimatedContainer(
// // //             duration: Duration(milliseconds: 300),
// // //             height: MediaQuery.of(context).size.height * _chatSheetHeight,
// // //             child: DraggableScrollableSheet(
// // //               initialChildSize: _chatSheetHeight,
// // //               maxChildSize: 0.8,
// // //               minChildSize: 0.1,
// // //               builder: (context, scrollController) {
// // //                 return SingleChildScrollView(
// // //                   controller: scrollController,
// // //                   child: ChatScreen(),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           Positioned(
// // //             bottom: 0,
// // //             left: 30,
// // //             child: GestureDetector(
// // //               onVerticalDragUpdate: (details) {
// // //                 double newHeight = _chatSheetHeight -
// // //                     details.delta.dy / MediaQuery.of(context).size.height;
// // //                 setState(() {
// // //                   _chatSheetHeight = newHeight.clamp(0.1, 0.8);
// // //                 });
// // //               },
// // //               child: Image.asset('assets/images/swipeUp.png',
// // //                   height: 100, width: 350),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget upnextwidgets() {
// // //     return SingleChildScrollView(
// // //         scrollDirection: Axis.horizontal,
// // //         physics: BouncingScrollPhysics(),
// // //         child: Row(children: List.generate(10, (index) => nextwidget())));
// // //   }

// // //   Widget nextwidget() {
// // //     return Image.asset(
// // //       'assets/images/NextVids.png',
// // //       height: 150,
// // //       width: 150,
// // //     );
// // //   }
// // // }

// // // class ChatScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor:
// // //           Colors.white, // Set the background color of the chat screen
// // //       body: Column(
// // //         children: [
// // //           // Add your chat UI components here
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:dotslash/auth/firebase_auth_methods.dart';
// // import 'package:dotslash/views/chat_page.dart';
// // import 'package:dotslash/widgets/video_player_widget.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class VideoView extends StatefulWidget {
// //   const VideoView({Key? key}) : super(key: key);

// //   @override
// //   State<VideoView> createState() => _VideoViewState();
// // }

// // class _VideoViewState extends State<VideoView> {
// //   FirebaseAuth _auth = FirebaseAuth.instance;
// //   double _chatSheetHeight = 0.1; // Initial height of the chat sheet

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Stack(
// //         children: [
// //           SingleChildScrollView(
// //             scrollDirection: Axis.vertical,
// //             physics: BouncingScrollPhysics(),
// //             child: Column(
// //               crossAxisAlignment:
// //                   CrossAxisAlignment.start, // Align children to the start
// //               children: [
// //                 Padding(
// //                   padding: EdgeInsets.only(left: 30, right: 5, top: 30),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Image.asset(
// //                         'assets/images/padh.ai.png',
// //                         height: 55,
// //                         width: 90,
// //                       ),
// //                       IconButton(
// //                         icon: Icon(Icons.logout, color: Colors.white),
// //                         onPressed: () async {
// //                           await FirebaseAuthMethods(_auth).signOut(context);
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 10),
// //                   child: Container(
// //                     // height: 250,
// //                     width: MediaQuery.of(context).size.width,
// //                     decoration: BoxDecoration(
// //                       image: DecorationImage(
// //                         image: AssetImage('assets/images/background_image.png'),
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                     child: Padding(
// //                       padding: EdgeInsets.all(5.0),
// //                       child: Column(
// //                         children: [
// //                           Align(
// //                             alignment: Alignment.centerLeft,
// //                             child: Text(
// //                               'Introduction to Cloud Computing',
// //                               style: GoogleFonts.inter(
// //                                 color: Colors.white,
// //                                 fontSize: 17,
// //                                 fontWeight: FontWeight.w500,
// //                               ),
// //                             ),
// //                           ),
// //                           Align(
// //                             alignment: Alignment.centerLeft,
// //                             child: Text(
// //                               'Cloud Computing (UE21CS541A)',
// //                               style: GoogleFonts.inter(
// //                                 color: Color(0xff8C8C8C),
// //                                 fontSize: 13,
// //                                 fontWeight: FontWeight.w500,
// //                               ),
// //                             ),
// //                           ),
// //                           VideoPlayerWidget(
// //                               videoAsset: 'assets/videos/Av_video1.mp4'),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.only(left: 30, right: 5),
// //                   child: Text(
// //                     'Up Next',
// //                     style: GoogleFonts.inter(
// //                       color: Colors.white,
// //                       fontSize: 17,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                 ),
// //                 upnextwidgets(),
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 30),
// //                   child: Image.asset('assets/images/Need_Help.png',
// //                       height: 90, width: 350),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 130),
// //                   child: Image.asset('assets/images/VP.png',
// //                       height: 95, width: 150),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           AnimatedPositioned(
// //             duration: Duration(milliseconds: 300),
// //             height: MediaQuery.of(context).size.height * _chatSheetHeight,
// //             bottom: 0,
// //             left: 0,
// //             right: 0,
// //             child: GestureDetector(
// //               onVerticalDragUpdate: (details) {
// //                 double newHeight = _chatSheetHeight -
// //                     details.delta.dy / MediaQuery.of(context).size.height;
// //                 setState(() {
// //                   _chatSheetHeight = newHeight.clamp(0.1, 0.8);
// //                 });
// //               },
// //               child: Container(
// //                 color: Colors.white,
// //                 child: DraggableScrollableSheet(
// //                   initialChildSize: _chatSheetHeight,
// //                   maxChildSize: 0.8,
// //                   minChildSize: 0.1,
// //                   builder: (context, scrollController) {
// //                     return SingleChildScrollView(
// //                       controller: scrollController,
// //                       child: ChatScreen(),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 0,
// //             left: 30,
// //             child: GestureDetector(
// //               onVerticalDragUpdate: (details) {
// //                 double newHeight = _chatSheetHeight -
// //                     details.delta.dy / MediaQuery.of(context).size.height;
// //                 setState(() {
// //                   _chatSheetHeight = newHeight.clamp(0.1, 0.8);
// //                 });
// //               },
// //               child: Image.asset('assets/images/swipeUp.png',
// //                   height: 100, width: 350),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget upnextwidgets() {
// //     return SingleChildScrollView(
// //         scrollDirection: Axis.horizontal,
// //         physics: BouncingScrollPhysics(),
// //         child: Row(children: List.generate(10, (index) => nextwidget())));
// //   }

// //   Widget nextwidget() {
// //     return Image.asset(
// //       'assets/images/NextVids.png',
// //       height: 150,
// //       width: 150,
// //     );
// //   }
// // }

// // class ChatScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //         color: Colors.white, // Set the background color of the chat screen
// //         child: Center(
// //           child: Text(''),
// //         ));
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: VideoView(),
// //   ));
// // }
// import 'package:dotslash/views/chat_page.dart';
// import 'package:dotslash/widgets/video_player_widget.dart';
// import 'package:flutter/material.dart';

// class VideoView extends StatefulWidget {
//   const VideoView({Key? key}) : super(key: key);

//   @override
//   State<VideoView> createState() => _VideoViewState();
// }

// class _VideoViewState extends State<VideoView> {
//   bool _showSwipeButton = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.only(top: 30, bottom: 30),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 30, right: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(
//                       'assets/images/padh.ai.png',
//                       height: 55,
//                       width: 90,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.logout, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/background_image.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Introduction to Cloud Computing',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Cloud Computing (UE21CS541A)',
//                             style: TextStyle(
//                               color: Color(0xff8C8C8C),
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         VideoPlayerWidget(
//                             videoAsset: 'assets/videos/Av_video1.mp4'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 30, right: 5),
//                 child: Text(
//                   'Up Next',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               upNextWidgets(),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30),
//                 child: Image.asset(
//                   'assets/images/Need_Help.png',
//                   height: 90,
//                   width: 350,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 130),
//                 child: Image.asset(
//                   'assets/images/VP.png',
//                   height: 95,
//                   width: 150,
//                 ),
//               ),
//               if (_showSwipeButton)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30),
//                   child: Dismissible(
//                     key: UniqueKey(),
//                     direction: DismissDirection.up,
//                     onDismissed: (_) {
//                       setState(() {
//                         _showSwipeButton = false;
//                       });
//                       Navigator.of(context).push(_createRoute());
//                     },
//                     child: Image.asset(
//                       'assets/images/swipeUp.png',
//                       height: 100,
//                       width: 350,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget upNextWidgets() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       physics: BouncingScrollPhysics(),
//       child: Row(
//         children: List.generate(
//           10,
//           (index) => nextWidget(),
//         ),
//       ),
//     );
//   }

//   Widget nextWidget() {
//     return Image.asset(
//       'assets/images/NextVids.png',
//       height: 150,
//       width: 150,
//     );
//   }

//   Route _createRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => ChatPage(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.ease;
//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }
// }

 VideoPlayerWidget(
//                               videoAsset: 'assets/videos/Av_video1.mp4'),
