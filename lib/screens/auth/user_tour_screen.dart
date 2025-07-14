import 'dart:io';

import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/routes/app_pages.dart';
import '../../utils/constants/app_colors.dart';

class UserTourScreen extends StatelessWidget {
  const UserTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit?'),
            content: Text('Do you really want to exit?'),
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
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.goNamed(Routes.navigationPage);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
               AppAssets.userTourBackground,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
