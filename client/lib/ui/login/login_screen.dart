import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/provider/AllProvider.dart';
import 'package:mybiseo_app/ui/bottom_tab_navigator.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Consumer<AllProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: GeneralSafeArea(
            topColor: Colors.white,
            bgColor: Colors.white,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("반가워요!\n저는 AI비서\n알파예요.", style: Font.H1),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "저는 힘들이지 않고\n누구나 일정을 쉽게 짤 수 있도록\n도와주는 일을 하고 있어요.",
                                style: Font.Body,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox.shrink()),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Image.asset(
                                    "lib/assets/images/alpha_green.png",
                                    width: 250,
                                    height: 250,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("내 생활에\n맞추어 짜주는\n맞춤 계획들", style: Font.H1),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "내 생활 패턴 넣으면,\n제가 하루 일정을\n대략적으로 만들어줘요.",
                                style: Font.Body,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Image.asset(
                                    "lib/assets/images/login_cal.png",
                                    width: 350,
                                    height: 350,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("내 생활에\n맞추어 짜주는\n맞춤 계획들", style: Font.H1),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "내 생활 패턴 넣으면,\n제가 하루 일정을\n대략적으로 만들어줘요.",
                                style: Font.Body,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Image.asset(
                                    "lib/assets/images/login_badge.png",
                                    width: 350,
                                    height: 350,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  bottom: 20,
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: WormEffect(
                            activeDotColor: Coloring.green[20]!,
                            dotColor: Coloring.gray[10]!),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: GestureDetector(
                            onTap: () async {
                              bool isInstalled = await isKakaoTalkInstalled();
                              OAuthToken authToken = isInstalled
                                  ? await UserApi.instance.loginWithKakaoTalk()
                                  : await UserApi.instance
                                      .loginWithKakaoAccount();

                              final response = await Dio(BaseOptions())
                                  .get("https://kapi.kakao.com/v2/user/me",
                                      options: Options(
                                        headers: {
                                          'Authorization':
                                              'Bearer ' + authToken.accessToken
                                        },
                                      ));

                              print(response);
                              await provider.makeCalendar(
                                  DateTime.now().subtract(Duration(days: 1)));
                              Get.offAll(BottomTab());
                            },
                            child: Image.asset(
                                "lib/assets/images/kakao_login.png")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
