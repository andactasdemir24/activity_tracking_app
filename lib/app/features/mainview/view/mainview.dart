import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:andac_case/app/app.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var mainviewmodel = locator.get<MainViewModel>();
    return Scaffold(
      body: Observer(
        builder: (context) {
          return mainviewmodel.buildBodyContent(mainviewmodel.selectedIndex, context);
        },
      ),
      drawer: const CustomDrawer(),
    );
  }
}
