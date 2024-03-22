import 'package:flutter/material.dart';
import 'video_view.dart';
import 'faq_view.dart';
import 'package:dotslash/models/video.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Video> videos = [
    Video(
      id: '1',
      title: 'Introduction to Flutter',
      url: 'https://example.com/flutter-intro.mp4',
      description: 'Learn the basics of Flutter development',
      materials: ['https://example.com/flutter-intro.pdf'],
    ),
    Video(
      id: '2',
      title: 'State Management in Flutter',
      url: 'https://example.com/state-management.mp4',
      description: 'Explore different state management techniques',
      materials: ['https://example.com/state-management.pdf'],
    ),
    // Add more videos here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk To Videos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    'https://picsum.photos/seed/${videos[index].id}/200/300',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(videos[index].title),
                  subtitle: Text(videos[index].description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoView(
                          video: videos[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaqView()),
                  );
                },
                child: Text('FAQ'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
