import 'package:andac_case/app/core/constants/color_constants.dart';
import 'package:andac_case/app/core/constants/device_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorConst.custonButtonColor,
            fixedSize: Size(DeviceConfig.screenWidth! * 0.9, DeviceConfig.screenHeight! * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: onPressed,
        child: text);
  }
}
