import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/app_themes_bloc/app_theme_events.dart';
import 'package:news/bloc/app_themes_bloc/app_themes_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const id = 'Settings  Screen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppThemeModeCubit, AppThemeModeEvents>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              AppThemeModeCubit.get(context)
                  .changeAppThemeMode(sharedPrefValue: null);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Change App Theme Mode',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.brightness_6_outlined,
                    size: 25.0,
                  ),
                ],
              ),
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppThemeModeCubit.get(context).isDark
                    ? Colors.amber[50]
                    : Colors.amber[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                // border: Border.all(color: Colors.deepOrange, width: 2.0),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
