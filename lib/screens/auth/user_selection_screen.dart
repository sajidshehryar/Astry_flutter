import 'dart:io';

import 'package:astro_talk/animations/staggered_list_animation.dart';
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/routes/app_pages.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_strings.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppString.exit),
            content: Text(AppString.doYouReallyWantExit),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('Cancel')),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: searchColor,
        appBar: AppBar(
          backgroundColor: searchColor,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                AppAssets.loginTwo,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              StaggeredListAnimation(
                initialDelay: 50,
                interval: 50,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(
                      0, 0, 0, Platform.isIOS ? 320 : 280,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.chooseUser,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.login, extra: 'guru');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(40, 16, 40, 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: fieldBorder, width: 1),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: Icon(Icons.hub, color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      AppString.guru,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.login, extra: 'user');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: fieldBorder, width: 1),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: Icon(
                                        Icons.person_add_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      AppString.user,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget wrapChildren({required List<Widget> children}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children,
  );
}

