import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/app.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AuthService authService = AuthService();
  var mainviewmodel = locator.get<MainViewModel>();
  var authviewmodel = locator.get<AuthViewModel>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.6,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(color: Color(0xff764abc)),
                      accountName: Text(
                        authService.auth.currentUser?.uid == admin
                            ? AppLocalizations.of(context)!.mainMember
                            : AppLocalizations.of(context)!.mainAdmin,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        authService.auth.currentUser?.email.toString() ?? AppLocalizations.of(context)!.guest,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(AppLocalizations.of(context)!.homeText),
                      selected: mainviewmodel.selectedIndex == 0,
                      onTap: () {
                        mainviewmodel.onItemTapped(0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(AppLocalizations.of(context)!.settingsText),
                      selected: mainviewmodel.selectedIndex == 1,
                      onTap: () {
                        mainviewmodel.onItemTapped(1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: Text(AppLocalizations.of(context)!.mainFavoriteText),
                      selected: mainviewmodel.selectedIndex == 2,
                      onTap: () {
                        mainviewmodel.onItemTapped(2);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: Text(AppLocalizations.of(context)!.mainLogoutText),
                  onTap: () {
                    setState(() {
                      authService
                          .signOut()
                          .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false));
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(
                    Icons.delete_forever_rounded,
                    color: ColorConst.cred,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.mainDeleteUserText,
                    style: TextStyle(color: ColorConst.cred),
                  ),
                  onTap: () {
                    authviewmodel
                        .deleteUser(context)
                        .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
