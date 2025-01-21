import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/widgets/app_bar/appBar.dart';
import 'package:spotify/core/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/widgets/basic_button.dart';
import 'package:spotify/service_locator.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
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

            const Gap(18),

            /// email
            TextField(
              controller: email,
              decoration:
                  const InputDecoration(hintText: "Enter Username or Email")
                      .applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const Gap(18),

            ///password
            TextField(
              controller: password,
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
                      final result = await service_locator<SignupIneCase>()
                          .call(
                              params: SigninUserRequest(
                                  email: email.text, password: password.text));
                      result.fold((left) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(left)));
                      }, (right) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Home();
                        }));
                      });
                    },
                    title: "Sign In")),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not A Member?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SignupPage();
                      }));
                    },
                    child: const Text("Register Now"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
