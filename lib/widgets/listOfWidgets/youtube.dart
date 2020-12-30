import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:youtube_data_v3/youtube_data_v3.dart';
import 'package:youtube_data_v3/youtube_channel.dart';
import 'package:youtube_data_v3/youtube_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);

 PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ytApi.init("AIzaSyBwabVWfHP_saoouaaVZsufIKIwcqnmQo0");
    loadVideos();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videos != null
          ? Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.teal,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sample",
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
              child: Column(
                children: [
                  for (var element in videos)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ExpansionTile(
                        leading: Container(
                            height: 50,
                            width: 50,
                            child: Image.network(
                                element.thumbnailDetails.default_.url)),
                        title: Text(element.title),
                        children: [
                          YoutubePlayer(
                                        controller: _controller,
                                        showVideoProgressIndicator: true,
                                        progressIndicatorColor: Colors.amber,
                                        progressColors: ProgressBarColors(
                                          playedColor: Colors.amber,
                                          handleColor: Colors.amberAccent
                                        ),                               
                                        onReady: (){
                                          _controller.addListener(listener);
                                        },                                     
                                    ),
                        ],
                      ),
                    )
                ],
              ),
            )
          
    ) 
    : Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AwesomeLoader(
              loaderType: AwesomeLoader.AwesomeLoader3,
              color: Colors.teal,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Loading depends on your Internet", textAlign: TextAlign.center,),
            )
            ],
          ),
    );
  }
}
