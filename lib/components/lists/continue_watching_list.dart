import 'package:flutter/material.dart';

import '../../models/course.dart';
import '../cards/continue_watching_card.dart';

class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({super.key});

  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  int currentWidget = 0;

  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map((course) {
        var index = continueWatchingCourses.indexOf(course);
        return Container(
          margin: EdgeInsets.only(left: 14.0),
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: (index == currentWidget)
                ? Color(0xFF0971FE)
                : Color(0xFFA6AEBD),
            shape: BoxShape.circle,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return ContinueWatchingCard(
                course: continueWatchingCourses[index],
              );
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
            itemCount: continueWatchingCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentWidget = index;
              });
            },
          ),
        ),
        updateIndicator(),
      ],
    );
  }
}
