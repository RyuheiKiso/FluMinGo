import 'package:flutter/material.dart';

// アバターコンポーネント
class AvatarComponent extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const AvatarComponent({super.key, required this.imageUrl, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: radius,
    );
  }
}