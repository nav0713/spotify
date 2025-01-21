import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/main.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/widgets/backdrop.dart';
import 'package:spotify/presentation/widgets/basic_button.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.chooseModeBG))),
            child: Column(
              children: [
                const Gap(40),
                SvgPicture.asset(
                  AppVectors.logo,
                  alignment: Alignment.topCenter,
                ),
                const Spacer(),
                const Text(
                  "Choose Mode",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const Gap(56),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Backrop(
                      onpressed: () {
                          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      iconData: Icons.sunny,
                    ),
                    const Gap(52),
                    Backrop(
                      onpressed: () {
                         context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      iconData: Icons.mode_night,
                    ),
                  ],
                ),
                const Gap(42),
                BasicAppButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return const SignupOrSigninPage();
                  }));
                }, title: "Continue")
              ],
            ),
          )
        ],
      ),
    );
  }
}
