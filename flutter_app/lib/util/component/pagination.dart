import 'package:flutter/material.dart';

// ページネーションコンポーネント
class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const Pagination({super.key, 
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return GestureDetector(
          onTap: () => onPageChanged(index + 1),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: index + 1 == currentPage ? Colors.blue : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }),
    );
  }
}
