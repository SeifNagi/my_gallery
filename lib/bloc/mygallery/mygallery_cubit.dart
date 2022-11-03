import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/data/model/mygallery_model.dart';
import '../../data/endpoints.dart';
import '../../data/network/dio_helper.dart';
import '/bloc/mygallery/mygallery_states.dart';

class MyGalleryCubit extends Cubit<MyGalleryStates> {
  MyGalleryCubit() : super(MyGalleryInitialState());
  static MyGalleryCubit get(context) => BlocProvider.of(context);
  MyGalleryModel? galleryModel;
  void getMyGalleryData() {
    emit(MyGalleryLoadingState());
    DioHelper.getData(url: baseUrl + showMyGallery, query: {}).then((value) {
      debugPrint('My Gallery Data ${value.toString()}');
      debugPrint("Image hehehe  ${value.data}");
      galleryModel = MyGalleryModel.fromJson(value.data);
      emit(MyGallerySucceessState(galleryModel!));
    }).catchError((error) {
      debugPrint('Error: ${error.toString()}');
      emit(MyGalleryErrorState(error.toString()));
    });
  }

  void postMyGalleryData({required File image}) async {
    DioHelper.uploadImage(
      image: image,
      url: uploadImagePath,
    ).then((value) {
      debugPrint('Post Image Gallery ${value.data.toString()}');
      emit(MyGallerySucceessState(galleryModel!));
      galleryModel = MyGalleryModel.fromJson(value.data);
      getMyGalleryData();
    }).catchError((error) {
      debugPrint('Error: ${error.toString()}');
      emit(MyGalleryErrorState(error.toString()));
    });
  }
}
