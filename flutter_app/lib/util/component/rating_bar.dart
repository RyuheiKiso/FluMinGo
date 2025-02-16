import 'package:flutter/material.dart';

// レーティングバーコンポーネント
class RatingBarComponent extends StatelessWidget {
  final int rating;
  final int maxRating;
  final ValueChanged<int> onRatingSelected;

  const RatingBarComponent({super.key, required this.rating, required this.maxRating, required this.onRatingSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
          ),
          onPressed: () => onRatingSelected(index + 1),
        );
      }),
    );
  }
}