import 'package:flutter/material.dart';

// ドロップダウンコンポーネント
// 概要: ジェネリック型のドロップダウンメニューを提供するコンポーネント
// 目的: ユーザーが選択肢から値を選ぶためのUIを提供
// 使用方法: DropdownComponent(
//   items: [DropdownMenuItem(value: 'value1', child: Text('Value 1'))],
//   value: 'value1',
//   onChanged: (newValue) { ... },
// )
class DropdownComponent<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final Widget? hint;
  final bool isExpanded;
  final double iconSize;

  // コンストラクタ
  const DropdownComponent({
    super.key,
    required this.items,
    this.value,
    required this.onChanged,
    this.hint,
    this.isExpanded = false,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      hint: hint,
      isExpanded: isExpanded,
      iconSize: iconSize,
    );
  }
}

// カスタムドロップダウン
// 概要: 固定の選択肢を持つドロップダウンメニューを提供するコンポーネント
// 目的: ユーザーが選択肢から値を選ぶためのUIを提供
// 使用方法: CustomDropdown();
class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // ドロップダウンの選択値
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(height: 2, color: Colors.deepPurpleAccent),
      // 値が変更されたときの処理
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:
          <String>['One', 'Two', 'Three', 'Four'].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            },
          ).toList(),
    );
  }
}
