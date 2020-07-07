import 'package:flutter/material.dart';
import 'package:vix/domain/models/episode.dart';
import 'package:vix/screens/player/player_screen.dart';

class EpisodesBottomSheet extends StatelessWidget {
  final List<Episode> episodes;

  const EpisodesBottomSheet({this.episodes});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.transparent, child: _itemsList());
  }

  Widget _itemsList() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 1.0,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0))),
          child: ListView.builder(
            controller: myscrollController,
            itemCount: episodes.length,
            itemBuilder: (BuildContext context, int index) {
              return _episodeItem(episodes[index], context);
            },
          ),
        );
      },
    );
  }

  Widget _episodeItem(Episode episode, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => PlayerScreen(episode: episode,)
          ));
        },
        child: Container(
          child: Text(
            episode.name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
