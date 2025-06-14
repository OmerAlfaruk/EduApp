
import 'package:education_app/core/common/app/providers/user_provider.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder:(_,provider,__){
      final user = provider.user;
      final image = user?.profilePic==null||user!.profilePic!.isEmpty?null:user.profilePic;

      return Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:image!=null?NetworkImage(image):const AssetImage(MediaRes.user) as ImageProvider,

          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user?.fullName??'no user',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colours.neutralTextColour,
            ),
          ),
          if (user!.bio!=null&&user.bio!.isNotEmpty)...[
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width*0.15),
              child: Text(
                user.bio!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colours.neutralTextColour
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],

        ],

      );
    } );
  }
}
