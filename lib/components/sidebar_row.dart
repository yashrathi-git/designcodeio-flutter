import 'package:designcode/constants.dart';
import 'package:flutter/material.dart';
import 'package:designcode/models/sidebar.dart';

class SidebarRow extends StatelessWidget {
  final SidebarItem item;
  const SidebarRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 42,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        const SizedBox(width: 12.0),
        Text(
          item.title,
          style: kCalloutLabelStyle,
        )
      ],
    );
  }
}
