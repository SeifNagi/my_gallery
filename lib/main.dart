import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/sharedpreferences/shared_pref.dart';
import '../bloc/login/login_cubit.dart';
import '../presentation/pages/gallery.dart';
import 'bloc/mygallery/mygallery_cubit.dart';
import 'presentation/pages/login_screen.dart';
import '../data/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initialize();
  Widget? widget;
  String token = SharedPref.getToken()!;
  debugPrint('Token: $token');
  if (token == '') {
    widget = const LoginScreen();
  } else {
    widget = GalleryScreen();
  }
  DioHelper.init();
  runApp(MyApp(startScreen: widget));
}

class MyApp extends StatelessWidget {
  Widget? startScreen;
  MyApp({super.key, this.startScreen});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => MyGalleryCubit()..getMyGalleryData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: startScreen,
      ),
    );
  }
}
