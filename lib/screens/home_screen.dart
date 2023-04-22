import 'package:designcode/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';

import '../components/homescreen_navbar.dart';
import '../components/lists/course_card_list.dart';
import '../components/lists/explore_course_list.dart';
import '../constants.dart';
import 'continue_watching_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;
  late Animation<double> fadeAnimation;
  bool isNavigationOpen = false;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    sidebarAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(children: [
          SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(
                  triggerAnimation: () {
                    sidebarAnimationController.forward();
                    setState(() {
                      isNavigationOpen = true;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recents",
                        style: kLargeTitleStyle,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "23 more courses coming",
                        style: kSubtitleStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const RecentCoursesList(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Explore", style: kTitle1Style),
                    ],
                  ),
                ),
                ExploreCourseList()
              ],
            ),
          ),
          ContinueWatchingScreen(),
          IgnorePointer(
            ignoring: !isNavigationOpen,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: GestureDetector(
                    onTap: () {
                      sidebarAnimationController.reverse();
                      setState(() {
                        isNavigationOpen = false;
                      });
                    },
                    child: Container(
                      color: Color.fromRGBO(36, 38, 41, 0.4),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SlideTransition(
                  position: sidebarAnimation,
                  child: const SafeArea(
                    bottom: false,
                    child: SidebarScreen(),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
