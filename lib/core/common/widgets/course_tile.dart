import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter/material.dart';
class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onTap});
  final Course course;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
          width: 54,
          child: Column(
            children: [
              SizedBox(
                height: 54,
                width: 54,
                child: Image.network(
                  course.image!,
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                course.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
