
import 'package:astro_talk/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
class KnowledgeContainerView extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color startColor;
  final Color middleColor;
  final Color endColor;

  const KnowledgeContainerView({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.startColor,
    required this.middleColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [startColor, middleColor, endColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:4),
                        child: Text(
                          description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],),

                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(bottom:5),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black26,
                      ),
                      child: Image.asset(
                        AppAssets.circularPurpleButton,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Image on Right
          Image.network(
            image,
            width: 140,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),

    );
  }
}
