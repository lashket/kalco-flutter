import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {


  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: new Container(
              decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(24.0),
                      topRight: const Radius.circular(24.0)
                  )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Text('Apply filter', style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)
                        ),
                        onPressed: () {},

                      ),
                    ),
                  )
                ],
              )),
        ),],
    );
  }
}