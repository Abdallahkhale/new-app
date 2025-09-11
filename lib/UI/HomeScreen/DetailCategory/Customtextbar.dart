import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/model/SourcesData.dart';

class Customtextbar extends StatefulWidget {
  const Customtextbar({super.key, required this.data , required this.selected});
  final bool selected;
  final SourcesData data;

  @override
  State<Customtextbar> createState() => _CustomtextbarState();
}

class _CustomtextbarState extends State<Customtextbar> {
  @override
  Widget build(BuildContext context) {
  var theme = Theme.of(context);
    return Text(
      widget.data.name,
      style: theme.textTheme.headlineMedium!.copyWith(
        fontWeight:widget.selected ? FontWeight.bold : FontWeight.normal,
        color: widget.selected ? Colors.black : Colors.grey,
        fontSize: widget.selected ? 18 : 16,
      ),
    );
  }
}