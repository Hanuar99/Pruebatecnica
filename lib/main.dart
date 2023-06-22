import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';

import '/i_c.dart' as di;
import 'core/constants/constants.dart';
import 'core/route/on_generate_route.dart';
import 'core/route/page_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(create: (_) => di.sl<UsersBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
            onGenerateRoute: OnGenerateRoute.route,
            initialRoute: PageConst.usersPage,
          );
        },
      ),
    );
  }
}
