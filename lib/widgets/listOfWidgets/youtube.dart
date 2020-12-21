import 'package:flutter/material.dart';
import 'package:youtube_data_v3/youtube_data_v3.dart';
import 'package:youtube_data_v3/youtube_channel.dart';
import 'package:youtube_data_v3/youtube_video.dart';

class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  final ytApi = YoutubeV3();
  List<YtVideo> videos;
  Future loadVideos() async {
    YtChannel channel =
        await ytApi.getChannelFromId("UCM-33fStj54y170Thw9M0kw");
    List<YtVideo> videoList =
        await channel.getPageOfVideos(numResults: 10, showDuration: true);
    setState(() {
      videos = videoList;
    });
  }

  @override
  void initState() {
    super.initState();
    ytApi.init("AIzaSyBwabVWfHP_saoouaaVZsufIKIwcqnmQo0");
    loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample"),
      ),
      body: Column(children: [
        for(var element in videos)
          ListTile(
            title: Text(element.title),
          )
      ],),
    );
  }
}
