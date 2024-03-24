import 'package:dotslash/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_methods.dart';
import '/widgets/auth_textfield.dart';

class EmailPasswordLogin extends StatefulWidget {
  const EmailPasswordLogin({super.key});

  @override
  _EmailPasswordLoginState createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    context.read<FirebaseAuthMethods>().signInWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
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
                'Login',
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
                  hintText: 'Enter Your Email',
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
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dont have an account?',
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
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Image.asset(
                  'assets/images/pesu.png',
                  width: 70.0, // Set the desired width for the image
                  height: 70.0, // Set the desired height for the image
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
                    onTap: () => loginUser(),
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
    //   backgroundColor: Colors.black,
    //   body: Column(
    //     // mainAxisAlignment: MainAxisAlignment.center,
    //     // crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(left: 21.0),
    //         child: Image.asset(
    //           'assets/images/padhai.png',
    //           width: 200.0, // Adjust width as needed
    //           height: 250.0, // Adjust height as needed
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(left: 21.0, right: 20.0),
    //         child: Text(
    //           'Log in',
    //           style: TextStyle(
    //             fontSize: 24.0,
    //             fontFamily: 'Inter',
    //             fontWeight: FontWeight.w700, // Use FontWeight.w700 for bold
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 39.0), // Space for logo image
    //       Padding(
    //         padding: EdgeInsets.only(
    //           left: 20.0,
    //           right: 20.0,
    //           bottom: 10.0,
    //         ),
    //         child: Container(
    //           height: 42.5,
    //           width: 250.0, // Set the desired width here
    //           child: ElevatedButton(
    //             onPressed: () {},
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.white, // Set button color to white
    //               foregroundColor: Colors.black, // Set text color to black
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(
    //                   107.0,
    //                 ), // Set the corner radius to 107
    //               ),
    //             ),
    //             child: Align(
    //               alignment: Alignment.centerLeft,
    //               child: AuthTextField(
    //                 controller: emailController,
    //                 hintText: 'Enter your email',
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),

    //       const SizedBox(height: 12.0),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 38.0),
    //         child: Align(
    //           alignment: Alignment.centerLeft,
    //           child: Text(
    //             'and',
    //             style: TextStyle(
    //               color: Colors.white
    //                   .withOpacity(0.5), // Set text color to 50% opacity white
    //               fontSize: 18.0, // Set the desired font size
    //             ),
    //           ),
    //         ),
    //       ),

    //       const SizedBox(height: 24.0),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 20.0, right: 0.0, top: 0.0, bottom: 10.0),
    //         child: Container(
    //           height: 42.5,
    //           width: 250.0, // Set the desired width here
    //           child: ElevatedButton(
    //             onPressed: () {},
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.white, // Set button color to white
    //               foregroundColor: Colors.black, // Set text color to black
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(
    //                     107.0), // Set the corner radius to 107
    //               ),
    //             ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 // Image.asset(
    //                 //   'assets/images/logo123.png',
    //                 //   width: 30.0,
    //                 //   height: 30.0,
    //                 // ),
    //                 SizedBox(width: 7.0),
    //                 AuthTextField(
    //                   controller: passwordController,
    //                   hintText: 'Enter your password',
    //                 ), // Added to reduce space between logo and text
    //                 // Text(
    //                 //   'Password',
    //                 //   textAlign: TextAlign.left,
    //                 //   style: TextStyle(
    //                 //       fontSize: 18.0), // Set the desired font size here
    //                 // ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 10.0),

    //       const SizedBox(height: 20.0),
    //       const Padding(
    //         padding: EdgeInsets.only(left: 30.0, bottom: 0.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               'Do not have an account?',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 16.0, // Set the desired font size here
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 0.0, left: 30.0, bottom: 9.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             InkWell(
    //               onTap: () {
    //                 loginUser();
    //               },
    //               child: Image.asset(
    //                 'assets/images/pesu.png',
    //                 width: 90.0, // Set the desired width for the image
    //                 height: 90.0, // Set the desired height for the image
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),

    //       Stack(
    //         children: [
    //           // Your existing UI elements
    //           Align(
    //             alignment: Alignment.bottomCenter,
    //             child: Image.asset(
    //               'assets/images/4...png',
    //               width: MediaQuery.of(context).size.width,
    //               fit: BoxFit.cover,
    //               height: MediaQuery.of(context).size.height / 4,
    //             ),
    //           ),
    //           Positioned(
    //             bottom: -20.0,
    //             right: 15.0,
    //             child: Image.asset(
    //               'assets/images/abc.png',
    //               width: 150.0, // Adjust the width as needed
    //               height: 150.0, // Adjust the height as needed
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       // SvgPicture.asset(
    //       //   '/Users/shubh/development/WealHack/frontend/emosense/assets/images/bhai.svg',
    //       //   width: MediaQuery.of(context).size.width * 0.1,
    //       //   height: MediaQuery.of(context).size.height * 0.1,
    //       // ),
    //       SizedBox(height: MediaQuery.of(context).size.height * 0.08),
    //       const Text(
    //         "Login with Email",
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: 35,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       SizedBox(height: MediaQuery.of(context).size.height * 0.08),
    //       Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 20),
    //         child: AuthTextField(
    //           controller: emailController,
    //           hintText: 'Enter your email',
    //         ),
    //       ),
    //       const SizedBox(height: 20),
    //       Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 20),
    //         child: AuthTextField(
    //           controller: passwordController,
    //           hintText: 'Enter your password',
    //         ),
    //       ),
    //       const SizedBox(height: 40),
    //       ElevatedButton(
    //         onPressed: loginUser,
    //         style: ButtonStyle(
    //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //             RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(25.0),
    //               side: const BorderSide(color: Colors.black),
    //             ),
    //           ),
    //           backgroundColor: MaterialStateProperty.all(Colors.black),
    //           textStyle: MaterialStateProperty.all(
    //             const TextStyle(color: Colors.white),
    //           ),
    //           minimumSize: MaterialStateProperty.all(
    //             Size(MediaQuery.of(context).size.width / 3.5, 50),
    //           ),
    //         ),
    //         child: const Text(
    //           "Login",
    //           style: TextStyle(color: Colors.white, fontSize: 16),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
