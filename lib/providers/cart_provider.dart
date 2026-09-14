import 'package:flutter/material.dart';
import 'package:instantplus/mixins/safe_notifier_mixin.dart';
import 'package:instantplus/resources/models.dart';
import 'package:instantplus/reusable_components/toast.dart';

class CartItem {
  final CourseModel? course;
  final BundleModel? bundle;

  const CartItem.course(this.course) : bundle = null;
  const CartItem.bundle(this.bundle) : course = null;

  String get title => course?.title ?? bundle?.title ?? '';
  String get price => course?.price ?? bundle?.price ?? '';
  String get image => course?.image ?? bundle?.image ?? '';
  String get subtitle =>
      course != null ? 'كورس' : 'حزمة · ${bundle?.coursesCount ?? ''}';
}

class CartProvider with ChangeNotifier, SafeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get count => _items.length;

  void addCourse(CourseModel course) {
    if (_items.any((e) => e.course?.id == course.id)) {
      showToast('الكورس موجود بالفعل في السلة');
      return;
    }
    _items.add(CartItem.course(course));
    notifyListeners();
    showToast('تمت إضافة الكورس إلى السلة');
  }

  void addBundle(BundleModel bundle) {
    if (_items.any((e) => e.bundle?.id == bundle.id)) {
      showToast('الحزمة موجودة بالفعل في السلة');
      return;
    }
    _items.add(CartItem.bundle(bundle));
    notifyListeners();
    showToast('تمت إضافة الحزمة إلى السلة');
  }

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
