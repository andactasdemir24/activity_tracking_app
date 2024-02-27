// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModelBase, Store {
  late final _$obsecureTextAtom =
      Atom(name: '_AuthViewModelBase.obsecureText', context: context);

  @override
  bool get obsecureText {
    _$obsecureTextAtom.reportRead();
    return super.obsecureText;
  }

  @override
  set obsecureText(bool value) {
    _$obsecureTextAtom.reportWrite(value, super.obsecureText, () {
      super.obsecureText = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_AuthViewModelBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$resetmailControllerAtom =
      Atom(name: '_AuthViewModelBase.resetmailController', context: context);

  @override
  TextEditingController get resetmailController {
    _$resetmailControllerAtom.reportRead();
    return super.resetmailController;
  }

  @override
  set resetmailController(TextEditingController value) {
    _$resetmailControllerAtom.reportWrite(value, super.resetmailController, () {
      super.resetmailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_AuthViewModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$regEmailControllerAtom =
      Atom(name: '_AuthViewModelBase.regEmailController', context: context);

  @override
  TextEditingController get regEmailController {
    _$regEmailControllerAtom.reportRead();
    return super.regEmailController;
  }

  @override
  set regEmailController(TextEditingController value) {
    _$regEmailControllerAtom.reportWrite(value, super.regEmailController, () {
      super.regEmailController = value;
    });
  }

  late final _$regPasswordControllerAtom =
      Atom(name: '_AuthViewModelBase.regPasswordController', context: context);

  @override
  TextEditingController get regPasswordController {
    _$regPasswordControllerAtom.reportRead();
    return super.regPasswordController;
  }

  @override
  set regPasswordController(TextEditingController value) {
    _$regPasswordControllerAtom.reportWrite(value, super.regPasswordController,
        () {
      super.regPasswordController = value;
    });
  }

  late final _$regAgainPasswordControllerAtom = Atom(
      name: '_AuthViewModelBase.regAgainPasswordController', context: context);

  @override
  TextEditingController get regAgainPasswordController {
    _$regAgainPasswordControllerAtom.reportRead();
    return super.regAgainPasswordController;
  }

  @override
  set regAgainPasswordController(TextEditingController value) {
    _$regAgainPasswordControllerAtom
        .reportWrite(value, super.regAgainPasswordController, () {
      super.regAgainPasswordController = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_AuthViewModelBase.signIn', context: context);

  @override
  Future<void> signIn(BuildContext context) {
    return _$signInAsyncAction.run(() => super.signIn(context));
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_AuthViewModelBase.resetPassword', context: context);

  @override
  Future<void> resetPassword(BuildContext context) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(context));
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_AuthViewModelBase.deleteUser', context: context);

  @override
  Future<void> deleteUser(BuildContext context) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(context));
  }

  late final _$_AuthViewModelBaseActionController =
      ActionController(name: '_AuthViewModelBase', context: context);

  @override
  void toggleObsecureText() {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
        name: '_AuthViewModelBase.toggleObsecureText');
    try {
      return super.toggleObsecureText();
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool _validateEmail(String email) {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
        name: '_AuthViewModelBase._validateEmail');
    try {
      return super._validateEmail(email);
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obsecureText: ${obsecureText},
emailController: ${emailController},
resetmailController: ${resetmailController},
passwordController: ${passwordController},
regEmailController: ${regEmailController},
regPasswordController: ${regPasswordController},
regAgainPasswordController: ${regAgainPasswordController}
    ''';
  }
}
