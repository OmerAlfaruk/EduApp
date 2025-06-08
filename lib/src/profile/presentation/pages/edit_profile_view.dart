import 'dart:convert';
import 'dart:io';

import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/core/utils/core_utils.dart';
import 'package:education_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_app/src/profile/presentation/widgets/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final fullNameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();

  File? pickedImage;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
      print('Selected image path: ${image.path}');
    } else {
      // Handle the case when no image is selected
      print('No image selected');
    }
  }

  @override
  void initState() {
    fullNameController.text = context.currentUser!.fullName.trim();
    bioController.text = context.currentUser?.bio?.trim() ?? '';
    emailController.text = context.currentUser?.email.trim() ?? '';
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    bioController.dispose();
    emailController.dispose();
    passwordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }

  bool get nameChanged =>
      fullNameController.text.trim() != context.currentUser!.fullName.trim();
  bool get bioChanged =>
      bioController.text.trim() != context.currentUser?.bio?.trim();
  bool get emailChanged => emailController.text.trim().isNotEmpty;
  bool get passwordChanged => passwordController.text.trim().isNotEmpty;
  bool get imageChanged => pickedImage != null;
  bool get nothingChanged =>
      !nameChanged &&
      !bioChanged &&
      !emailChanged &&
      !passwordChanged &&
      !imageChanged;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          CoreUtils.showSnackBar(context, 'Profile updated successfully');
          context.pop();
        }

        if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const NestedBackButton(),
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (nothingChanged) {
                    CoreUtils.showSnackBar(context, 'Nothing to update');
                    return;
                  }
                  final bloc = context.read<AuthBloc>();

                  if (nameChanged) {
                    bloc.add(UpdateUserEvent(
                        action: UpdateUserAction.displayName,
                        userData: fullNameController.text.trim()));
                  }
                  if (bioChanged) {
                    bloc.add(UpdateUserEvent(
                        action: UpdateUserAction.bio,
                        userData: bioController.text.trim()));
                  }
                  if (emailChanged) {
                    bloc.add(UpdateUserEvent(
                        action: UpdateUserAction.email,
                        userData: emailController.text.trim()));
                  }
                  if (passwordChanged) {
                    if (oldPasswordController.text.isNotEmpty) {
                      CoreUtils.showSnackBar(
                          context, "Please enter your old password");
                      return;
                    }

                    bloc.add(UpdateUserEvent(
                        action: UpdateUserAction.password,
                        userData: jsonEncode({
                          'oldPassword': oldPasswordController.text.trim(),
                          'newPassword': passwordController.text.trim()
                        })));
                  }
                  if (imageChanged) {
                    bloc.add(UpdateUserEvent(
                        action: UpdateUserAction.profilePic,
                        userData: pickedImage!));
                  }
                },
                child: state is AuthLoading
                    ? const CircularProgressIndicator()
                    : StatefulBuilder(builder: (__, refresh) {
                        fullNameController.addListener(() => refresh(() {}));
                        bioController.addListener(() => refresh(() {}));
                        emailController.addListener(() => refresh(() {}));
                        passwordController.addListener(() => refresh(() {}));


                        return Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: nothingChanged
                                  ? Colors.grey
                                  : Colors.blueAccent),
                        );
                      }),
              )
            ],
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: GradientBackground(
              image: MediaRes.profileGradientBackground,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Builder(builder: (context) {
                    final user = context.currentUser;
                    final image =
                        user?.profilePic == null || user!.profilePic!.isEmpty
                            ? null
                            : user.profilePic;
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage: pickedImage != null
                          ? FileImage(pickedImage!)
                          : image != null
                              ? NetworkImage(image)
                              : const AssetImage(MediaRes.user)
                                  as ImageProvider,
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),

                         Positioned (

                            bottom: 25,
                            right: 25,


                            child: IconButton(
                                onPressed: () {
                                  pickImage();
                                },
                                icon: Icon(
                                  (pickedImage != null ||
                                          user!.profilePic != null)
                                      ? Icons.edit
                                      : Icons.add_a_photo,

                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'we recommend an image of at least 400x400',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF777E90),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  EditProfileForm(
                      fullNameController: fullNameController,
                      bioController: bioController,
                      emailController: emailController,
                      passwordController: passwordController,
                      oldPasswordController: oldPasswordController,),
                  
                ],
              )),
        );
      },
    );
  }
}
