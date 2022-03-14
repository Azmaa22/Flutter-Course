import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/sports_news_bloc/sports_news_cubit.dart';
import 'package:news/bloc/sports_news_bloc/sports_news_events.dart';
import 'package:news/components/divider.dart';
import 'package:news/components/news_item.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/utilities/constants/network_end_points.dart';

class SportsNewsScreen extends StatelessWidget {
  const SportsNewsScreen({Key? key}) : super(key: key);
  static const id = 'Sports News Screen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportsNewsCubit, SportsNewsEvents>(
        builder: (context, state) {
          SportsNewsCubit myCubit = SportsNewsCubit.get(context);
          if (state is GetLoadingSportsNews) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetSuccessSportsNews) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return newsItem(
                    item: myCubit.SportsNewsList[index],
                    context: context,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return divider();
                },
                itemCount: myCubit.SportsNewsList.length);
          } else {
            return Container(
              height: 100,
              width: 100,
              color: Colors.deepOrange,
              child: const Text('Error'),
            );
          }
        },
        listener: (context, state) {});
  }
}
