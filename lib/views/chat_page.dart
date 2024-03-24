import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dotslash/widgets/filled_text_field.dart';
import 'package:dotslash/widgets/message_widget.dart';
import 'package:dotslash/views/video_view.dart';
import 'package:http/http.dart' as http;

class Message {
  final String text;
  final bool isUser;

  Message({
    required this.text,
    required this.isUser,
  });
}

class ChatPage extends StatefulWidget {
  final String courseID;
  const ChatPage({Key? key, required this.courseID}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [
    Message(text: 'Hello!', isUser: false),
    Message(text: 'Hi there!', isUser: true),
  ];
  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            // Swipe down
            Navigator.of(context).pop();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF121212),
                          Color(0xFF121212),
                          Color(0xFF121212),
                          Color(0xFF121212),
                          Color(0xFF121212),
                          Color(0xFF005FCE),
                        ],
                        stops: [
                          0.0,
                          0.1,
                          0.2,
                          0.3,
                          0.4,
                          1.0,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            reverse:
                                true, // Display newer messages at the bottom
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final reversedIndex = messages.length - 1 - index;
                              return MessageBubble(
                                text: messages[reversedIndex].text,
                                isUser: messages[reversedIndex].isUser,
                              );
                            },
                          ),
                        ),
                        _buildMessageInput(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 2,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/swipeUp.png',
                      height: 55,
                      width: 280,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Expanded(
            child: FilledTextField(
              controller: _messageController,
              maxLines: 2,
              hintText: 'Type your message...',
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.grey[400]),
            onPressed: _isLoading ? null : _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      _addUserMessage(messageText);
      _getBotReply(messageText);
      _messageController.clear();
    }
  }

  void _addUserMessage(String messageText) {
    Message userMessage = Message(text: messageText, isUser: true);
    setState(() {
      messages.add(userMessage);
    });
  }

  // void _getBotReply(String messageText) {
  //   // Simulate a delay to mimic a backend request
  //   Timer(Duration(seconds: 2), () {
  //     String botReply = _generateBotReply(messageText);
  //     _addBotReply(botReply);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  void _getBotReply(String messageText) async {
    // Simulate a delay to mimic a backend request
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://4ee5-1-6-74-117.ngrok-free.app/ask_doubt'),
        body: {
          // 'courseID': "UE21CS342BA3", // Replace with actual course ID
          'courseID': widget.courseID,
          'question': messageText,
        },
      );

      if (response.statusCode == 200) {
        String botReply = response.body;
        _addBotReply(botReply);
      } else {
        throw Exception('Failed to fetch bot reply');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error here
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addBotReply(String botReply) {
    Message botMessage = Message(text: botReply, isUser: false);
    setState(() {
      messages.add(botMessage);
    });
  }

  String _generateBotReply(String message) {
    // This is a dummy function to generate a bot reply based on the user's message
    return 'This is a dummy bot reply to "$message".';
  }
}
