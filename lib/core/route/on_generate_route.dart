import 'package:flutter/material.dart';
import 'package:prueba/domain/entities/user.dart';
import 'package:prueba/presentation/pages/edit_user_page.dart';
import 'package:prueba/presentation/pages/register_user_page.dart';
import 'package:prueba/presentation/pages/users_page.dart';

import 'page_const.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.registerUser:
        {
          return routeBuilder(const RegisterUserPage());
        }
      case PageConst.usersPage:
        {
          return routeBuilder(const UsersPage());
        }
      case PageConst.editUserPage:
        {
          if (args is User) {
            return routeBuilder(EditUserPage(
              user: args,
            ));
          } else {
            return routeBuilder(const NoPageFound());
          }
        }

      default:
        {
          return routeBuilder(const NoPageFound());
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not found'),
      ),
      body: const Center(
        child: Text('Page Not found'),
      ),
    );
  }
}
