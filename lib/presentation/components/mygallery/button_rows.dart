import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/presentation/styles/colors.dart';
import '../../../bloc/mygallery/mygallery_cubit.dart';
import '../../../shared/sharedpreferences/shared_pref.dart';
import '../../../shared/widgets/elevated_button_with_image.dart';
import '../../pages/login_screen.dart';

// ignore: must_be_immutable
class ButtonRows extends StatelessWidget {
  ButtonRows({super.key});
  ImagePicker picker = ImagePicker();
  late XFile? image;
  late File file;
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: CustomizedButtonWithImage(
            onpress: () {
              SharedPref.saveToken('');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            imagePath: 'assets/my_gallery/logout_image.png',
            buttonText: 'log out',
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          child: CustomizedButtonWithImage(
            onpress: () {
              showSimpleDialog(context);
            },
            imagePath: 'assets/my_gallery/upload_image.png',
            buttonText: 'upload',
          ),
        )
      ],
    );
  }

  Future<void> showSimpleDialog(context) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white30,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width / 2.6,
                    height: height / 18,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomizedButtonWithImage(
                        onpress: () async {
                          image = await picker.pickImage(
                              source: ImageSource.gallery);
                          file = File(image!.path);
                          // ignore: use_build_context_synchronously
                          MyGalleryCubit.get(context)
                              .postMyGalleryData(image: file);
                        },
                        buttonText: 'Gallery',
                        imagePath: 'assets/my_gallery/gallery_image.png'),
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Container(
                    width: width / 2.6,
                    height: height / 18,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomizedButtonWithImage(
                        onpress: () async {
                          image = await picker.pickImage(
                              source: ImageSource.camera);
                          file = File(image!.path);
                          // ignore: use_build_context_synchronously
                          MyGalleryCubit.get(context)
                              .postMyGalleryData(image: file);
                        },
                        buttonText: 'Camera',
                        imagePath: 'assets/my_gallery/camera_image.png'),
                  )
                ],
              )
            ],
          );
        });
  }
}
