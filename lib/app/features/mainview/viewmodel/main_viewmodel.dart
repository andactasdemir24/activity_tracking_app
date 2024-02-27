// ignore_for_file: library_private_types_in_public_api

import 'package:andac_case/app/features/favorite/view/favorite_page.dart';
import 'package:andac_case/app/features/home/view/home_page.dart';
import 'package:andac_case/app/features/settings/view/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @action
  Widget buildBodyContent(int index, BuildContext context) {
    if (index == 0) {
      return const HomePage();
    } else if (index == 1) {
      return const SettingsPage();
    } else if (index == 2) {
      return const FavoritePage();
    } else {
      return Text(AppLocalizations.of(context)!.status15);
    }
  }
}
