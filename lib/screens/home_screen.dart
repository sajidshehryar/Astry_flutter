import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../utils/common_widgets/astrologer_card.dart';
import '../utils/common_widgets/build_goal_card.dart';
import '../utils/common_widgets/build_quick_service_card.dart';
import '../utils/common_widgets/gradient_card.dart';
import '../utils/constants/app_assets.dart';
import '../utils/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: searchColor,
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: searchColor,
            ),
            body:Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/appbar_user_image_icon.png', width: 25, height: 25, fit: BoxFit.fill,),
                                const SizedBox(width: 12),
                                Text(AppString.hiGuest, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/appbar_top_chat_icon.png', width: 25, height: 25, fit: BoxFit.fill,),
                                const SizedBox(width: 2),
                                Image.asset('assets/icons/appbar_bell_icon.png', width: 25, height: 25, fit: BoxFit.fill,),
                                const SizedBox(width: 2),
                                Image.asset('assets/icons/appbar_top_setting.png', width: 25, height: 25, fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0x9452169B),
                              Color(0xFF2E1859),],
                              stops: [0, 0.45,],
                              begin: Alignment.centerLeft, end: Alignment.centerRight,),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: shadowColor, width: 0.8)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style:TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: whiteColor),
                                cursorColor: whiteColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 5, bottom: 6),
                                  hintText: AppString.search,
                                  hintStyle:TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Image.asset('assets/icons/search_icons.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,),
                          ],
                        ),
                      ),
                      Divider(
                        color:Color(0x525A299F),
                        height: 10,
                        thickness: 8,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppString.aiAstro,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(AppString.viewAll,
                              style:  TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(15, 0, 15, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                                  margin: EdgeInsets.only(bottom: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF450D82),
                                        Color(0xFF7C18E8),

                                      ]),
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('assets/images/ai_astrologer_image1.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF34A4A),
                                          Color(0xFF8D2B2B)
                                        ],
                                            stops: [0, 1],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                                        )
                                    ),
                                    child: Image.asset("assets/icons/live_icon.png"), height: 11, width: 20,),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                                  margin: EdgeInsets.only(bottom: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF450D82),
                                        Color(0xFF7C18E8),

                                      ]),
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('assets/images/ai_astrologer_image2.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF34A4A),
                                          Color(0xFF8D2B2B)
                                        ],
                                            stops: [0, 1],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                                        )
                                    ),
                                    child: Image.asset("assets/icons/live_icon.png"), height: 11, width: 20,),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                                  margin: EdgeInsets.only(bottom: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF450D82),
                                        Color(0xFF7C18E8),

                                      ]),
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('assets/images/ai_astrologer_image3.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF34A4A),
                                          Color(0xFF8D2B2B)
                                        ],
                                            stops: [0, 1],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                                        )
                                    ),
                                    child: Image.asset("assets/icons/live_icon.png"), height: 11, width: 20,),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                                  margin: EdgeInsets.only(bottom: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF450D82),
                                        Color(0xFF7C18E8),

                                      ]),
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('assets/images/ai_astrologer_image4.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF34A4A),
                                          Color(0xFF8D2B2B)
                                        ],
                                            stops: [0, 1],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                                        )
                                    ),
                                    child: Image.asset("assets/icons/live_icon.png"), height: 11, width: 20,),
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60, width: 60,
                                  padding: EdgeInsets.only(top: 8, left: 3, right: 3),
                                  margin: EdgeInsets.only(bottom: 3),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF450D82),
                                        Color(0xFF7C18E8),

                                      ]),
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('assets/images/ai_astrologer_image5.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFF34A4A),
                                          Color(0xFF8D2B2B)
                                        ],
                                            stops: [0, 1],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter
                                        )
                                    ),
                                    child: Image.asset("assets/icons/live_icon.png"), height: 11, width: 20,),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color:Color(0x525A299F),
                        height: 10,
                        thickness: 8,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20, 12, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Quick Services',
                              style:  TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text('View All',
                              style:  TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: GridView.builder(
                          itemCount: items.length,
                          shrinkWrap: true, // Important
                          physics: NeverScrollableScrollPhysics(), // Disable inner scroll
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                            childAspectRatio: 2.3,
                          ),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  tileMode: TileMode.mirror,
                                  colors: item['gradient'],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item['icon'],
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      item['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  index==0?
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Image.asset(AppAssets.circularExclamatory, width: 13, height: 13,)):SizedBox(height: 0,)

                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        color:Color(0x525A299F),
                        height: 10,
                        thickness: 8,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Live Astrologers',
                              style:  TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text('View All',
                              style:TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),)
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(20, 5, 0, 10),
                          child: Text('Quick access to frequently contacted astrologers',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: greyColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 30),
                        child: Row(
                          children: const [
                            Expanded(
                              child: AstrologerCard(
                                image: 'assets/images/image_arun.png',
                                name: 'Pt. Arun',
                                rating: 4.9,
                                title: 'Vedic Astrology',
                                languages: 'Hindi, English & French',
                                price: '\$25',
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: AstrologerCard(
                                image: 'assets/images/image_redhima.png',
                                name: 'Pt. Riddhi',
                                rating: 4.9,
                                title: 'Vedic Astrology',
                                languages: 'Hindi, English & French',
                                price: '\$18',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color:Color(0x525A299F),
                        height: 10,
                        thickness: 8,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Online Services',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text('View All',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child:GridView.builder(
                          itemCount: services.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal:10),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.73,
                          ),
                          itemBuilder: (context, index) {
                            final service = services[index];
                            return buildQuickServiceCard(
                              backgroundImage: service['background']!,
                              iconImage: service['icon']!,
                              title: service['title']!,
                            );
                          },
                        ),
                      ),
                      Divider(
                        color:Color(0x525A299F),
                        height: 10,
                        thickness: 8,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: GridView.builder(
                          itemCount: cards.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            final card = cards[index];
                            return GradientCard(
                              title: card['title'],
                              iconPath: card['icon'],
                              gradientColors: card['gradient'],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 140,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                left: 0,
                                right: 0,
                                child: buildGoalCard(
                                  gradientColors: [Color(0xFF654FB1), Color(0xFF8F5682)], // darkest
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 0,
                                right: 0,
                                child: buildGoalCard(
                                  gradientColors: [Color(0xFF8D83F3), Color(0xFFD087A4)], // medium
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: buildGoalCard(
                                  gradientColors: [Color(0xFF9B97EE), Color(0xFFF5C5D5)], // lightest
                                ),
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:  Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: whiteColor13,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Productivity",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "See more",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 4,
                                    percent: 90 / 100,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    backgroundColor: Colors.transparent,
                                    linearGradient: const LinearGradient(
                                      colors: [Color(0xFF6621A6), Color(0xFF8B237F)],
                                    ),
                                    center: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF2E1154),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "90%",
                                            style:TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Current Goal",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white70,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 12),
                                          child: Row(
                                            children: [
                                              CircularPercentIndicator(
                                                radius: 25.0,
                                                lineWidth: 2.0,
                                                percent: 100 / 100,
                                                circularStrokeCap: CircularStrokeCap.round,
                                                backgroundColor: Colors.white24,
                                                linearGradient: const LinearGradient(
                                                  colors: [Color(0xFF6990F5), Color(0xFF503090)],
                                                ),
                                                center: Container(
                                                  height: 45, width: 45,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF2E1154),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Text(
                                                    "100%",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Text(
                                                "Daily\nGoal",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            CircularPercentIndicator(
                                              radius: 25.0,
                                              lineWidth: 2.0,
                                              percent: 82 / 100,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              backgroundColor: Colors.transparent,
                                              linearGradient: const LinearGradient(
                                                colors: [Color(0xFF756DBB), Color(0xFFB0AE80), Color(0xFFDDDF55)],
                                              ),
                                              center: Container(
                                                height: 45, width: 45,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2E1154),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  "82%",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              "Weekly\nGoal",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.only(left: 25, right:25 ,top: 25, bottom: 10),
                        padding: const EdgeInsets.only(left: 25, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF3F5EE7),
                              Color(0xFF7160DD),
                              Color(0xFFA463D3),
                              Color(0xFFB163D1),
                              Color(0xFFCE65CB),
                              Color(0xFFE866C6),
                            ],
                            stops: [0.07, 0.36, 0.54, 0.63, 0.86, 1.0],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    "Invite Your\nFriends",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin:EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black26,
                                  ),
                                  child: Image.asset('assets/icons/circular_purple_next_btn.png',
                                    width: 45,
                                    height: 45,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/icons/handshake.png",
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xCC3D95D7),
                            Color(0xCC2CD6C8)
                          ], stops: [0, 1], begin: Alignment.centerLeft, end: Alignment.centerRight
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white.withOpacity(0.38), width: 3),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Image.asset("assets/icons/ic_box.png")
                            ),
                            SizedBox(width: 6,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Collection of tests",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "The Best selection for you.",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 6,),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5E4DBD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                              ),
                              child: Text(
                                "Buy Now",
                                style:TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xCC3D95D7),
                            Color(0xCC2CD6C8)
                          ], stops: [0, 1], begin: Alignment.centerLeft, end: Alignment.centerRight
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white.withOpacity(0.38), width: 3),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Image.asset("assets/icons/ic_books.png")
                            ),
                            SizedBox(width: 6,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Collection of Courses",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "The Best selection for you.",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 6,),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5E4DBD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                              ),
                              child: Text(
                                "Buy Now",
                                style:TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 60,)
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:chatBoxColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/chat_icon.png',
                                      width: 20.11,
                                      height: 20,),
                                    SizedBox(width:7),
                                    Text('Video Chat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),)
                                  ],
                                ),

                              ),
                            ),
                            SizedBox(width: 12,),
                            Flexible(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:chatBoxColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/call_icon.png',
                                      width: 20.89,
                                      height: 22,),
                                    SizedBox(width:7),
                                    Text('Voice Call',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:lunaBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 8, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAssets.lunaLogo,
                                      width: 37,
                                      height: 37,),
                                    SizedBox(width:6),
                                    Text(AppString.lunaString,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),

          );

  }




