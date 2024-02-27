// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:andac_case/app/app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeviewmodel = locator.get<HomeViewModel>();
  var addpostviewmodel = locator.get<AddPostsViewModel>();

  PostService postService = PostService();
  StorageService storageService = StorageService();
  AuthService authService = AuthService();

  final CollectionReference _post = FirebaseFirestore.instance.collection('posts');

  String? imageUrl;
  Timestamp? time;
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  String? currentImageUrl;
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      nameController.text = documentSnapshot['name'] ?? '';
      locationController.text = documentSnapshot['location'] ?? '';
      moneyController.text = documentSnapshot['money'].toString();
      currentImageUrl = documentSnapshot['imageUrl'] as String?;
      time = documentSnapshot['time'] as Timestamp?;
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () async {
                      await addpostviewmodel.pickImage();
                      if (addpostviewmodel.imageFile != null) {
                        String newImageUrl =
                            await storageService.uploadPostsImage(File(addpostviewmodel.imageFile!.path));
                        setState(() {
                          currentImageUrl = newImageUrl;
                        });
                      }
                    },
                    child: SizedBox(
                      height: DeviceConfig.screenHeight! * 0.2,
                      width: DeviceConfig.screenWidth! * 0.9,
                      child: addpostviewmodel.imageFile != null
                          ? Image.file(
                              File(addpostviewmodel.imageFile!.path),
                              fit: BoxFit.fill,
                            )
                          : currentImageUrl != null
                              ? Image.network(
                                  currentImageUrl!,
                                  fit: BoxFit.fill,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                  child: Center(child: Text(AppLocalizations.of(context)!.status11)),
                                ),
                    )),
                SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.addpostName,
                  controller: nameController,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.addpostLocation,
                  controller: locationController,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                GestureDetector(
                  onTap: () {
                    addpostviewmodel.selectTime(context);
                  },
                  child: CustomTimePicker(
                      text: time != null
                          ? homeviewmodel.formatTimestamp(time!)
                          : AppLocalizations.of(context)!.selectTime),
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.addpostMoney,
                  controller: moneyController,
                ),
                SizedBox(height: DeviceConfig.screenHeight! * 0.1),
                CustomButton(
                  text: Text(AppLocalizations.of(context)!.addpostUpdate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    final String name = nameController.text;
                    final String location = locationController.text;
                    final int money = int.parse(moneyController.text);

                    Map<String, dynamic> updateData = {
                      "name": name,
                      "location": location,
                      "imageUrl": currentImageUrl,
                      "money": money,
                    };

                    if (imageUrl != null) {
                      updateData["imageUrl"] = imageUrl;
                    }

                    if (time != null) {
                      updateData["time"] = time;
                    }
                    await _post.doc(documentSnapshot!.id).update(updateData);
                    nameController.clear();
                    locationController.clear();
                    moneyController.clear();
                    imageUrl = null;
                    time = null;
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TextConst.homeAppbarTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: FutureBuilder<List<String>>(
                future: homeviewmodel.sliderList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                      ),
                      items: snapshot.data!.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(imageUrl, fit: BoxFit.cover),
                            );
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: StreamBuilder(
                stream: _post.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
                  if (streamsnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (streamsnapshot.connectionState == ConnectionState.active) {
                    if (streamsnapshot.hasData) {
                      return ListView.builder(
                        itemCount: streamsnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot = streamsnapshot.data!.docs[index];
                          return Column(
                            children: [
                              authService.auth.currentUser!.uid == admin
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PostsDetailPage(
                                                      id: documentSnapshot.id,
                                                      name: documentSnapshot['name'],
                                                      location: documentSnapshot['location'],
                                                      money: documentSnapshot['money'],
                                                      time: documentSnapshot['time'],
                                                      image: documentSnapshot['imageUrl'],
                                                    )));
                                      },
                                      child: adminDismissible(documentSnapshot, context))
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PostsDetailPage(
                                                      id: documentSnapshot.id,
                                                      name: documentSnapshot['name'],
                                                      location: documentSnapshot['location'],
                                                      money: documentSnapshot['money'],
                                                      time: documentSnapshot['time'],
                                                      image: documentSnapshot['imageUrl'],
                                                    )));
                                      },
                                      child: customContainer(documentSnapshot, context))
                            ],
                          );
                        },
                      );
                    } else if (streamsnapshot.hasError) {
                      return Center(child: Text('${AppLocalizations.of(context)!.status12} ${streamsnapshot.error}'));
                    } else {
                      return Center(child: Text(AppLocalizations.of(context)!.status13));
                    }
                  }
                  return Center(child: Text(AppLocalizations.of(context)!.status14));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: authService.auth.currentUser!.uid == admin
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  addpostviewmodel.reset();
                  Navigator.pushNamed(
                    context,
                    '/addPost',
                  );
                },
              )
            : null);
  }

  Dismissible adminDismissible(DocumentSnapshot<Object?> documentSnapshot, BuildContext context) {
    return Dismissible(
      key: Key(documentSnapshot.id),
      background: Container(
        color: ColorConst.cred,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(Icons.delete, color: ColorConst.cwhite),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        postService.deletePosts(documentSnapshot.id);
      },
      child: GestureDetector(
        onLongPress: () {
          _update(documentSnapshot);
        },
        child: customContainer(documentSnapshot, context),
      ),
    );
  }

  Padding customContainer(DocumentSnapshot<Object?> documentSnapshot, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DeviceConfig.screenHeight! * 0.01),
      child: Align(
        alignment: Alignment.center,
        child: Container(
            height: DeviceConfig.screenHeight! * 0.2,
            width: DeviceConfig.screenWidth! * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(documentSnapshot['imageUrl'] ?? ''),
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
                            documentSnapshot['name'],
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
                              '${documentSnapshot['money'].toString()} TL',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cwhite),
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
                            documentSnapshot['location'],
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
                            homeviewmodel.formatTimestamp(documentSnapshot['time'] ?? Timestamp.now()),
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorConst.cwhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
