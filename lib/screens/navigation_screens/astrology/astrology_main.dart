import 'package:astro_talk/network/api_constants.dart';
import 'package:astro_talk/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../bloc/home/home_state.dart';
import '../../../bloc/routes/app_pages.dart';
import '../../../utils/common_widgets/astrology_container_view.dart';
import '../../../utils/constants/app_gradient.dart';
import '../../../utils/constants/app_colors.dart';

class AstrologyMain extends StatelessWidget {
  const AstrologyMain({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetAstrology(context: context));
    });
    return Container(
      color: searchColor, // solid background color
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
            title:  Padding(
              padding: EdgeInsets.only(left: 20,top: 20),
              child: Text(
                 AppString.astrology,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return  SingleChildScrollView(
              child: ListView.builder(
                itemCount: state.astrologyServices.length,
                physics:  ClampingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = state.astrologyServices[index];
                  var colorOne = Color(int.parse('0xFF${(item.colorOne ?? "#000000").replaceFirst('#', '')}'),);
                  var colorTwo = Color(int.parse('0xFF${(item.colorTwo ?? "#000000").replaceFirst('#', '')}'),);
                  var colorThree = Color(int.parse('0xFF${(item.colorThree ?? "#000000").replaceFirst('#', '')}'),);
                  var imageUrl = item.image!.startsWith('http')
                      ? item.image
                      : '${ApiConstants.baseUrl}${item.image}';
                  return GestureDetector(
                    onTap:(){
                     if(index==0){
                       context.pushNamed(Routes.astrologyOne);
                     }else if(index==1){
                       context.pushNamed(Routes.astrologyTwo);
                     }else if(index==2){
                       context.pushNamed(Routes.astrologyThree);
                     }
                    },
                    child: AstrologyContainerView(
                      image: imageUrl!,
                      title: item.title!,
                      description: item.description!,
                      startColor:  colorOne,
                      middleColor: colorTwo,
                      endColor: colorThree,
                    ),
                  );
                },
              ),
            );
            }
          )
          ),
        ),
      ),
    );
  }
}
