import 'package:designcode/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../components/certificate_viewer.dart';
import '../components/lists/continue_watching_list.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
              child: Container(
                height: 4,
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Continue Watching",
              style: kTitle2Style,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: ContinueWatchingList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Certificates",
              style: kTitle2Style,
            ),
          ),
          Expanded(child: CertificateViewer())
        ],
      ),
      backdropEnabled: true,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(34.0)),
      color: kCardPopupBackgroundColor,
      boxShadow: const [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 32)
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
    );
  }
}
