import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/ui/login/login_screen.dart';
import 'package:mybiseo_app/ui/user/account_screen.dart';
import 'package:mybiseo_app/ui/user/profile_screen.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      bottomColor: Coloring.bg_color,
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 30),
              color: Coloring.bg_color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 50,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 30),
                    child: Text(
                      "마이페이지",
                      style: Font.H1,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(AccountScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  "계정",
                  style: Font.Headline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ProfileScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  "프로필 관리",
                  style: Font.Headline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Get.offAll(LoginScreen());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                      color: Coloring.gray[30],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
