import 'package:flutter/cupertino.dart';

class ItemsModel {
  final Widget icon;
  final String title;
  final Function() onTap;

  ItemsModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
