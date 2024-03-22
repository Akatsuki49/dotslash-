import 'package:flutter/material.dart';
import '../widgets/video_player_widget.dart';
import '../models/video.dart';

class VideoView extends StatefulWidget {
  final Video video;

  VideoView({required this.video});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final List<String> _messages = [];
  final _textController = TextEditingController();

  void _sendMessage() {
    setState(() {
      _messages.add(_textController.text);
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: VideoPlayerWidget(
              videoUrl: widget.video.url,
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type your question',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
