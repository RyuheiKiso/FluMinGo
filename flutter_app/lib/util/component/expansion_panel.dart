import 'package:flutter/material.dart';

// エクスパンションパネルコンポーネント
class CustomExpansionPanel extends StatefulWidget {
  final int initialItemCount;
  final Color headerBackgroundColor;
  final Color bodyBackgroundColor;

  const CustomExpansionPanel({
    super.key,
    this.initialItemCount = 5,
    this.headerBackgroundColor = Colors.transparent,
    this.bodyBackgroundColor = Colors.transparent,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomExpansionPanelState createState() => _CustomExpansionPanelState();
}

class _CustomExpansionPanelState extends State<CustomExpansionPanel> {
  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = generateItems(widget.initialItemCount);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(child: _buildPanel()));
  }

  // パネルを構築するウィジェット
  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children:
          _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              // ヘッダーのビルダー
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  color: widget.headerBackgroundColor,
                  child: ListTile(title: Text(item.headerValue)),
                );
              },
              // ボディのビルダー
              body: Container(
                color: widget.bodyBackgroundColor,
                child: ListTile(
                  title: Text(item.expandedValue),
                  subtitle: Text(
                    'To delete this panel, tap the trash can icon',
                  ),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      _data.removeWhere((currentItem) => item == currentItem);
                    });
                  },
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
    );
  }
}

// エクスパンションパネルのアイテムクラス
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

// アイテムを生成する関数
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
