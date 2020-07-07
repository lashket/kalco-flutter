import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/bloc/player/player_screen_event.dart';
import 'package:vix/bloc/player/player_screen_state.dart';

class PlayerScreenBloc extends Bloc<PlayerScreenEvent, PlayerScreenState> {

  @override
  Stream<PlayerScreenState> mapEventToState(PlayerScreenEvent event) async* {
    if(event is StartPlayingVideoEvent) {
      yield PlayVideo(link: event.link);
    }
  }

  @override
  PlayerScreenState get initialState => PlayerInitial();
}