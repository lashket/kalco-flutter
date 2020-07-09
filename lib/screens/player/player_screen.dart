import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vix/bloc/player/player_screen_bloc.dart';
import 'package:vix/bloc/player/player_screen_event.dart';
import 'package:vix/bloc/player/player_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/domain/models/episode.dart';

class PlayerScreen extends StatefulWidget {

  final Episode episode;

  const PlayerScreen({this.episode});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  
  VideoPlayerController _playerController;

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }


  Widget _body() {
    return BlocBuilder<PlayerScreenBloc, PlayerScreenState>(
      builder: (context, state) {
        if(state is PlayerInitial) {
          _playerController = VideoPlayerController.network(
              widget.episode.urls.translations[0].resolutions[0].url)
            ..initialize().then((_) {
              _playerController.play();
              BlocProvider.of<PlayerScreenBloc>(context).add(StartPlayingVideoEvent(link: widget.episode.urls.translations[0].resolutions[0].url));
            });
        }
        if(state is PlayVideo) {
          print('Loading video');
          return Center(
            child: _playerController.value.initialized ? Container(
              color: Theme.of(context).primaryColor,
              child: AspectRatio(
                aspectRatio: _playerController.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_playerController),
                    _PlayPauseOverlay(controller: _playerController,),
                    VideoProgressIndicator(_playerController, allowScrubbing: true),
                  ],
                ),
              ),
            )
                : Container(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        return Container();
      },
    );
  }



}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
