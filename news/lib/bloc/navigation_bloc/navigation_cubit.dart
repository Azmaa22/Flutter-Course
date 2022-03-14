import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/navigation_bloc/navigation_events.dart';
import 'package:news/screens/business_news_screen/business_news_screen.dart';
import 'package:news/screens/sciences_news_screen/sciences_news_screen.dart';
import 'package:news/screens/setting_screen/setting_screen.dart';
import 'package:news/screens/sports_news_screen/sports_news_screen.dart';

class NavigationCubit extends Cubit<NavigationEvents> {
  NavigationCubit() : super(NavigateToInitialScreen());
  // ignore: non_constant_identifier_names
  int current_index = 0;
  List<Widget> screens = [
    const SportsNewsScreen(),
    const BusinessNewsScreen(),
    const SciencesNewsScreen(),
    const SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  static NavigationCubit get(context) => BlocProvider.of(context);

  void navigateToOtherScreen(int index) {
    current_index = index;
    emit(NavigateToOtherScreen());
  }
}
