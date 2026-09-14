class CategoryModel {
  final int id;
  final String title;
  final String image;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });
}

class CourseModel {
  final int id;
  final String title;
  final String instructor;
  final String price;
  final String oldPrice;
  final String duration;
  final String level;
  final String image;
  final String description;

  const CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.price,
    required this.oldPrice,
    required this.duration,
    required this.level,
    required this.image,
    this.description =
        'تعلم من مئات الكورسات المتقدمة، طبق علي مشروعات حقيقية، وابنِ المهارات التي يحتاجها سوق العمل.',
  });
}

class BundleModel {
  final int id;
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final String duration;
  final String studentsCount;
  final String coursesCount;
  final String image;
  final List<String> tags;
  final List<BundleCourseItem> courses;

  const BundleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.duration,
    required this.studentsCount,
    required this.coursesCount,
    required this.image,
    required this.tags,
    required this.courses,
  });
}

class BundleCourseItem {
  final int id;
  final String title;
  final String duration;
  final int lessonsCount;

  const BundleCourseItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.lessonsCount,
  });
}

class PlanModel {
  final int id;
  final String title;
  final String price;
  final String oldPrice;
  final String? discount;
  final List<String> features;

  const PlanModel({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.features,
    this.discount,
  });
}

class FaqModel {
  final int id;
  final String question;
  final String answer;

  const FaqModel({
    required this.id,
    required this.question,
    required this.answer,
  });
}

class TestimonialModel {
  final int id;
  final String quote;
  final String name;
  final String diploma;
  final int rating;

  const TestimonialModel({
    required this.id,
    required this.quote,
    required this.name,
    required this.diploma,
    required this.rating,
  });
}

class CourseFeatureModel {
  final String value;
  final String label;

  const CourseFeatureModel({required this.value, required this.label});
}

class CourseSectionModel {
  final String title;
  final int lessonsCount;
  final List<String> lessons;

  const CourseSectionModel({
    required this.title,
    required this.lessonsCount,
    required this.lessons,
  });
}

class NavItemModel {
  final String title;
  final String? route;
  final List<NavItemModel>? children;

  const NavItemModel({
    required this.title,
    this.route,
    this.children,
  });
}
