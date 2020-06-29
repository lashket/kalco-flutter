import 'package:flutter/material.dart';
import 'package:kalco_flutter/bloc/main/main_screen_bloc.dart';
import 'package:kalco_flutter/bloc/main/main_screen_event.dart';
import 'package:kalco_flutter/bloc/main/main_screen_state.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:kalco_flutter/screens/home/widget/section_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _buildSectionList(context);
  }

  Widget _buildSectionList(BuildContext context) {
    BlocProvider.of<MainScreenBloc>(context).add(LoadSectionsEvent());
    return BlocListener<MainScreenBloc, MainScreenState> (
      listener: (context, state) {

      },
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if(state is MainScreenInitial) {

          }
          if(state is SectionsLoaded) {
            return _buildSectionsListView(state.sectionItems);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSectionsListView(List<Section> sections) {
    return Column(
      children: sections
          .map((Section section) => SectionView(
                section: section,
              ))
          .toList(),
    );
  }
}
