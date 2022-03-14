import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/sciences_news_bloc/sciences_news_events.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/utilities/constants/network_end_points.dart';

class SciencesNewsCubit extends Cubit<SciencesNewsEvents> {
  SciencesNewsCubit() : super(SciencesNewsInitialState());
  static SciencesNewsCubit get(context) => BlocProvider.of(context);
  List<dynamic> SciencesNewsList = [];

  void getAllSciencesNews() {
    emit(GetLoadingSciencesNews());
    DioHelper.getHttp(url: newsEndPoint, query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': API_KEY,
    }).then((value) {
      SciencesNewsList = value.data['articles'];
      emit(GetSuccessSciencesNews());
    }).catchError((error) {
      SciencesNewsList = [];
      emit(GetErrorSciencesNews());
    });
  }
}
