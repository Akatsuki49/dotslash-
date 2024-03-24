import 'package:dotslash/views/home_view.dart';
import 'package:dotslash/widgets/auth_textfield.dart';
import 'package:dotslash/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_email_screen.dart';
import 'firebase_auth_methods.dart';
import '/widgets/auth_icon_button.dart';
import 'package:flutter/gestures.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void onGoogleSignIn() async {
    context.read<FirebaseAuthMethods>().signInWithGoogle(context);
  }

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21.0),
              child: Image.asset(
                'assets/images/padhai.png',
                width: 150.0, // Adjust width as needed
                height: 150.0, // Adjust height as needed
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21.0, right: 20.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white), // Set text color to white
              ),
            ),
            SizedBox(height: 39.0), // Space for logo image
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
              child: Container(
                height: 42.5,
                width: 250.0, // Set the desired width here
                child: AuthTextField(
                  controller: emailController,
                  hintText: 'Sign Up Using Email',
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
              child: Container(
                height: 42.5,
                width: 250.0, // Set the desired width here
                child: AuthTextField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'or',
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                        0.5), // Set text color to 50% opacity white
                    fontSize: 18.0, // Set the desired font size
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 0.0, top: 0.0, bottom: 10.0),
              child: Container(
                height: 42.5,
                width: 275.0, // Set the desired width here
                child: ElevatedButton(
                  onPressed: () {
                    onGoogleSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Set button color to white
                    foregroundColor: Colors.black, // Set text color to black
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          107.0), // Set the corner radius to 107
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo123.png',
                        width: 30.0,
                        height: 30.0,
                      ),
                      const SizedBox(
                          width:
                              7.0), // Added to reduce space between logo and text
                      const Text(
                        'Sign up using Google',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18.0), // Set the desired font size here
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),

            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 49.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailPasswordLogin()),
                  );
                },
                child: Image.asset(
                  'assets/images/pes.png',
                  width: 50.0, // Set the desired width for the image
                  height: 50.0, // Set the desired height for the image
                ),
              ),
            ),

            Stack(
              children: [
                // Your existing UI elements
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/4...png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
                Positioned(
                  bottom: -20.0,
                  right: 15.0,
                  child: GestureDetector(
                    onTap: () => signUpUser(),
                    child: Image.asset(
                      'assets/images/abc.png',
                      width: 150.0, // Adjust the width as needed
                      height: 150.0, // Adjust the height as needed
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: const Color(0xff111011),
    //   body: Stack(
    //     children: [
    //       Positioned(
    //         bottom: 150,
    //         left: 20,
    //         right: 20,
    //         child: Container(
    //           // alignment: Alignment.topLeft,
    //           color: Colors.amber,
    //           // child: Image.asset(
    //           //   "assets/images/Union.png",
    //           //   height: 420,
    //           //   width: 600,
    //           //   fit: BoxFit.fill,
    //           // ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(24.0),
    //         child: Column(
    //           // mainAxisAlignment: MainAxisAlignment.center,
    //           // crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: screenHeight * 0.1),
    //             Container(
    //               color: Colors.amber,
    //               height: 200,
    //               width: 200,
    //             ),
    //             // SvgPicture.asset(
    //             //   'assets/images/logo.svg',
    //             //   width: screenWidth * 0.65,
    //             // ),
    //             SizedBox(height: screenHeight * 0.05),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 25),
    //               child: Text(
    //                 'log into your readmore account',
    //                 style: GoogleFonts.robotoFlex(
    //                     color: const Color(0xffCDCDCD),
    //                     fontSize: 35,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             Column(
    //               children: [
    //                 _googlebtn(),
    //                 // SizedBox(
    //                 //   height: 30,
    //                 // ),
    //                 OrDivider(),
    //                 _emailbtn(),

    //                 SizedBox(
    //                   height: 90,
    //                 ),

    //                 GestureDetector(
    //                   onTap: () => Navigator.of(context).push(MaterialPageRoute(
    //                     builder: (context) {
    //                       return const EmailPasswordSignup();
    //                     },
    //                   )),
    //                   child: Text("don’t have an account_ Sign Up here",
    //                       style: GoogleFonts.inter(
    //                           color: Colors.white, fontSize: 15)),
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Widget _googlebtn() {
  //   return GestureDetector(
  //     onTap: () => onGoogleSignIn(),
  //     child: Container(
  //       height: 70,
  //       width: 300,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50),
  //         color: const Color(0xffCDCDCD),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Row(
  //           // crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               color: Colors.amber,
  //               height: 200,
  //               width: 200,
  //             ),
  //             // Image.asset(
  //             //   'assets/images/Google__G__logo 1.png',
  //             //   // height: 40,
  //             //   // width: 40,
  //             // ),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             Text(
  //               "Sign in with Google",
  //               style: GoogleFonts.inter(color: Colors.black, fontSize: 17),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _emailbtn() {
  //   return GestureDetector(
  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) {
  //         return const EmailPasswordLogin();
  //       },
  //     )),
  //     child: Container(
  //       height: 70,
  //       width: 300,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(50),
  //         color: const Color(0xffCDCDCD),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Center(
  //           child: Text(
  //             "Sign Up using email",
  //             style: GoogleFonts.inter(color: Colors.black, fontSize: 17),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
