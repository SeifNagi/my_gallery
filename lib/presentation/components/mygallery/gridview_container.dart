import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/mygallery/mygallery_cubit.dart';
import '../../../bloc/mygallery/mygallery_states.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<MyGalleryCubit, MyGalleryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(child: Builder(builder: (context) {
            return ConditionalBuilder(
                condition: MyGalleryCubit.get(context).galleryModel != null,
                builder: (context) => SingleChildScrollView(
                      child: SizedBox(
                          width: width,
                          height: height - 164,
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
                              })),
                    ),
                fallback: (BuildContext context) => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor),
                    ));
          }));
        });
  }
}
