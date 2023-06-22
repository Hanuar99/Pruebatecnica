import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/core/constants/constants.dart';
import 'package:prueba/core/utils/app_text_style.dart';
import 'package:prueba/domain/entities/user.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';
import 'package:prueba/presentation/widgets/alerts/show_loading_message.dart';
import 'package:prueba/presentation/widgets/custom_appbar.dart';
import 'package:prueba/presentation/widgets/custom_button.dart';
import 'package:prueba/presentation/widgets/custom_text_form_field.dart';

import '../widgets/alerts/show_delete_confirmation.dart';

class EditUserPage extends StatefulWidget {
  final User user;
  const EditUserPage({super.key, required this.user});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();

  List<String> directions = [];

  void _addAddress() {
    setState(() {
      directions.add('');
    });
  }

  @override
  void initState() {
    _firstNameController.text = widget.user.firstName;
    _lastNameController.text = widget.user.lastName;
    _fechaController.text = widget.user.fechaNacimiento;
    directions = widget.user.directions;
    print(directions);
    super.initState();
  }

  DateTime? initial;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        String fecha =
            '${pickedDate.day}-${pickedDate.month}-${pickedDate.year}';

        _fechaController.text = fecha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Editar Usuario', widgetActions: [
        IconButton(
            onPressed: () => showDeleteConfirmation(context, widget.user.id),
            icon: const Icon(Icons.delete))
      ]),
      body: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {
          if (state.editUserStatus == EditUserStatus.loading) {
            showLoadingMessage(context, 'Actualizando usuario');
          }
          if (state.editUserStatus == EditUserStatus.loadSuccess) {
            BlocProvider.of<UsersBloc>(context).add(GetUsersEvent());
            Navigator.pop(context);
            flutterToastSucces(msg: 'Usuario actualizado');
          }
          if (state.deleteUserStatus == DeleteUserStatus.loading) {
            showLoadingMessage(context, 'Eliminando usuario');
          }
          if (state.deleteUserStatus == DeleteUserStatus.loadSuccess) {
            BlocProvider.of<UsersBloc>(context).add(GetUsersEvent());
            Navigator.pop(context);
            flutterToastSucces(msg: 'Usuario eliminado');
          }
          if (state.deleteUserStatus == DeleteUserStatus.error) {
            Navigator.pop(context);
            flutterToastError(msg: state.errorMessage);
          }
          if (state.editUserStatus == EditUserStatus.error) {
            Navigator.pop(context);
            flutterToastError(msg: state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: _firstNameController,
                labelText: 'Nombre',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digita tu nombre';
                  }

                  return null;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _lastNameController,
                labelText: 'Apellido',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digita tu apellido';
                  }

                  return null;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                controller: _fechaController,
                labelText: 'Fecha de Nacimiento',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Selecciona tu fecha de nacimiento';
                  }

                  return null;
                },
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Direcciones físicas:',
                    style: AppTextStyle.subtitleText,
                  ),
                  IconButton(
                      onPressed: _addAddress, icon: const Icon(Icons.add))
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: directions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            onChanged: (value) => directions[index] = value,
                            controller:
                                TextEditingController(text: directions[index]),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle, size: 15.h),
                          onPressed: () =>
                              setState(() => directions.removeAt(index)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              Center(
                  child: CustomButton(
                      colorButton: Colors.amber,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        User user = User(
                          id: widget.user.id,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          fechaNacimiento: _fechaController.text,
                          directions: directions,
                        );

                        BlocProvider.of<UsersBloc>(context)
                            .add(EditarUserEvent(user: user));
                      },
                      text: 'Actualizar')),
            ],
          ),
        ),
      ),
    );
  }
}
