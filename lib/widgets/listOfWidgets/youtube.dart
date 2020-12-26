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
    print(videoList[0].thumbnailDetails.default_.url);
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
      body: videos != null
          ? SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var element in videos)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ExpansionTile(
                                leading: Image.network(element.thumbnailDetails.default_.url),
                                title: Text(element.title),
                                children: [
    
                                ],
                                ),
                            )
                        ],
              ),
          )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
