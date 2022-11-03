import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/data/endpoints.dart';
import 'package:my_gallery/data/model/mygallery_model.dart';
import 'package:my_gallery/data/network/dio_helper.dart';
import '../../bloc/mygallery/mygallery_cubit.dart';
import '../../bloc/mygallery/mygallery_states.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  /*final List<Map> myProducts =
      List.generate(50, (index) => {"id": index, "name": "Product $index"})
          .toList();*/
  late File file;
  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    XFile? image;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<MyGalleryCubit, MyGalleryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        /*List imagePath =
            MyGalleryCubit.get(context).galleryModel!.data!.images!;*/
        return Scaffold(
          body: Builder(builder: (context) {
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.logout),
                          label: const Text('log out')),
                      ElevatedButton.icon(
                          onPressed: () async {
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            file = File(image!.path);
                            MyGalleryCubit.get(context)
                                .postMyGalleryData(image: file);

                            debugPrint('Image ${image!.name}');
                          },
                          icon: const Icon(Icons.upload),
                          label: const Text('Upload')),
                    ],
                  ),
                  ConditionalBuilder(
                      condition:
                          MyGalleryCubit.get(context).galleryModel != null,
                      builder: (context) => SizedBox(
                            width: width,
                            height: height - 80,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: MyGalleryCubit.get(context)
                                    .galleryModel!
                                    .data!
                                    .images!
                                    .length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          MyGalleryCubit.get(context)
                                              .galleryModel!
                                              .data!
                                              .images![index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                      fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor),
                          )),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  /*void _uploadImage() async {
    var fromData = FormData.fromMap({
      'img': await MultipartFile.fromFile(file.path),
    });
    var response =
        await DioHelper.dio.post(baseUrl + uploadImagePath, data: fromData);
    debugPrint(response.toString());
  }*/
}
