import 'package:flutter/material.dart';
import 'package:designcode/constants.dart';
import 'package:designcode/components/sidebar_row.dart';
import 'package:designcode/models/sidebar.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kSidebarBackgroundColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(34.0))),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/profile.jpg"),
                  radius: 21,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yash Rathi", style: kHeadlineLabelStyle),
                    const SizedBox(height: 4),
                    Text(
                      "Subscription model valid till 2023",
                      style: kSearchPlaceholderStyle,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 64),
            SidebarRow(item: sidebarItem[0]),
            const SizedBox(height: 32),
            SidebarRow(item: sidebarItem[1]),
            const SizedBox(height: 32),
            SidebarRow(item: sidebarItem[2]),
            const SizedBox(height: 32),
            SidebarRow(item: sidebarItem[3]),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  "asset/icons/icon-logout.png",
                  height: 23,
                  width: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Log Out",
                  style: kSecondaryCalloutLabelStyle,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
