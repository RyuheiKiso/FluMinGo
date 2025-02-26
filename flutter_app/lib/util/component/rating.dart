import 'package:flutter/material.dart';

// レーティングコンポーネント
class Rating extends StatefulWidget {
  // レーティングの値
  final double rating;
  // 最大レーティング
  final int maxRating;
  // 塗りつぶされたアイコン
  final IconData filledIcon;
  // 塗りつぶされていないアイコン
  final IconData unfilledIcon;
  // 塗りつぶされたアイコンの色
  final Color filledColor;
  // 塗りつぶされていないアイコンの色
  final Color unfilledColor;
  // レーティング変更コールバック
  final ValueChanged<double>? onRatingChanged;
  // アイコンのサイズ
  final double iconSize;
  // ハーフレーティングを許可するかどうか
  final bool allowHalfRating;
  // ジェスチャーを無視するかどうか
  final bool ignoreGestures;
  // アイコンの間隔
  final double iconSpacing;
  // レーティングのラベル
  final String? ratingLabel;
  // レーティングのアニメーションの有効/無効
  final bool enableAnimation;

  const Rating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledIcon = Icons.star,
    this.unfilledIcon = Icons.star_border,
    this.filledColor = Colors.amber,
    this.unfilledColor = Colors.grey,
    this.onRatingChanged,
    this.iconSize = 24.0,
    this.allowHalfRating = false,
    this.ignoreGestures = false,
    this.iconSpacing = 4.0,
    this.ratingLabel,
    this.enableAnimation = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  // 現在のレーティング
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.ratingLabel != null) Text(widget.ratingLabel!),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.maxRating, (index) {
            return GestureDetector(
              // アイコンがタップされたときの処理
              onTap:
                  widget.ignoreGestures
                      ? null
                      : () {
                        setState(() {
                          _currentRating =
                              widget.allowHalfRating
                                  ? index + 0.5
                                  : index + 1.0;
                        });
                        if (widget.onRatingChanged != null) {
                          widget.onRatingChanged!(_currentRating);
                        }
                      },
              // アイコンの表示
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.iconSpacing / 2,
                ),
                child: Icon(
                  index < _currentRating
                      ? widget.filledIcon
                      : widget.unfilledIcon,
                  color:
                      index < _currentRating
                          ? widget.filledColor
                          : widget.unfilledColor,
                  size: widget.iconSize,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
