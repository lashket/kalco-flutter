import 'package:flutter/material.dart';
import 'package:kalco_flutter/base/bloc_provider.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:kalco_flutter/screens/home/bloc/main_screen_bloc.dart';
import 'package:kalco_flutter/screens/home/widget/section_view.dart';

class SectionsList extends StatefulWidget {
  final MainScreenBloc mainScreenBloc;

  SectionsList(this.mainScreenBloc);

  @override
  _SectionsListState createState() => _SectionsListState();
}

class _SectionsListState extends State<SectionsList> {
  @override
  void initState() {
    widget.mainScreenBloc.getSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSectionList(widget.mainScreenBloc);
  }

  Widget _buildSectionList(MainScreenBloc bloc) {
    return StreamBuilder<ApiResponse<List<Section>>>(
      stream: bloc.sectionsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Text('Loading');
              break;
            case Status.COMPLETED:
              return _buildSectionsListView(snapshot.data.data);
              break;
            case Status.ERROR:
              return Text(snapshot.data.message);
              break;
          }
        }
        return Container();
      },
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
