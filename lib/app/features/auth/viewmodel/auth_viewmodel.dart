// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/core/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/getit/locator.dart';
import '../../mainview/viewmodel/main_viewmodel.dart';
part 'auth_viewmodel.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  final AuthService _authService = AuthService();

  @observable
  bool obsecureText = true;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController resetmailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController regEmailController = TextEditingController();

  @observable
  TextEditingController regPasswordController = TextEditingController();

  @observable
  TextEditingController regAgainPasswordController = TextEditingController();

  @action
  void toggleObsecureText() {
    obsecureText = !obsecureText;
  }

  @action
  Future<void> signIn(BuildContext context) async {
    if (!_validateEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status1)));
      return;
    }

    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status2)));
      return;
    }

    try {
      User? user = await _authService.signIn(emailController.text, passwordController.text);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status3)));
        locator.get<MainViewModel>().onItemTapped(0);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status4)));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
    }
  }

  @action
  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  @action
  Future<void> resetPassword(BuildContext context) async {
    try {
      _authService.resetPassword(resetmailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status5)));
      Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (!_validateEmail(regEmailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status1)));
      return;
    }

    if (regPasswordController.text.length < 6 || regAgainPasswordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status2)));
      return;
    }
    if (regPasswordController.text != regAgainPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status6)));
      return;
    }

    User? user = await _authService.signUp(regEmailController.text, regPasswordController.text);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status3)));
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      locator.get<MainViewModel>().onItemTapped(0);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status7)));
    }
  }

  @action
  Future<void> deleteUser(BuildContext context) async {
    try {
      _authService.deleteUser();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.status18)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${AppLocalizations.of(context)!.status19} $e")));
    }
  }
}
