import "package:flutter/material.dart";
import "package:designcode/models/course.dart";
import "package:designcode/constants.dart";

class RecentCourseCard extends StatelessWidget {
  final Course course;
  const RecentCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 30,
                  ),
                  BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 30,
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseSubtitle,
                        style: kCardSubtitleStyle,
                      ),
                      Text(
                        course.courseTitle,
                        style: kCardTitleStyle,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "asset/illustrations/${course.illustration}",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Container(
            child: Image(image: AssetImage("asset/logos/${course.logo}")),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  const BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 16.0,
                  )
                ]),
            padding: EdgeInsets.all(12.0),
          ),
        )
      ],
    );
  }
}
