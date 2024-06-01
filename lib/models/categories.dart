class Category {
  final String name;
  final String icon;
  final String url;
  final List<Category> subcategories;

  Category({
    required this.name,
    required this.icon,
    required this.url,
    this.subcategories = const [],
  });
}

List<Category> categories = [
  Category(
    name: "কার্ড সার্ভিস",
    icon: "assets/images/category/category.png",
    url: '',
    subcategories: [
      Category(
        name: 'কার্ড রেজিস্ট্রেশন',
        icon: "assets/images/category/card_registration.png",
        url: '',
      ),
      Category(
        name: 'কার্ড যোগ',
        icon: "assets/images/category/card_add.png",
        url: '',
      ),
      Category(
        name: 'কার্ড রিচার্জ',
        icon: "assets/images/category/card_recharge.png",
        url: '',
      ),
    ],
  ),
  Category(
    name: "মেট্রোরেল সার্ভিস",
    icon: "assets/images/category/category.png",
    url: '',
    subcategories: [
      Category(
        name: 'সময়সূচি',
        icon: "assets/images/category/timetable.png",
        url: '',
      ),
      Category(
        name: 'ভাড়া তালিকা',
        icon: "assets/images/category/fare_chart.png",
        url: '',
      ),
      Category(
        name: 'ভাড়ার ম্যাপ',
        icon: "assets/images/category/fare_map.png",
        url: '',
      ),
      Category(
        name: 'স্টেশন',
        icon: "assets/images/category/station.png",
        url: '',
      ),
      Category(
        name: 'জরিমানা',
        icon: "assets/images/category/fine.png",
        url: '',
      ),
      Category(
        name: 'ব্ল্যাকলিস্টেড',
        icon: "assets/images/category/blacklisted.png",
        url: '',
      ),
    ],
  ),
];
