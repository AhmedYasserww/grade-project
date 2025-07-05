import 'package:flutter/material.dart';
import 'package:untitled6/core/widgets/inputs/default_container.dart';

class SubjectItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SubjectItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      width: 300,
      height: 60,
      title: title,
      onpressed: onPressed,
    );
  }
}
