import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/constants/edges.dart';
import 'package:flutter_cubit/constants/text_styles.dart';
import 'package:flutter_cubit/cubits/news/news_cubit.dart';
import 'package:flutter_cubit/models/news.dart';
import 'package:flutter_cubit/services/news_service.dart';
import 'package:flutter_cubit/widgets/notifications_widget.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int notificationCount = 0;
  NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Informacyje kurła',
          style: TextStyles.large.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [Notifications()],
      ),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(top: kSmall),
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
            colors: [kPrimaryColor, Colors.white],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocProvider(
          create: (context) => NewsCubit(newsService: newsService),
          child: BlocConsumer<NewsCubit, NewsState>(
            listener: (context, state) {
              if (state is NewsError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is NewsInit) {
                context.read<NewsCubit>().init();
                return Container();
              } else if (state is NewsLoading) {
                return _newsLoading();
              } else if (state is NewsLoaded) {
                return _news(state.news);
              } else {
                // (state is NewsError)
                return Text('brak newsów');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _newsLoading() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: Edges.large,
        child: CircularProgressIndicator(
          backgroundColor: kAccentColor,
        ),
      ),
    );
  }

  Widget _news(List<News> news) {
    return ListView.builder(
      padding: Edges.horizontalLarge,
      itemCount: news.length,
      itemBuilder: (context, index) => _newsItem(news[index]),
    );
    // int count = news.length;
    // int half = count >> 1;
    // List<News> part1 = news.take(half).toList();
    // List<News> part2 = news.skip(half).take(count - half).toList();
    // return Row(
    //   children: [
    //     Expanded(
    //       child: ListView.builder(
    //         padding: Edges.horizontalLarge,
    //         itemCount: part1.length,
    //         itemBuilder: (context, index) => _newsItem(part1[index]),
    //       ),
    //     ),
    //     Expanded(
    //       child: ListView.builder(
    //         padding: Edges.horizontalLarge,
    //         itemCount: part2.length,
    //         itemBuilder: (context, index) => _newsItem(part2[index]),
    //       ),
    //     ),
    //   ],
    // );
  }
}

Widget _newsItem(News news) {
  return Container(
    margin: const EdgeInsets.only(bottom: kLarge),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(kMedium),
        bottomRight: Radius.circular(kMedium),
      ),
    ),
    child: Column(
      children: [
        Container(
          child: Image.network(
            news.urlToImage,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: Edges.medium,
          child: Column(
            children: [
              Text(
                news.title,
                style: TextStyles.medium.copyWith(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: kSmall),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat('HH:mm, dd MMMM yyyy').format(news.date),
                  style: TextStyles.verySmall.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
