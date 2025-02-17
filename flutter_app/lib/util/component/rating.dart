import 'package:flutter/material.dart';

// レーティングコンポーネント
class Rating extends StatefulWidget {
  final double rating;
  final int maxRating;
  final IconData filledIcon;
  final IconData unfilledIcon;
  final Color filledColor;
  final Color unfilledColor;
  final ValueChanged<double>? onRatingChanged; // レーティング変更コールバック

  const Rating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledIcon = Icons.star,
    this.unfilledIcon = Icons.star_border,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.onRatingChanged,
  });

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentRating = index + 1.0;
            });
            if (widget.onRatingChanged != null) {
              widget.onRatingChanged!(_currentRating);
            }
          },
          child: Icon(
            index < _currentRating ? widget.filledIcon : widget.unfilledIcon,
            color: index < _currentRating ? widget.filledColor : widget.unfilledColor,
          ),
        );
      }),
    );
  }
}
