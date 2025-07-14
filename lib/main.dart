import 'package:astro_talk/bloc/astrology_bloc/astrology_bloc.dart';
import 'package:astro_talk/bloc/home/home_bloc.dart';
import 'package:astro_talk/bloc/profile/profile_bloc.dart';
import 'package:astro_talk/bloc/routes/app_pages.dart';
import 'package:astro_talk/repository/auth_repository.dart';
import 'package:astro_talk/utils/constants/app_local.dart';
import 'package:astro_talk/utils/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_storage/get_storage.dart';

import 'bloc/bottom_navigation/navigation_cubit.dart';
import 'bloc/signUp/signup_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  await GetStorage.init();
  await SharedPreferenceHelper.init();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository authRepository = AuthRepository();

  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();

    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('hi', AppLocale.HI),
      ],
      initLanguageCode: 'en',
    );

    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(),
          ),
          BlocProvider(
            create: (_) => NavigationCubit(),
          ),
          BlocProvider(
            create: (_) => HomeBloc()),
          BlocProvider(
              create: (_) => ProfileBloc()),
          BlocProvider(
              create: (_) => AstrologyBloc()),
        ],
        child: MaterialApp.router(
          routerConfig: AppPages.router,
          debugShowCheckedModeBanner: false,
          supportedLocales: localization.supportedLocales,
          localizationsDelegates: localization.localizationsDelegates,
          locale: localization.currentLocale,
        ),
      ),
    );
  }
}
