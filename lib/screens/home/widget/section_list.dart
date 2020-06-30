import 'package:flutter/material.dart';
import 'package:kalco_flutter/bloc/main/main_screen_bloc.dart';
import 'package:kalco_flutter/bloc/main/main_screen_event.dart';
import 'package:kalco_flutter/bloc/main/main_screen_state.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:kalco_flutter/screens/home/widget/section_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionsList extends StatelessWidget {

  final List<Section> sections;

  const SectionsList({this.sections});

  @override
  Widget build(BuildContext context) {
    return _buildSectionsListView(sections);
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
