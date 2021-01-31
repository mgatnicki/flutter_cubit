part of 'news_cubit.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsInit extends NewsState {
  const NewsInit();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final List<News> news;

  const NewsLoaded({this.news});
}

class NewsError extends NewsState {
  final MError error;

  const NewsError({this.error});
}