final  List<Map<String, dynamic>> items = [
    {
      'title': 'Free\nKundali',
      'icon': 'assets/icons/quickservice_heart.png',
      'gradient': [Color(0xFF9796F0), Color(0xFFFBC7D4)],
    },
    {
      'title': 'Daily\nHoroscope',
      'icon': 'assets/icons/quickservice_moon.png',
      'gradient': [Color(0xFF36D1DC), Color(0xFF5B86E5)],
    },
    {
      'title': 'AI Dream\nAnalysis',
      'icon': 'assets/icons/quickservice_eye.png',
      'gradient': [Color(0xFFFEAC5E), Color(0xFFC779D0) ,Color(0xFF4BC0C8)],
    },
    {
      'title': 'Compatibility',
      'icon': 'assets/icons/quickservice_heart_hand.png',
      'gradient': [Color(0xFFD3959B), Color(0xFFBFE6BA)],
    },
  ];
  final List<Map<String, String>> services = const [
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_1.png',
      'title': 'E- Pooja\nServices',
    },
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_2.png',
      'title': 'Reiki\nHealing',

    },
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_3.png',
      'title': 'Evil Eye\nRemoval',
    },
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_4.png',
      'title': 'Vastu\nShastra',
    },
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_5.png',
      'title': 'Gemstone\nConsultation',
    },
    {
      'background': 'assets/icons/services_bg.png',
      'icon': 'assets/icons/online_service_6.png',
      'title': 'Yantra',
    },
  ];
  final List<Map<String, dynamic>> cards = [
    {
      'title': 'Courses &\nArticles',
      'icon': 'assets/icons/courses.png',
      'gradient': [Color(0xFFB178E9),Color(0xFF7FC7C8), Color(0xFFF1AEAC)],
    },
    {
      'title': 'Dream\nDictionary',
      'icon': 'assets/icons/dream_icons.png',
      'gradient': [Color(0xFF68A6DA),Color(0xFF7EC6C7), Color(0xFFCF93B4)],
    },
    {
      'title': 'Music\nRoom',
      'icon': 'assets/icons/music_icon.png',
      'gradient': [Color(0xFF68A6DA), Color(0xFF77C7CA), Color(0xFFD190B3)],
    },
    {
      'title': 'Test\nPredictions',
      'icon': 'assets/icons/test_icon.png',
      'gradient': [Color(0xFFB279E8), Color(0xFFCF91CC), Color(0xFFEEABAE)],
    },
  ];
  final List<Map<String, dynamic>> goals = [{
    'title': 'Goal 1',
    'description': 'Take a compatibility test with 5 people',
    'completed': 3,
    'total': 5,
    'gradient': [Color(0xFF9B97EE), Color(0xFFF5C5D5)],
  },];
  final List<Map<String, dynamic>> inviteCards = [{
      'title': 'Invite Your Friends',
      'gradient': [Color(0xFF5C00DD), Color(0xFFF74DAF)], // Blue to pink
      'buttonColor': Colors.deepPurple,
      'image': 'assets/icons/handshake.png',
    },
    // Add more cards if needed
  ];









}
