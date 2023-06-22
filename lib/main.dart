import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/domain/entities/user.dart';
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

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Usuario'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${user.firstName} ${user.lastName}'),
            const SizedBox(height: 8.0),
            Text('Fecha de Nacimiento: ${user.fechaNacimiento}'),
            const SizedBox(height: 16.0),
            const Text('Direcciones físicas:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: user.directions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(user.directions[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditUserDetailsScreen extends StatelessWidget {
  const EditUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Detalles del Usuario'),
      ),
      body: const Center(
        child: Text('Pantalla de edición de detalles del usuario'),
      ),
    );
  }
}
