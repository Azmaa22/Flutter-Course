import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/sports_news_bloc/sports_news_events.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/utilities/constants/network_end_points.dart';

class SportsNewsCubit extends Cubit<SportsNewsEvents> {
  SportsNewsCubit() : super(SportsNewsInitialState());
  static SportsNewsCubit get(context) => BlocProvider.of(context);
  List<dynamic> SportsNewsList = [];

  void getAllSportsNews() {
    emit(GetLoadingSportsNews());
    DioHelper.getHttp(url: newsEndPoint, query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': API_KEY,
    }).then((value) {
      SportsNewsList = value.data['articles'];
      emit(GetSuccessSportsNews());
    }).catchError((error) {
      SportsNewsList = [];
      emit(GetErrorSportsNews());
    });
  }
}
