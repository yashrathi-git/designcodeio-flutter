import 'package:designcode/components/search_field_widget.dart';
import 'package:designcode/components/sidebar_button.dart';
import 'package:flutter/material.dart';

class HomeScreenNavBar extends StatelessWidget {
  final Function triggerAnimation;
  const HomeScreenNavBar({super.key, required this.triggerAnimation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Row(
        children: [
          SidebarButton(triggerAnimation: triggerAnimation),
          const SearchFieldWidget(),
          const Icon(Icons.notifications),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage("asset/images/profile.jpg"),
          )
        ],
      ),
    );
  }
}
