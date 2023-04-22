import 'dart:math';

import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  const CertificateViewer({super.key});

  @override
  State<CertificateViewer> createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  late Widget certificateViewer;
  final List<String> certificatePaths = [
    "asset/certificates/certificate-01.png",
    "asset/certificates/certificate-02.png",
    "asset/certificates/certificate-03.png",
  ];
  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];

    certificatePaths.reversed.toList().asMap().forEach((idx, image) {
      // Get a random number
      late int randomDeg;
      if (idx == certificatePaths.length - 1) {
        randomDeg = 0;
      } else {
        randomDeg = Random().nextInt(10) - 5;
      }
      imageChildren.add(Transform.rotate(
        angle: (pi / 180) * randomDeg,
        child: Image.asset(
          image,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ));
    });
    certificateViewer = Stack(children: imageChildren);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: certificateViewer,
    );
  }
}
