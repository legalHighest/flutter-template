import 'package:flutter/material.dart';
import 'package:flutter_template_v3/common/constant.dart';
import 'package:flutter_template_v3/generated/l10n.dart';
import 'package:flutter_template_v3/page/home/index.dart';
import 'package:flutter_template_v3/page/mine/mine.dart';
import 'package:flutter_template_v3/page/submission/submission.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> items = [];

  /// 控制器
  final PageController _controller = PageController(initialPage: 0);

  /// views
  List<Widget> views = [
    const IndexPage(),
    const SubmissionPage(),
    const MinePage()
  ];

  /// 当前选中的tab index
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    items = [
      {
        "label": S.current.index,
        "selected_icon": "images/shouye_selected.png",
        "unselected_icon": "images/shouye_unselect.png"
      },
      {
        "label": S.current.submission,
        "selected_icon": "images/tougao_selected.png",
        "unselected_icon": "images/tougao_unselect.png"
      },
      {
        "label": S.current.mine,
        "selected_icon": "images/wode_selected.png",
        "unselected_icon": "images/wode_unselect.png"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _curIndex = index;
          setState(() {});
          _controller.jumpToPage(index);
        },
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        // 未选中的文字样式
        unselectedItemColor: Colors.black,
        selectedItemColor: Constant.mainColor,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: items.map((e) {
          return BottomNavigationBarItem(
              icon: Image.asset(
                e['unselected_icon'],
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                e['selected_icon'],
                width: 24,
                height: 24,
              ),
              label: e['label']);
        }).toList(),
      ),
      body: PageView(
        controller: _controller,

        /// 禁止横向滑动
        physics: const NeverScrollableScrollPhysics(),
        children: views,
      ),
    );
  }
}
