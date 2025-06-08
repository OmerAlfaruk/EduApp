import 'package:education_app/core/common/views/nested_back_button.dart';
import 'package:education_app/core/common/widgets/course_info_tile.dart';
import 'package:education_app/core/common/widgets/expandable_text.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.course});

  final Course course;

  static const String routeName = '/course-details';

  @override
  Widget build(BuildContext context) {
    final course = (this.course as CourseModel).copyWith(numberOfVideos: 3);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(title: Text(course.title), leading: const NestedBackButton()),
      body: GradientBackground(
        image: MediaRes.homeGradientBackground,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SizedBox(
                height: context.height * .3,
                child: Center(
                  child: course.image != null
                      ? Image.network(course.image!)
                      : Image.asset(MediaRes.casualMeditation),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (course.description != null)
                    ExpandableText(
                      context: context,
                      text: course.description ?? 'No description available',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (course.numberOfMaterials > 0 ||
                      course.numberOfVideos > 0 ||
                      course.numberOfExams > 0) ...[
                    const Text(
                      'Course Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (course.numberOfVideos > 0) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      CourseInfoTile(
                        image: MediaRes.courseInfoVideo,
                        title: '${course.numberOfVideos} Video(s)',
                        subtitle:
                            'Watch our tutorial videos for ${course.title}',
                        onTap: () => Navigator.of(context)
                            .pushNamed('unknown-route', arguments: course),
                      ),
                    ],
                    if (course.numberOfMaterials > 0) ...[
                      Text('Materials: ${course.numberOfMaterials}'),
                    ],
                    if (course.numberOfExams > 0) ...[
                      Text('Exams: ${course.numberOfExams}'),
                    ]
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
