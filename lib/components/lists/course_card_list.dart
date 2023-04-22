import 'package:flutter/cupertino.dart';

import '../../models/course.dart';
import '../cards/course_card.dart';

class RecentCoursesList extends StatefulWidget {
  const RecentCoursesList({super.key});

  @override
  State<RecentCoursesList> createState() => _RecentCoursesListState();
}

class _RecentCoursesListState extends State<RecentCoursesList> {
  int currentPage = 0;

  Widget updateIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map(
        (course) {
          var courseIdx = recentCourses.indexOf(course);
          return Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ((courseIdx == currentPage)
                    ? const Color(0xFF0971FE)
                    : const Color(0xFFA6AEBD))),
            height: 8,
            width: 8,
            margin: const EdgeInsets.symmetric(horizontal: 6),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) => Opacity(
              opacity: (currentPage == index) ? 1 : 0.5,
              child: RecentCourseCard(
                course: recentCourses[index],
              ),
            ),
            itemCount: recentCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.63),
            onPageChanged: (index) => {
              setState(
                () => {currentPage = index},
              )
            },
          ),
        ),
        updateIndicator()
      ],
    );
  }
}
