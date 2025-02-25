import 'package:flutter/material.dart';

// レーティングバーコンポーネント
class RatingBar extends StatefulWidget {
  // レーティングの値
  final int rating;
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
  final ValueChanged<int>? onRatingChanged;
  // アイコンのサイズ
  final double iconSize;
  // ハーフレーティングを許可するかどうか
  final bool allowHalfRating;
  // ジェスチャーを無視するかどうか
  final bool ignoreGestures;

  const RatingBar({
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
  });

  @override
  // ignore: library_private_types_in_public_api
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  // 現在のレーティング
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
          // アイコンがタップされたときの処理
          onTap: widget.ignoreGestures ? null : () {
            setState(() {
              _currentRating = widget.allowHalfRating ? (index + 0.5).toInt() : index + 1;
            });
            if (widget.onRatingChanged != null) {
              widget.onRatingChanged!(_currentRating);
            }
          },
          // アイコンの表示
          child: Icon(
            index < _currentRating ? widget.filledIcon : widget.unfilledIcon,
            color: index < _currentRating ? widget.filledColor : widget.unfilledColor,
            size: widget.iconSize,
          ),
        );
      }),
    );
  }
}