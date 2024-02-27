import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:andac_case/app/app.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  var addpostviewmodel = locator.get<AddPostsViewModel>();
  var homeviewmodel = locator.get<HomeViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(AppLocalizations.of(context)!.appbarTitle)),
        body: Observer(
          builder: (context) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: DeviceConfig.screenWidth! * 0.9,
                    child: Column(
                      children: [
                        addpostviewmodel.imageFile == null && addpostviewmodel.imageUrl == null
                            ? GestureDetector(
                                onTap: () async {
                                  await addpostviewmodel.pickImage();
                                  addpostviewmodel.isImageSelected =
                                      addpostviewmodel.imageFile != null || addpostviewmodel.imageUrl != null;
                                },
                                child: Container(
                                  width: DeviceConfig.screenWidth! * 0.9,
                                  height: DeviceConfig.screenHeight! * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                  child: Center(child: Text(AppLocalizations.of(context)!.selectBanner)),
                                ),
                              )
                            : addpostviewmodel.imageFile != null
                                ? GestureDetector(
                                    onTap: () async {
                                      await addpostviewmodel.pickImage();
                                      addpostviewmodel.isImageSelected =
                                          addpostviewmodel.imageFile != null || addpostviewmodel.imageUrl != null;
                                    },
                                    child: SizedBox(
                                      height: DeviceConfig.screenHeight! * 0.2,
                                      width: DeviceConfig.screenWidth! * 0.9,
                                      child: Image.file(
                                        File(addpostviewmodel.imageFile!.path),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      await addpostviewmodel.pickImage();
                                      addpostviewmodel.isImageSelected =
                                          addpostviewmodel.imageFile != null || addpostviewmodel.imageUrl != null;
                                    },
                                    child: SizedBox(
                                      height: DeviceConfig.screenHeight! * 0.2,
                                      width: DeviceConfig.screenWidth! * 0.9,
                                      child: Image.network(
                                        addpostviewmodel.imageUrl!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.status16;
                            }
                            return null; // Geçerli değer
                          },
                          hintText: AppLocalizations.of(context)!.addpostName,
                          controller: addpostviewmodel.nameController,
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.status16;
                            }
                            return null; // Geçerli değer
                          },
                          hintText: AppLocalizations.of(context)!.addpostLocation,
                          controller: addpostviewmodel.locationController,
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        GestureDetector(
                          onTap: () {
                            addpostviewmodel.selectTime(context);
                          },
                          child: CustomTimePicker(
                              text: addpostviewmodel.time != null
                                  ? homeviewmodel.formatTimestamp(addpostviewmodel.time!)
                                  : AppLocalizations.of(context)!.selectTime),
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.02),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.status16;
                            }
                            return null; // Geçerli değer
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,10}$'))],
                          hintText: AppLocalizations.of(context)!.addpostMoney,
                          controller: addpostviewmodel.moneyController,
                        ),
                        SizedBox(height: DeviceConfig.screenHeight! * 0.08),
                        CustomButton(
                          text: Text(AppLocalizations.of(context)!.addpostSave,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: ColorConst.cwhite, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                addpostviewmodel.isImageSelected &&
                                addpostviewmodel.time != null) {
                              addpostviewmodel.addPost(context).then(
                                  (value) => Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false));
                            } else {
                              if (!addpostviewmodel.isImageSelected || addpostviewmodel.time == null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(AppLocalizations.of(context)!.status17),
                                ));
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
