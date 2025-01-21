import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify/presentation/widgets/basic_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AppImages.introBG))),
            child: Column(
              children: [
                const Gap(40),
                SvgPicture.asset(
                  AppVectors.logo,
                  alignment: Alignment.topCenter,
                ),
                const Spacer(),
                const Text(
                  "Enjoy Listening to Music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const Gap(21),
                 const Text(
                  "With Spotify, it’s easy to find the right music or podcast for every moment – on your phone, your computer, your tablet and more.",textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13),
                      

                ),
                const Gap(20),
                BasicAppButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder :( BuildContext context){
                    return const ChooseMode();
                  }));
                }, title: "Get Started")
              ],
            ),
          )
        ],
      ),
    );
  }
}
