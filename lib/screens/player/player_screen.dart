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
                child: VideoPlayer(_playerController),
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
