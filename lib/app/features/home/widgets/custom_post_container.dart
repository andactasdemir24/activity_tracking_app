// import 'package:andac_case/app/core/constants/color_constants.dart';
// import 'package:andac_case/app/features/home/viewmodel/home_viewmodel.dart';
// import 'package:andac_case/app/features/posts/view/add_post_page.dart';
// import 'package:flutter/material.dart';

// import '../../../core/constants/device_config.dart';
// import '../../../core/getit/locator.dart';
// import '../../../core/models/post_model.dart';

// class CustomPostContainer extends StatelessWidget {
//   const CustomPostContainer({
//     super.key,
//     required this.posts,
//   });

//   final List<PostModel> posts;

//   @override
//   Widget build(BuildContext context) {
//     var homeviewmodel = locator.get<HomeViewModel>();
//     DeviceConfig().init(context);
//     return ListView.builder(
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         final post = posts[index];
//         return GestureDetector(
//           onLongPress: () {
//             Navigator.pushNamed(
//               context,
//               '/addPost',
//               arguments: ActionType.update,
//             );
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: DeviceConfig.screenHeight! * 0.01),
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                   height: DeviceConfig.screenHeight! * 0.2,
//                   width: DeviceConfig.screenWidth! * 0.9,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: NetworkImage(post.imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Stack(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   post.name,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge
//                                       ?.copyWith(color: ColorConst.cwhite, fontSize: 20),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                   decoration: BoxDecoration(
//                                     color: ColorConst.cgrey,
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   child: Text(
//                                     '${post.money.toString()} TL',
//                                     style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cwhite),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 5),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.location_on,
//                                   color: ColorConst.cwhite,
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   post.location,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge
//                                       ?.copyWith(color: ColorConst.cwhite, fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 5),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.event,
//                                   color: ColorConst.cwhite,
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   homeviewmodel.formatTimestamp(post.time),
//                                   style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cwhite),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   )),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
