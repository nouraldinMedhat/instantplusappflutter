import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/models.dart';

class DemoData {
  static const categories = [
    CategoryModel(
      id: 1,
      title: 'التصميم وتجربة المستخدم',
      image: 'assets/images/png/categories/01.png',
    ),
    CategoryModel(
      id: 2,
      title: 'التطوير والبرمجيات',
      image: 'assets/images/png/categories/02.png',
    ),
    CategoryModel(
      id: 3,
      title: 'الذكاء الاصطناعي وعلوم البيانات',
      image: 'assets/images/png/categories/03.png',
    ),
    CategoryModel(
      id: 4,
      title: 'الأمن السيبراني',
      image: 'assets/images/png/categories/04.png',
    ),
    CategoryModel(
      id: 5,
      title: 'الخوادم والحوسبة السحابية',
      image: 'assets/images/png/categories/05.png',
    ),
  ];

  static const courses = [
    CourseModel(
      id: 1,
      title: 'Instant Start',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-1.webp',
      description:
          'تعلّم أحدث مفاهيم React.js مع Concurrent Rendering وابنِ تطبيقات احترافية جاهزة لسوق العمل.',
    ),
    CourseModel(
      id: 2,
      title: 'Data Science & Ai',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-2.webp',
    ),
    CourseModel(
      id: 3,
      title: 'Cyber Security Penetration Testing',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-3.webp',
    ),
    CourseModel(
      id: 4,
      title: 'Data Science & Ai',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-4.webp',
    ),
    CourseModel(
      id: 5,
      title: 'Instant Start',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-5.webp',
    ),
    CourseModel(
      id: 6,
      title: 'React.Js - متقدم',
      instructor: 'م. عبدالرحمن محمـد',
      price: '3000 ج.م',
      oldPrice: '4000 ج.م',
      duration: 'شهر',
      level: 'احترافي',
      image: 'assets/images/png/courses/course-6.webp',
      description:
          'تعلّم أحدث مفاهيم React.js مع Concurrent Rendering وابنِ تطبيقات احترافية جاهزة لسوق العمل.',
    ),
  ];

  static const bundleCourses = [
    BundleCourseItem(
      id: 1,
      title: 'JavaScript من الصفر للاحتراف',
      duration: '12 ساعة',
      lessonsCount: 48,
    ),
    BundleCourseItem(
      id: 2,
      title: 'HTML & CSS - بناء واجهات حديثة',
      duration: '10 ساعات',
      lessonsCount: 36,
    ),
    BundleCourseItem(
      id: 3,
      title: 'PHP Course - أساسيات الباك إند',
      duration: '14 ساعة',
      lessonsCount: 42,
    ),
    BundleCourseItem(
      id: 4,
      title: 'React.Js - متقدم',
      duration: '16 ساعة',
      lessonsCount: 55,
    ),
    BundleCourseItem(
      id: 5,
      title: 'مشروع تخرج Full Stack',
      duration: '10 ساعات',
      lessonsCount: 28,
    ),
  ];

  static const bundles = [
    BundleModel(
      id: 1,
      title: 'Instant Start',
      description:
          'حزمة متكاملة تبدأ من الأساسيات حتى مشروع تخرج Full Stack، مصممة لتأهلك لسوق العمل بسرعة.',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      discount: 'وفر 33%',
      duration: '62 ساعة',
      studentsCount: '2100',
      coursesCount: '5 كورسات',
      image: 'assets/images/png/bundles/01.png',
      tags: ['Java Script', 'Php Course', 'Html, Css'],
      courses: bundleCourses,
    ),
    BundleModel(
      id: 2,
      title: 'Instant Start',
      description:
          'حزمة متكاملة تبدأ من الأساسيات حتى مشروع تخرج Full Stack، مصممة لتأهلك لسوق العمل بسرعة.',
      price: '3000 ج.م',
      oldPrice: '4500 ج.م',
      discount: 'وفر 33%',
      duration: '62 ساعة',
      studentsCount: '2100',
      coursesCount: '5 كورسات',
      image: 'assets/images/png/bundles/01.png',
      tags: ['Java Script', 'Php Course', 'Html, Css'],
      courses: bundleCourses,
    ),
  ];

  static const plans = [
    PlanModel(
      id: 1,
      title: 'شهري',
      price: '1500 ج.م',
      oldPrice: '2000 ج.م',
      features: ['وصول كامل لجميع الكورسات'],
    ),
    PlanModel(
      id: 2,
      title: 'سنوي',
      price: '3000 ج.م',
      oldPrice: '5000 ج.م',
      discount: 'وفر 40%',
      features: [
        'وصول كامل لجميع الكورسات',
        'كوبون خصم بقيمة 3000 ج.م',
      ],
    ),
  ];

