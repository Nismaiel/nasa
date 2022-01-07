import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa/data/picturesModel.dart';
import 'package:nasa/services/imagesService.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());
  ImagesService imagesService=ImagesService();
  getAllImages()async{
try {
  emit(ImagesLoading());
  final List<Images>imagesList = await imagesService.getImages();
  emit(ImagesLoaded(images: imagesList));
}catch(e){
  print(e.toString());
  emit(ImagesError(message: 'There was a problem loading Images'));
}
  }
}
