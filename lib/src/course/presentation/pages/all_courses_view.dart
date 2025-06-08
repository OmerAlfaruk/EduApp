import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/core/common/widgets/course_tile.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/presentation/pages/course_detail_screen.dart';
import 'package:flutter/material.dart';

class AllCoursesView extends StatelessWidget {
  const AllCoursesView({super.key, required this.courses});
  final List<Course> courses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const NestedBackButton(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: GradientBackground(
        image: MediaRes.homeGradientBackground,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Space for the AppBar
              const Padding(padding: EdgeInsets.only(left: 20),
                child: Text(
                  'All Subject',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 40,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: courses.map((course)=>CourseTile(course: course, onTap: (){
                    // TODO:Navigate to Course Details
                    Navigator.pushNamed(context, CourseDetailScreen.routeName,arguments: course);
                  })).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
