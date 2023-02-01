import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      bottomColor: Coloring.bg_color,
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 10),
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
                        "프로필 관리",
                        style: Font.H1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                child: Text(
                  "프로필 아이콘",
                  style: Font.H2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: GridView(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    children: [
                      ProfileIcon(),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼1.png"),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼2.png"),
                      ProfileIcon(),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼7.png"),
                      ProfileIcon(),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼3.png"),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼4.png"),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼5.png"),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼8.png"),
                      ProfileIcon(),
                      ProfileIcon(),
                      ProfileIcon(),
                      ProfileIcon(),
                      ProfileIcon(),
                      ProfileIcon(
                          is_lock: false, image: "lib/assets/엠블럼/엠블럼9.png"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                child: Text(
                  "프로필 칭호",
                  style: Font.H2,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileName(
                      text: "도파민 폭발",
                      selected: true,
                    ),
                    Text(
                      "김말랑실",
                      style: Font.Button,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Wrap(
                  children: [
                    ProfileName(text: "파워 계획형"),
                    ProfileName(text: "쇼트 슬리퍼"),
                    ProfileName(text: "작심3일 탈출"),
                    ProfileName(text: "밥 잘 챙겨먹는"),
                    ProfileName(text: "유산소 매니아"),
                    ProfileName(text: "잠자는 숲속의"),
                    ProfileName(
                      text: "도파민 폭발!",
                      selected: true,
                    ),
                    ProfileName(text: "의지 가득한"),
                    ProfileName(text: "근손실이 무서운"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key, this.is_lock = true, this.image = ""})
      : super(key: key);

  final bool is_lock;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: is_lock ? Coloring.gray[10] : Coloring.blue[10],
          borderRadius: BorderRadius.circular(8)),
      child: Image.asset(
        is_lock ? "lib/assets/images/reward_lock.png" : image,
        width: 50,
        height: 50,
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({Key? key, required this.text, this.selected = false})
      : super(key: key);

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: selected ? Coloring.blue[30] : Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(text,
          style: TextStyle(
              color: selected ? Coloring.gray[10]! : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
    );
  }
}
