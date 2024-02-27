// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:andac_case/app/app.dart';

class PostsDetailPage extends StatelessWidget {
  final String id;
  final String name;
  final String location;
  final int money;
  final Timestamp time;
  final String image;

  const PostsDetailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.location,
    required this.money,
    required this.time,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeviewmodel = locator.get<HomeViewModel>();
    FavoriteService favoriteService = FavoriteService();
    DeviceConfig().init(context);
    return Scaffold(body: Observer(
      builder: (context) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  height: DeviceConfig.screenHeight! * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 55),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        homeviewmodel.toggleLikeStatus(id);
                        favoriteService.addFavorite(id);
                      },
                      child: Icon(
                        homeviewmodel.isLiked(id) ? Icons.favorite : Icons.favorite_border_outlined,
                        color: homeviewmodel.isLiked(id) ? ColorConst.cred : ColorConst.cwhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            CustomPostsDetail(text: '$money TL', icon: Icons.attach_money),
            CustomPostsDetail(text: name, icon: Icons.event_seat_rounded),
            CustomPostsDetail(text: location, icon: Icons.location_on),
            CustomPostsDetail(text: homeviewmodel.formatTimestamp(time), icon: Icons.event),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppLocalizations.of(context)!.detailDesc,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: ColorConst.cblack, decoration: TextDecoration.underline, decorationThickness: 2))),
                  const SizedBox(height: 10),
                  Text(AppLocalizations.of(context)!.lorem,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorConst.cblack))
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
