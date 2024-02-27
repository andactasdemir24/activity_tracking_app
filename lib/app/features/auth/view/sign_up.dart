import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/app.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var authviewmodel = locator.get<AuthViewModel>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
        appBar: AppBar(),
        body: Observer(
          builder: (context) {
            return Form(
              key: signUpFormKey,
              child: Center(
                child: SizedBox(
                  width: DeviceConfig.screenWidth! * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.signUpTitle,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
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
                            controller: authviewmodel.regEmailController),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.status10;
                              }
                              return null;
                            },
                            controller: authviewmodel.regPasswordController,
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
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.status10;
                              }
                              return null;
                            },
                            controller: authviewmodel.regAgainPasswordController,
                            obscureText: authviewmodel.obsecureText,
                            hintText: AppLocalizations.of(context)!.againPassword,
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: IconButton(
                              icon: Icon(
                                authviewmodel.obsecureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                authviewmodel.toggleObsecureText();
                              },
                            )),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.05),
                        CustomButton(
                          text: Text(AppLocalizations.of(context)!.signUpTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: ColorConst.cwhite, fontWeight: FontWeight.bold)),
                          onPressed: () async {
                            if (signUpFormKey.currentState!.validate()) {
                              await authviewmodel.signUp(context);
                            }
                          },
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.1),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cblack),
                              children: <TextSpan>[
                                TextSpan(text: AppLocalizations.of(context)!.signUpHaveAccountText),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.customButtonSignInText,
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
