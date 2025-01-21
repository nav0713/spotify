import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/darkTheme.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  const BasicAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: title?? const Text(''),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
        
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: !context.isDarkMode
                    ? Colors.white.withOpacity(.03)
                    : Colors.black,
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          )),
    );
  }
  
  @override
 Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
