import 'package:flutter/material.dart';

class Coffee {
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String subtitle;
  final String imageEmoji;
  final Color cardColor;

  const Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.subtitle,
    required this.imageEmoji,
    required this.cardColor,
  });
}

final List<Coffee> coffeeList = [
  Coffee(
    name: 'Cappucino',
    description: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk.',
    price: 4.53,
    rating: 4.8,
    reviewCount: 2330,
    subtitle: 'with Chocolate',
    imageEmoji: '☕',
    cardColor: Color(0xFFD4A96A),
  ),
  Coffee(
    name: 'Cappucino',
    description: 'A smooth cappuccino made with the finest oat milk, offering a creamy and slightly sweet flavor profile.',
    price: 3.90,
    rating: 4.9,
    reviewCount: 1850,
    subtitle: 'with Oat Milk',
    imageEmoji: '☕',
    cardColor: Color(0xFFB8860B),
  ),
  Coffee(
    name: 'Cappucino',
    description: 'Classic cappuccino with rich chocolate notes, expertly crafted to deliver an indulgent coffee experience.',
    price: 4.75,
    rating: 4.5,
    reviewCount: 3120,
    subtitle: 'with Chocolate',
    imageEmoji: '☕',
    cardColor: Color(0xFF8B6914),
  ),
  Coffee(
    name: 'Cappucino',
    description: 'A refreshing cappuccino variant using premium oat milk for a lighter, creamier taste.',
    price: 3.90,
    rating: 4.0,
    reviewCount: 980,
    subtitle: 'with Oat Milk',
    imageEmoji: '☕',
    cardColor: Color(0xFF2E7D52),
  ),
  Coffee(
    name: 'Machiato',
    description: 'An espresso-based drink with a dollop of steamed milk foam. Bold, rich espresso with just a touch of creamy milk.',
    price: 3.50,
    rating: 4.7,
    reviewCount: 1560,
    subtitle: 'with Caramel',
    imageEmoji: '☕',
    cardColor: Color(0xFFC0914F),
  ),
  Coffee(
    name: 'Latte',
    description: 'A smooth, creamy coffee made with one-third espresso and two-thirds steamed milk.',
    price: 4.20,
    rating: 4.6,
    reviewCount: 2100,
    subtitle: 'with Vanilla',
    imageEmoji: '☕',
    cardColor: Color(0xFFB07640),
  ),
];

final List<String> categories = [
  'Cappuccino',
  'Machiato',
  'Latte',
  'Americano',
];
