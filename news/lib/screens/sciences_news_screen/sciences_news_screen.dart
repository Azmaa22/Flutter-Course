import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/sciences_news_bloc/sciences_news_cubit.dart';
import 'package:news/bloc/sciences_news_bloc/sciences_news_events.dart';
import 'package:news/components/divider.dart';
import 'package:news/components/news_item.dart';

class SciencesNewsScreen extends StatelessWidget {
  const SciencesNewsScreen({Key? key}) : super(key: key);
  static const id = 'Sciences News Screen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SciencesNewsCubit, SciencesNewsEvents>(
        builder: (context, state) {
          SciencesNewsCubit myCubit = SciencesNewsCubit.get(context);
          if (state is GetLoadingSciencesNews) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetSuccessSciencesNews) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return newsItem(
                    item: myCubit.SciencesNewsList[index],
                    context: context,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return divider();
                },
                itemCount: myCubit.SciencesNewsList.length);
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
