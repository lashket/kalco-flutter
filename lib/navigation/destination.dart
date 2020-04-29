import 'package:flutter/material.dart';

class Destination {

  const Destination(this.title, this.icon);

  final String title;
  final IconData icon;

}

const List<Destination> allDestinations = <Destination>[
  Destination('Сериалы', Icons.movie),
  Destination('Поиск', Icons.search),
  Destination('Профиль', Icons.school)
];