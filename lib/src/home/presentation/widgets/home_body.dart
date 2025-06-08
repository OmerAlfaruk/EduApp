import 'package:education_app/core/common/app/providers/course_of_the_day_provider.dart';
import 'package:education_app/core/common/views/loading_view.dart';
import 'package:education_app/core/common/widgets/not_found_text.dart';
import 'package:education_app/core/utils/core_utils.dart';
import 'package:education_app/src/course/presentation/bloc/course_cubit.dart';
import 'package:education_app/src/home/presentation/refactors/home_header.dart';
import 'package:education_app/src/home/presentation/refactors/home_subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit,CourseState>(
      listener: (context, state) {
        if (state is CourseError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is CourseLoaded && state.courses.isNotEmpty) {
          final courses = state.courses..shuffle();
          final courseOfTheDay = courses.first;
          context
              .read<CourseOfTheDayNotifier>()
              .setCourseOfTheDay(courseOfTheDay);
        }
      },
      builder: (context, state) {
        if (state is CourseLoading) {
          return const LoadingView();
        } else if (state is CourseLoaded && state.courses.isEmpty) {
          return const NotFoundText(
              message:
                  "No courses found\n Please Contact Admin or if You are an admin, add courses");
        }
        state as CourseLoaded; // Ensure state is CourseLoaded for the next line
        final courses = state.courses;
        courses.sort(
            (a, b) => b.updatedAt.compareTo(a.updatedAt),
          );
        return ListView(

          children: [
            const HomeHeader(),
            const SizedBox(height: 20,),
            HomeSubjects(courses:courses,)
          ],

            );
      },
    );
  }

  void _getCourse() {
    context.read<CourseCubit>().getCourses();
  }

  @override
  void initState() {
    super.initState();
    _getCourse();
  }
}
