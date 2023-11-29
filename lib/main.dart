import 'package:bloc_pattern_flutter_ornek/constants.dart';
import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/init/lang/language_manager.dart';
import 'package:bloc_pattern_flutter_ornek/views/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      startLocale: AppLanguages.TR_LOCALE,
      supportedLocales: AppLanguages.supportedLanguages,
      path: AppLanguages.LANG_PATH,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        ),
      ],
      child: MaterialApp(
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: ColorConst().white, fontSize: 24), color: ColorConst().amber)),
      ),
    );
  }
}
