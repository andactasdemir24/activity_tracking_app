import 'package:flutter/material.dart';
import 'package:andac_case/app/app.dart';

class CustomTimePicker extends StatelessWidget {
  final String text;
  const CustomTimePicker({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Container(
      height: DeviceConfig.screenHeight! * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConst.cwhite,
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: TextStyle(fontSize: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
