// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/main.dart';
import 'package:andac_case/app/app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.settingAppbarTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.selectLanguage),
            DropdownButton<Language>(
              hint: Text(AppLocalizations.of(context)!.settingLanguage),
              icon: const Icon(Icons.language),
              items: Language.languageList().map<DropdownMenuItem<Language>>((Language language) {
                return DropdownMenuItem<Language>(
                  value: language,
                  child: Row(
                    children: <Widget>[
                      Text(language.flag, style: const TextStyle(fontSize: 30)),
                      const SizedBox(width: 10),
                      Text(language.name),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, locale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
