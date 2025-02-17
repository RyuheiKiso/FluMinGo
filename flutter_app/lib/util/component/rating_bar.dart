import 'package:flutter/material.dart';

// レーティングバーコンポーネント
class RatingBar extends StatefulWidget {
  final int rating;
  final int maxRating;
  final IconData filledIcon;
  final IconData unfilledIcon;
  final Color filledColor;
  final Color unfilledColor;
  final ValueChanged<int>? onRatingChanged; // レーティング変更コールバック

  const RatingBar({
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
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late int _currentRating;

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
              _currentRating = index + 1;
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