import 'package:flutter/material.dart';
import 'package:rapid_pass/views/blacklisted.dart';
import 'package:rapid_pass/views/card_registration.dart';
import 'package:rapid_pass/views/fare_chart.dart';
import 'package:rapid_pass/views/fare_map.dart';
import 'package:rapid_pass/views/fine.dart';
import 'package:rapid_pass/views/profile.dart';
import 'package:rapid_pass/views/station.dart';
import 'package:rapid_pass/views/timetable.dart';

class Category {
  final String name;
  final String icon;
  final Widget? url;
  final List<Category> subcategories;

  Category({
    required this.name,
    required this.icon,
    this.url,
    this.subcategories = const [],
  });
}

List<Category> categories = [
  Category(
    name: "কার্ড সার্ভিস",
    icon: "assets/images/category/category.png",
    subcategories: [
      Category(
        name: 'কার্ড যোগ',
        icon: "assets/images/category/card_add.png",
        url: Scaffold(
          appBar: AppBar(),
          body: const Profile(),
        ),
      ),
      Category(
        name: 'কার্ড রেজিস্ট্রেশন',
        icon: "assets/images/category/card_registration.png",
        url: const CardRegistration(),
      ),
      Category(
        name: 'কার্ড রিচার্জ',
        icon: "assets/images/category/card_recharge.png",
      ),
    ],
  ),
  Category(
    name: "মেট্রোরেল সার্ভিস",
    icon: "assets/images/category/category.png",
    subcategories: [
      Category(
        name: 'সময়সূচি',
        icon: "assets/images/category/timetable.png",
        url: const Timetable(),
      ),
      Category(
        name: 'ভাড়ার তালিকা',
        icon: "assets/images/category/fare_chart.png",
        url: const FareChart(),
      ),
      Category(
        name: 'ম্যাপ',
        icon: "assets/images/category/fare_map.png",
        url: FareMap(),
      ),
      Category(
        name: 'স্টেশন',
        icon: "assets/images/category/station.png",
        url: const Station(),
      ),
      Category(
        name: 'জরিমানা',
        icon: "assets/images/category/fine.png",
        url: const Fine(),
      ),
      Category(
        name: 'ব্ল্যাকলিস্টেড',
        icon: "assets/images/category/blacklisted.png",
        url: const Blacklisted(),
      ),
    ],
  ),
];
