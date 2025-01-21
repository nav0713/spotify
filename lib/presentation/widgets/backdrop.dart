import 'dart:ui';

import 'package:flutter/material.dart';

class Backrop extends StatelessWidget {
      final IconData iconData;
      final Function() onpressed;
    const Backrop({
    super.key, required this.iconData,
    required this.onpressed
  });

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onpressed,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  color: Color(0xff30393c),
                  shape: BoxShape.circle),
              child:  Icon(
            iconData,
                size: 32,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}