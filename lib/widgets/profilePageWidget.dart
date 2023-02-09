import 'package:flutter/material.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
              onTap: (() async {}),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColor.blackColor, width: 1.2)),
                  child: const CircleAvatar(
                      backgroundColor: AppColor.whiteColor,
                      radius: 45,
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: AppColor.orangeColor,
                      )))),
        ),
        getheight(context, 0.010),
        const AppText(
          text: "Amitabh Bacchan",
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        getheight(context, 0.010),
        const AppText(
          text: "amitabh bacchan@gmail.com",
          fontSize: 17,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
