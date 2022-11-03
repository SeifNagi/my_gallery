import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/sharedpreferences/shared_pref.dart';
import '../components/login/background_image.dart';
import '../components/mygallery/button_rows.dart';
import '../components/mygallery/gridview_container.dart';

// ignore: must_be_immutable
class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  ImagePicker picker = ImagePicker();
  late XFile? image;
  late File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundImage(
              imagePath: 'assets/my_gallery/mygallery_background_image.png',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome \n${SharedPref.getUserName()}',
                        style: const TextStyle(fontSize: 24),
                      ),
                      CircleAvatar(
                        radius: 16.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child:
                              Image.asset('assets/my_gallery/avatar_image.png'),
                        ),
                      ),
                    ],
                  ),
                  ButtonRows(),
                  const GridViewBuilder()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
