import 'package:education_app/core/common/widgets/course_tile.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/colours.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/presentation/pages/all_courses_view.dart';
import 'package:education_app/src/course/presentation/pages/course_detail_screen.dart';
import 'package:education_app/src/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeSubjects extends StatelessWidget {
  const HomeSubjects({super.key, required this.courses});
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            sectionTitle: 'Courses',
            seeAll: courses.length >= 4,
            onSeeAll: () => context.push(
              AllCoursesView(courses: courses),
            ),
          ),
          const Text(
            'Explore our courses',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colours.neutralTextColour),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: courses
                .take(4)
                .map(
                  (course) => CourseTile(
                    course: course,
                    //TODO(Course-Details):changes to pushedNamed and route
                    onTap: () =>Navigator.of(context).pushNamed(CourseDetailScreen.routeName, arguments: course),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
