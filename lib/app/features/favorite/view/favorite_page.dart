import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/app.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteService favoriteService = FavoriteService();
    var homeviewmodel = locator.get<HomeViewModel>();
    DeviceConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.favoriteAppbarText),
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: favoriteService.getLikedPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(AppLocalizations.of(context)!.status12));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text(AppLocalizations.of(context)!.status20));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var post = snapshot.data![index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: DeviceConfig.screenHeight! * 0.01),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: DeviceConfig.screenHeight! * 0.2,
                            width: DeviceConfig.screenWidth! * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(post['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            post['name'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(color: ColorConst.cwhite, fontSize: 20),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: ColorConst.cgrey,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              '${post['money'].toString()} TL',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(color: ColorConst.cwhite),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: ColorConst.cwhite,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            post['location'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(color: ColorConst.cwhite, fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.event,
                                            color: ColorConst.cwhite,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            homeviewmodel.formatTimestamp(post['time'] ?? Timestamp.now()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(color: ColorConst.cwhite),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
