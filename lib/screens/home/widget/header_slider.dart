import 'package:flutter/material.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/screens/home/bloc/main_screen_bloc.dart';
import 'package:kalco_flutter/screens/home/widget/header_slide.dart';
import 'package:kalco_flutter/screens/movie_details/movie_details_screen.dart';

class HeaderSlider extends StatefulWidget {

  final MainScreenBloc mainScreenBloc;

  HeaderSlider(this.mainScreenBloc);

  @override
  _HeaderSliderState createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {

  @override
  void initState() {
    widget.mainScreenBloc.getHeaderMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: _buildSlider(widget.mainScreenBloc),
    );
  }

  Widget _buildSlider(MainScreenBloc bloc) {
    return StreamBuilder<ApiResponse<List<Movie>>>(
      stream: bloc.moviesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Text('Loading');
              break;
            case Status.COMPLETED:
              return _buildSliderView(snapshot.data.data);
              break;
            case Status.ERROR:
              return Text(snapshot.data.message);
              break;
          }
        }
        return Container();
      }

    );
  }

  Widget _buildSliderView(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: PageView(
        controller: PageController(
            initialPage: 1,
        ),
        children: movies.map((Movie movie) => HeaderSlide(movie)).toList(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}