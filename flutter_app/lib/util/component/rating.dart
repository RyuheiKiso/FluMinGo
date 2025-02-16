import 'package:flutter/material.dart';

// レーティングコンポーネント
class RatingComponent extends StatelessWidget {
  final int rating;
  final int maxRating;
  final ValueChanged<int> onRatingSelected;

  const RatingComponent({super.key, required this.rating, required this.maxRating, required this.onRatingSelected});

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
