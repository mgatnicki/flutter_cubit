import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/models/m_error.dart';
import 'package:flutter_cubit/models/news.dart';
import 'package:flutter_cubit/services/news_service.dart';
import 'package:meta/meta.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService newsService;

  NewsCubit({@required this.newsService}) : super(NewsInit());

  init() async {
    try {
      await Future.delayed(Duration(milliseconds: 200)); // TODO
      emit(NewsLoading());
      await Future.delayed(Duration(milliseconds: 800));
      List<News> news = await newsService.getNews();
      emit(NewsLoaded(news: news));
    } on Exception catch (ex) {
      emit(NewsError(error: MError(code: 'news_cubit_error', message: ex.toString())));
    }
  }
}
