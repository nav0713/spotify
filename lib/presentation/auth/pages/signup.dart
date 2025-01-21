import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/widgets/app_bar/appBar.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/widgets/basic_button.dart';
import 'package:spotify/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(50),
            const Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(30),

            ///fullname
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Full name")
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const Gap(18),

            /// email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email")
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const Gap(18),

            ///password
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password")
                  .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const Gap(32),

            ///create an account button
            SizedBox(
                width: double.maxFinite,
                child: BasicAppButton(
                    height: 80,
                    onPressed: () async {
                      var result = await service_locator<SignupUseCase>().call(
                          params: CreateUserReq(
                              fullname: nameController.text,
                              email: emailController.text,
                              password: passwordController.text));
                      result.fold((left) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(left)));
                      }, (right) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Home();
                        }));
                      });
                    },
                    title: "Create an Account")),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do you have an Account?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return  SignIn();
                      }));
                    },
                    child: const Text("Sign In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
