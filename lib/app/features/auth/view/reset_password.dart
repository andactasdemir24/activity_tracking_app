import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/app.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var authViewModel = locator.get<AuthViewModel>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    authViewModel.resetmailController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.resetPasswordAppbarTitle),
      ),
      body: Center(
        child: SizedBox(
          width: DeviceConfig.screenWidth! * 0.9,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.resetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.05),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.status9;
                    } else if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value)) {
                      return AppLocalizations.of(context)!.status8;
                    }
                    return null;
                  },
                  controller: authViewModel.resetmailController,
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: const Icon(Icons.email),
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                CustomButton(
                  text: Text(
                    AppLocalizations.of(context)!.resetPasswordButtonText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: ColorConst.cwhite, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      authViewModel.resetPassword(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
