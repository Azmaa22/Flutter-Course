import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/business_news_bloc/business_news_cubit.dart';
import 'package:news/bloc/business_news_bloc/business_news_events.dart';
import 'package:news/components/divider.dart';
import 'package:news/components/news_item.dart';

class BusinessNewsScreen extends StatelessWidget {
  const BusinessNewsScreen({Key? key}) : super(key: key);
  static const id = 'Business News Screen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessNewsCubit, BusinessNewsEvents>(
        builder: (context, state) {
          BusinessNewsCubit myCubit = BusinessNewsCubit.get(context);
          if (state is GetLoadingBusinessNews) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetSuccessBusinessNews) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return newsItem(
                    item: myCubit.BusinessNewsList[index],
                    context: context,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return divider();
                },
                itemCount: myCubit.BusinessNewsList.length);
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
