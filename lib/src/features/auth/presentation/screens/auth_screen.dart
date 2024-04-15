
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../comman/buttons/app_buttons.dart';
import '../../../../comman/validators/text_validation.dart';
import '../../../../comman/widgets/app_text_field.dart';
import '../../../../core/app/theme/colors.dart';
import '../providers/auth_provider.dart';

@RoutePage()
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isSignIn = true;
  bool showPass = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const Gap(80),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                          const Gap(10),
                          Text(
                            'Monify',
                            style:
                                textTheme.displayLarge!.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      const Gap(30),
                      Text(
                        isSignIn ? 'SIGN IN' : "SIGN UP",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        isSignIn
                            ? "Great to see you again! Your journey awaits. Sign in to pick up right where you left off."
                            : "Welcome aboard! Let's get started by creating your account. Just a few quick steps and you'll be all set!",
                        style: textTheme.bodySmall,
                      ),
                      const Gap(10),
                      AppTextField(
                        hintText: "Email",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validate.email(value!),
                      ),
                      const Gap(10),
                      AppTextField(
                        hintText: "Password",
                        controller: _passController,
                        obsecure: showPass,
                        maxlines: 1,
                        keyboardType: TextInputType.streetAddress,
                        suffixIcon: IconButton(
                          icon: showPass
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: mediumBlue,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: mediumBlue,
                                ),
                          onPressed: () => setState(() => showPass = !showPass),
                        ),
                      ),
                      const Gap(20),
                      AppButton(
                        text: isSignIn ? 'Sign In' : "Sign Up",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            if (isSignIn) {
                              await ref.read(authProvider.notifier).login(
                                  _emailController.text.trim(),
                                  _passController.text.trim(),
                              context);
                            } else {
                              await ref.read(authProvider.notifier).signUp(
                                  _emailController.text.trim(),
                                  _passController.text.trim(),
                              context);
                            }
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isSignIn
                                ? 'Don\'t have an account ?'
                                : "Already have an account ?",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() => isSignIn = !isSignIn);
                            },
                            child: Text(
                              isSignIn ? 'Create Account' : "Sign In",
                              // style: TextStyle(
                              //     fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "By continuing, you agree to our",
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall!.copyWith(fontSize: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async => await launchUrl(Uri.parse(
                              'https://jafarjalali128.wixsite.com/jrd-developers')),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Terms of service",
                              style:
                                  textTheme.labelSmall!.copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                        Text(
                          " | ",
                          style: textTheme.labelSmall!.copyWith(fontSize: 10),
                        ),
                        InkWell(
                          onTap: () async => await launchUrl(Uri.parse(
                              'https://jafarjalali128.wixsite.com/jrd-developers')),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Privacy Policy",
                              style:
                                  textTheme.labelSmall!.copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
