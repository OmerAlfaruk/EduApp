import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Classes"),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        Consumer<UserProvider>(builder: (_, provider, __) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: provider.user?.profilePic != null
                  ? NetworkImage(provider.user!.profilePic!)
                  : const AssetImage(MediaRes.user) as ImageProvider,
            ),
          );
        }),
      ],
    );
  }

  @override
  // This is required to implement the PreferredSizeWidget interface.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
