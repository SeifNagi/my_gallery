import 'package:my_gallery/data/model/mygallery_model.dart';

abstract class MyGalleryStates {}

class MyGalleryInitialState extends MyGalleryStates {}

class MyGallerySucceessState extends MyGalleryStates {
  final MyGalleryModel galleryModel;
  MyGallerySucceessState(this.galleryModel);
}

class MyGalleryLoadingState extends MyGalleryStates {}

class MyGalleryErrorState extends MyGalleryStates {
  final String error;
  MyGalleryErrorState(this.error);
}
