import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/app_themes_bloc/app_theme_events.dart';
import 'package:news/bloc/app_themes_bloc/app_themes_cubit.dart';
import 'package:news/bloc/navigation_bloc/navigation_cubit.dart';
import 'package:news/bloc/navigation_bloc/navigation_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'Home';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationEvents>(
      builder: (context, state) {
        NavigationCubit myCubit = NavigationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  print('please enter to search');
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: myCubit.bottomNavigationBarItems,
            currentIndex: myCubit.current_index,
            onTap: (index) {
              myCubit.navigateToOtherScreen(index);
            },
          ),
          body: myCubit.screens[myCubit.current_index],
        );
      },
      listener: (context, state) => {},
    );
  }
}