  static const faqs = [
    FaqModel(
      id: 1,
      question: 'هل يمكنني تغيير خطتي لاحقاً؟',
      answer:
          'نعم، يمكنك الترقية في أي وقت وستُحسب الفارق تلقائياً. يمكنك أيضاً التخفيض في بداية دورة الفوترة التالية.',
    ),
    FaqModel(
      id: 2,
      question: 'هل الشهادات معترف بها؟',
      answer:
          'نعم، الشهادات معتمدة ويمكنك إضافتها لملفك المهني بعد إتمام الكورس بنجاح.',
    ),
    FaqModel(
      id: 3,
      question: 'ما طرق الدفع المتاحة؟',
      answer: 'يمكنك الدفع عبر البطاقات البنكية أو المحافظ الإلكترونية المتاحة.',
    ),
    FaqModel(
      id: 4,
      question: 'ما الفرق بين الشهري والسنوي فعلياً؟',
      answer:
          'الخطة السنوية توفّر سعراً أقل شهرياً مع كوبون خصم إضافي على الباقات.',
    ),
    FaqModel(
      id: 5,
      question: 'هل ضمان الاسترداد ساري على جميع الخطط؟',
      answer:
          'نعم، يمكنك طلب استرداد كامل بعد أول محاضرتين إذا لم تكن راضياً.',
    ),
  ];

  static const testimonials = [
    TestimonialModel(
      id: 1,
      quote:
          'بعد انتهاء البرنامج التدريبي، شعرت بتحسن كبير في مهاراتي، وأصبحت قادراً على تقديم مشاريعي، مما ساعدني في التقديم على وظائف جديدة.',
      name: 'محمود السيد',
      diploma: 'دبلومة موبايل',
      rating: 5,
    ),
    TestimonialModel(
      id: 2,
      quote:
          'بعد انتهاء البرنامج التدريبي، شعرت بتحسن كبير في مهاراتي، وأصبحت قادراً على تقديم مشاريعي، مما ساعدني في التقديم على وظائف جديدة.',
      name: 'محمود السيد',
      diploma: 'دبلومة موبايل',
      rating: 4,
    ),
    TestimonialModel(
      id: 3,
      quote:
          'بعد انتهاء البرنامج التدريبي، شعرت بتحسن كبير في مهاراتي، وأصبحت قادراً على تقديم مشاريعي، مما ساعدني في التقديم على وظائف جديدة.',
      name: 'محمود السيد',
      diploma: 'دبلومة موبايل',
      rating: 5,
    ),
  ];

  static const courseFeatures = [
    CourseFeatureModel(value: '22 ساعة', label: 'فيديو عند الطلب'),
    CourseFeatureModel(value: '8', label: 'مقالات ومصادر'),
    CourseFeatureModel(value: '47', label: 'ملف قابل للتحميل'),
    CourseFeatureModel(value: '', label: 'متاح على الجوال والويب'),
    CourseFeatureModel(value: '', label: 'شهادة إتمام معتمدة'),
  ];

  static const courseHighlights = [
    'بناء تطبيقات بـ Concurrent Rendering للأداء العالي',
    'إتقان React Server Components وفهم متى تستخدمها',
    'كتابة Custom Hooks احترافية وقابلة للإعادة',
    'إدارة الحالة المعقدة بـ Zustand و React Query',
    'اختبار المكونات بـ React Testing Library',
    'تحسين الأداء بـ Memoization وتقنيات Lazy Loading',
  ];

  static const coursePrerequisites = [
    'فهم أساسي لـ TypeScript',
    'معرفة جيدة بـ JavaScript ES6+',
    'تثبيت Node.js 20+ و VS Code',
    'خبرة سابقة مع React (6 أشهر على الأقل)',
  ];

  static const courseSections = [
    CourseSectionModel(
      title: 'مقدمة في React الحديثة',
      lessonsCount: 4,
      lessons: [
        'ما الجديد في React 19',
        'إعداد بيئة العمل',
        'هيكل المشروع الاحترافي',
        'أساسيات Concurrent Rendering',
      ],
    ),
    CourseSectionModel(
      title: 'إدارة الحالة المتقدمة',
      lessonsCount: 4,
      lessons: [
        'Zustand من الصفر',
        'React Query مع APIs',
        'أنماط الحالة المعقدة',
        'أفضل الممارسات',
      ],
    ),
    CourseSectionModel(
      title: 'الأداء والاختبارات',
      lessonsCount: 4,
      lessons: [
        'Memoization',
        'Lazy Loading',
        'Testing Library',
        'مشروع تطبيقي',
      ],
    ),
  ];

  static const courseTabs = [
    'المحتوى',
    'تقييمات الطلاب',
    'الأسئلة الشائعة',
  ];

  static const libraryTabs = [
    'الأكثر مبيعاً',
    'آخر الكورسات',
    'البرمجيات',
    'التصميم',
    'AI',
    'أمن سيبراني',
  ];

  static final sliders = [
    AssetsResource.slider1,
    AssetsResource.slider2,
    AssetsResource.slider3,
  ];

  static final techIcons = [
    AssetsResource.tech1,
    AssetsResource.tech2,
    AssetsResource.tech3,
    AssetsResource.tech4,
    AssetsResource.tech5,
    AssetsResource.tech6,
  ];

  static CourseModel courseById(int id) =>
      courses.firstWhere((c) => c.id == id, orElse: () => courses.first);

  static BundleModel bundleById(int id) =>
      bundles.firstWhere((b) => b.id == id, orElse: () => bundles.first);
}
