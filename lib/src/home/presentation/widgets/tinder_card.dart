
import 'package:education_app/core/extensions/context_extension.dart';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TinderCard extends StatelessWidget {
  const TinderCard({super.key, required this.isFirst, this.colour});
  final bool isFirst;
  final Color? colour;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 137,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          gradient: isFirst
              ? const LinearGradient(
              colors: [Color(0xff8e96ff), Color(0xFFA06AF9)])
              : null,
          color: colour,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                offset: const Offset(0, 4),
                blurRadius: 10)
          ],
        ),
        child: isFirst
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${context.courseOfTheDay?.title??"Chemistry"} final\n exams',
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),
            ),
            const Row(
              children: [
                Icon(IconlyLight.notification,color: Colors.white,),
                SizedBox(width: 8,),
                Text('45 minutes'),
              ],
            )
          ],
        )
            : null,
      ),
    );
  }
}
