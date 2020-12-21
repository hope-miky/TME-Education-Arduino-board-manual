import 'package:flutter/material.dart';
import 'package:youtube_data_v3/youtube_data_v3.dart';
import 'package:youtube_data_v3/youtube_channel.dart';
import 'package:youtube_data_v3/youtube_video.dart';


class YoutubePage extends StatefulWidget {

  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample"),
      ),
    );
  }
}
