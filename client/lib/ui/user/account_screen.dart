import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                      "계정",
                      style: Font.H1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "로그인 정보",
                    style: Font.H3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Coloring.bg_color,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        "specific0924@gmail.com",
                        style: Font.Body,
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
