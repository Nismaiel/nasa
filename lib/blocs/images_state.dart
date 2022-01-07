part of 'images_cubit.dart';

@immutable
abstract class ImagesState {
  final List<Images>images;
 const ImagesState({this.images=const <Images>[]});
}

class ImagesInitial extends ImagesState {}
class ImagesLoading extends ImagesState{}
class ImagesLoaded extends ImagesState{
  final List<Images>images;
 const ImagesLoaded({required this.images});
}
class OfflineImagesLoaded extends ImagesState{
  final List<Images>images;
 const OfflineImagesLoaded({required this.images});
}
class ImagesError extends ImagesState{
  final String message;
  const  ImagesError({required this.message});
}