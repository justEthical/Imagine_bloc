part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenLoading extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenLoaded extends HomeScreenState {
  final List<ImageModel> images;
  final ImageModel featuredImage;
  final ScrollController scrollController;
  const HomeScreenLoaded({required this.images, required this.featuredImage, required this.scrollController});
  @override
  List<Object> get props => [images, featuredImage];
}

class HomeScreenImageLoadError extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenGridViewScrollEnabled extends HomeScreenState {
  final bool isScrollEnabled;
  const HomeScreenGridViewScrollEnabled({required this.isScrollEnabled});
  @override
  List<Object> get props => [];
}

class HomeScreenLoadMoreImages extends HomeScreenState {
  @override
  List<Object> get props => [];
}


