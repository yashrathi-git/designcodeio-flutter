import 'package:flutter/material.dart';

import '../constants.dart';

class SidebarButton extends StatelessWidget {
  final Function triggerAnimation;
  const SidebarButton({
    super.key,
    required this.triggerAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => {triggerAnimation()},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16.0)
            ]),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        child: const Image(
          image: AssetImage(
            "asset/icons/icon-sidebar.png",
          ),
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
