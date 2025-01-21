import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/helpers/darkTheme.dart';
import 'package:spotify/common/widgets/app_bar/appBar.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/widgets/basic_button.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBg)),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const Gap(55),
                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  const Gap(21),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: BasicAppButton(
                              onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                              return  SignupPage();
                            }));
                              }, title: "Register")),
                              const Gap(24)
,                      TextButton(
                          onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                              return  SignIn();
                            }));
                          },
                          child:  Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode? Colors.white:Colors.black),
                          ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}


