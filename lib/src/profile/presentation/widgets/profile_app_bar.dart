import 'package:education_app/core/common/app/providers/tab_navigator.dart';
import 'package:education_app/core/common/widgets/popup_item.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/services/injection_container.dart';
import 'package:education_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_app/src/profile/presentation/pages/edit_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Account',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colours.neutralTextColour),
      ),
      actions: [
        PopupMenuButton(
          offset: const Offset(0, 50),
          icon: Icon(
            Icons.more_horiz,
            color: Colours.neutralTextColour,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          itemBuilder: (_) => [
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colours.neutralTextColour,
                ),

              ),
              onTap: ()=>context.push(BlocProvider<AuthBloc>(create:(_)=> sl<AuthBloc>(),child: const EditProfileView(),)),
            ),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Notification',
                icon: Icon(
                  IconlyLight.notification,
                  color: Colours.neutralTextColour,
                ),

              ),
              onTap: ()=>context.push(const Placeholder()),
            ),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Help',
                icon: Icon(
                  Icons.help_outlined,
                  color: Colours.neutralTextColour,
                ),

              ),
              onTap: ()=>context.push(Placeholder()),
            ),
            PopupMenuItem<void>(
              height: 1,
                padding:  EdgeInsets.zero,
                child: Divider(
              height: 1,
              color: Colors.grey.shade300,
              endIndent: 16,
              indent: 16,

            )),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Logout',
                icon: Icon(
                  Icons.logout,
                  color: Colours.neutralTextColour,
                ),

              ),
              onTap: ()  async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
