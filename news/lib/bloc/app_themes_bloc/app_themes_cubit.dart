import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/app_themes_bloc/app_theme_events.dart';
import 'package:news/helpers/shared_preferences_helper.dart';

class AppThemeModeCubit extends Cubit<AppThemeModeEvents> {
  AppThemeModeCubit() : super(GetInitialAppThemeMode());
  static AppThemeModeCubit get(context) => BlocProvider.of(context);
  bool isDark = true;

  void changeAppThemeMode({required bool? sharedPrefValue}) {
    if (sharedPrefValue != null) {
      isDark = sharedPrefValue;
    } else {
      isDark = !isDark;
      SharedPreferencesHelper()
          .putBooleanSharedPreferences(key: 'isDark', value: isDark)
          .then((value) {
        emit(ChangeAppThemeMode());
      }).catchError((error) {
        print('error from shared prefs ${error.toString()}');
      });
    }
  }
}
