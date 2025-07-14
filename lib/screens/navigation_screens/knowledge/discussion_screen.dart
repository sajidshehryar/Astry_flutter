import 'package:astro_talk/network/api_constants.dart';
import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../bloc/home/home_state.dart';
import '../../../utils/common_widgets/astrology_container_view.dart';
import '../../../utils/common_widgets/discussion_card_widget.dart';
import '../../../utils/common_widgets/knowledge_container_view.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_colors.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: searchColor,
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.backgroundGradient,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Image.asset(AppAssets.circularPurpleBack, width: 40, height: 40),
                      ),
                      const Text(
                        AppString.discussion,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      DiscussionCardWidget(
                        title: AppString.discussionOneText,
                        gradientColors: [
                        discussCardOne ,
                        discussCardTwo ,
                        discussCardThree
                        ],
                      ),
                      DiscussionCardWidget(
                        title: AppString.discussionTwoText,
                        gradientColors: [
                          cardTwoColorTwo ,
                          cardTwoColorOne,
                          cardTwoColorThree
                ],
                      ),
                      DiscussionCardWidget(
                        title: AppString.discussionThreeText,
                        gradientColors: [
                          cardOne,
                          cardTwo, cardFour
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
