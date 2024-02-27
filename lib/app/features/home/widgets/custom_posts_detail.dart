// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';


class CustomPostsDetail extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomPostsDetail({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                icon,
                color: ColorConst.cblack,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ColorConst.cblack, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
