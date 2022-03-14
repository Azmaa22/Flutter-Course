import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/app_themes_bloc/app_theme_events.dart';
import 'package:news/bloc/app_themes_bloc/app_themes_cubit.dart';
import 'package:news/bloc/bloc_observer.dart';
import 'package:news/bloc/business_news_bloc/business_news_cubit.dart';
import 'package:news/bloc/navigation_bloc/navigation_cubit.dart';
import 'package:news/bloc/sciences_news_bloc/sciences_news_cubit.dart';
import 'package:news/bloc/sports_news_bloc/sports_news_cubit.dart';
import 'package:news/helpers/shared_preferences_helper.dart';
import 'package:news/screens/home_screen/home_screen.dart';
import 'package:news/utilities/constants/app_themes/app_dark_theme.dart';
import 'package:news/utilities/constants/app_themes/app_light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initSharedPreferences();
  bool? isDark =
      SharedPreferencesHelper().getBooleanSharedPreferences(key: 'isDark');
  runApp(MyApp(isDark: isDark));
  BlocOverrides.runZoned(() {
    AppThemeModeCubit();
    NavigationCubit();
    SportsNewsCubit();
    BusinessNewsCubit();
    SciencesNewsCubit();
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({required this.isDark});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeModeCubit>(
          create: (BuildContext context) =>
              AppThemeModeCubit()..changeAppThemeMode(sharedPrefValue: isDark),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(),
        ),
        BlocProvider<SportsNewsCubit>(
          create: (BuildContext context) =>
              SportsNewsCubit()..getAllSportsNews(),
        ),
        BlocProvider<BusinessNewsCubit>(
          create: (BuildContext context) =>
              BusinessNewsCubit()..getAllBusinessNews(),
        ),
        BlocProvider<SciencesNewsCubit>(
          create: (BuildContext context) =>
              SciencesNewsCubit()..getAllSciencesNews(),
        ),
      ],
      child: BlocConsumer<AppThemeModeCubit, AppThemeModeEvents>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: dartTheme,
              themeMode: AppThemeModeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const HomeScreen(),
            );
          },
          listener: (context, state) {}),
    );
  }
}
