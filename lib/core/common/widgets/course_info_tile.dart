import 'package:flutter/material.dart';

class CourseInfoTile extends StatelessWidget {
  const CourseInfoTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap});
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
     child:  Row(
       children: [
         SizedBox(height: 48,width: 48,child: Padding(
           padding: const EdgeInsets.only(top: 2.0),
           child: Transform.scale(scale:1.48 ,child:  Image.asset(image)),
         ),),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(

                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),)
       ],
     ),
    );
  }
}
