import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:andac_case/app/app.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var authviewmodel = locator.get<AuthViewModel>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
        appBar: AppBar(),
        body: Observer(
          builder: (context) {
            return Form(
              key: signInFormKey,
              child: Center(
                child: SizedBox(
                  width: DeviceConfig.screenWidth! * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.singInTitle,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.01),
                        Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!.singInDesc,
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.1),
                        CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.status9;
                              }
                              return null;
                            },
                            hintText: AppLocalizations.of(context)!.email,
                            prefixIcon: const Icon(Icons.email),
                            controller: authviewmodel.emailController),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.status10;
                              }
                              return null;
                            },
                            controller: authviewmodel.passwordController,
                            obscureText: authviewmodel.obsecureText,
                            hintText: AppLocalizations.of(context)!.password,
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: IconButton(
                              icon: Icon(
                                authviewmodel.obsecureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                authviewmodel.toggleObsecureText();
                              },
                            )),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.03),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/resetPassword', (route) => true);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(AppLocalizations.of(context)!.forgetPasswordText,
                                style: Theme.of(context).textTheme.labelLarge),
                          ),
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.03),
                        CustomButton(
                          text: Text(AppLocalizations.of(context)!.customButtonSignInText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: ColorConst.cwhite, fontWeight: FontWeight.bold)),
                          onPressed: () async {
                            if (signInFormKey.currentState!.validate()) {
                              await authviewmodel.signIn(context);
                            }
                          },
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.1),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/signUp', (route) => false);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cblack),
                              children: <TextSpan>[
                                TextSpan(text: AppLocalizations.of(context)!.signInHaveNotAccountText),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.signUpText,
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cred),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
