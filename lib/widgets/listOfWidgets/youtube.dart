import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
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
  YoutubePlayerController _controller;
  YtChannel channel;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;


  Future loadVideos() async {
    channel = await ytApi.getChannelFromId("UCM-33fStj54y170Thw9M0kw");
    List<YtVideo> videoList =
        await channel.getPageOfVideos(numResults: 15, showDuration: true);
    setState(() {
      videos = videoList;
    });
  }

  Future nextPage() async {
    List<YtVideo> videoList = await channel.getPageOfVideos(
        numResults: 15, showDuration: true, showNextPage: true);
    setState(() {
      videos = videoList;
    });
  }

  Future prevPage() async {
    List<YtVideo> videoList = await channel.getPageOfVideos(
        numResults: 10, showDuration: true, showPrevPage: true);
    setState(() {
      videos = videoList;
    });
  }

  ctrforvideos(String id) {
    return YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        mute: false,
      ),
    );
  }

  
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return videos != null
        ? Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.teal,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Our youtube channel",
                style: TextStyle(color: Colors.teal),
              ),
              backgroundColor: Colors.white12,
              elevation: 0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var element in videos)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: YoutubePlayerBuilder(
                            player: YoutubePlayer(
                              controller: ctrforvideos(element.videoId),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: ProgressBarColors(
                                  playedColor: Colors.amber,
                                  handleColor: Colors.amberAccent),
                              onReady: () {
                                _controller.addListener(listener);
                              },
                            ),
                            builder: (BuildContext ctx, Widget player) {
                              return ExpansionTile(
                                subtitle: Text(
                                  element.publishedAt.toString(),
                                  style: AppTheme.caption
                                      .copyWith(color: Colors.green[700]),
                                ),
                                leading: Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                        element.thumbnailDetails.default_.url)),
                                title: Text(element.title),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: player,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Text(
                                      element.description,
                                      style: AppTheme.caption,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton.icon(
                                            label: Text(
                                              "Source code",
                                              style: AppTheme.caption.copyWith(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.black45,
                                            icon: Icon(Icons.code,
                                                color: Colors.white),
                                            onPressed: () async {
                                              var url =
                                                  'https://github.com/tmeeducation/TME-EDU-ARD-2-examples';
                                              if (await canLaunch(url)) {
                                                await launch(url,
                                                    forceSafariVC: false);
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            }),
                                        RaisedButton.icon(
                                            label: Text(
                                              "TME Education",
                                              style: AppTheme.caption.copyWith(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.amber,
                                            icon: Icon(Icons.read_more_outlined,
                                                color: Colors.white),
                                            onPressed: () async {
                                              var url =
                                                  'https://tmeeducation.com/en-ZA';
                                              if (await canLaunch(url)) {
                                                await launch(url,
                                                    forceSafariVC: false);
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),

                        SizedBox(
                        height: screen.height * 0.1,
                      )

                    ],
                  ),
                ),
                Container(
                  width: screen.width,
                  height: screen.height,
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(onPressed: prevPage, mini: true, child: Icon(Icons.chevron_left_outlined),),
                          FloatingActionButton(onPressed: nextPage, mini: true, child: Icon(Icons.chevron_right_outlined),),
                        ],
                      ),
                      SizedBox(
                        height: screen.height * 0.02,
                      )
                    ],
                  ),
                )
              ],
            ))
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
                  child: Text(
                    "Loading depends on your Internet",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
  }
}
