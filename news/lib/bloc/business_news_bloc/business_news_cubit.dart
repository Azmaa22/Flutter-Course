import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/business_news_bloc/business_news_events.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/utilities/constants/network_end_points.dart';

class BusinessNewsCubit extends Cubit<BusinessNewsEvents> {
  BusinessNewsCubit() : super(BusinessNewsInitialState());
  static BusinessNewsCubit get(context) => BlocProvider.of(context);
  List<dynamic> BusinessNewsList = [];

  void getAllBusinessNews() {
    emit(GetLoadingBusinessNews());
    DioHelper.getHttp(url: newsEndPoint, query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': API_KEY,
    }).then((value) {
      BusinessNewsList = value.data['articles'];
      emit(GetSuccessBusinessNews());
    }).catchError((error) {
      BusinessNewsList = [];
      emit(GetErrorBusinessNews());
    });
  }
}
