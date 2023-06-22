import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/core/constants/constants.dart';
import 'package:prueba/core/route/navigator_utils.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';
import 'package:prueba/presentation/widgets/custom_appbar.dart';

import '../../core/route/page_const.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    BlocProvider.of<UsersBloc>(context).add(GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Usuarios', widgetActions: [
        IconButton(
            onPressed: () async {
              await pushNamed(
                  context: context, PageConst: PageConst.registerUser);
            },
            icon: const Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: BlocConsumer<UsersBloc, UsersState>(
          listener: (context, state) {
            if (state.getUsersStatus == GetUsersStatus.error) {
              flutterToastError(msg: state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state.getUsersStatus == GetUsersStatus.loading) {
              return SizedBox(
                height: ScreenUtil().screenHeight / 1.4,
                child: const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: AppColors.azul,
                )),
              );
            }
            if (state.users!.isEmpty) {
              return SizedBox(
                  height: ScreenUtil().screenHeight / 1.4,
                  child:
                      const Center(child: Text('No hay usuarios registrados')));
            }
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.users!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        '${state.users![index].firstName} ${state.users![index].lastName}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        pushNamed(
                            context: context,
                            PageConst: PageConst.editUserPage,
                            arg: state.users![index]);
                      },
                    ),
                    const Divider()
                  ],
                );
              },
            );
          },
        ),
      )),
    );
  }
}
