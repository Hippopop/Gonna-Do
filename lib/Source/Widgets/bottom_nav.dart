import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key, required this.tabList}) : super(key: key);
  final List<Widget> tabList;
  @override
  _BottomTabState createState() => _BottomTabState();
}

int _index = 1;
late PageController _screenController;

class _BottomTabState extends State<BottomTab> {
  @override
  void initState() {
    super.initState();
    _screenController = PageController(initialPage: _index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_index == 0)
            ? AppLocalizations.of(context)!.appTitle
            : AppLocalizations.of(context)!.account),
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        buttons: <BarButton>[
          BarButton(
            icon: const Icon(Icons.account_circle_sharp),
            stat: _index == 0,
            label: "Home",
            onPressed: () {
              setState(() => _index = 0);
              _screenController.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
          BarButton(
            icon: const Icon(Icons.access_alarm),
            stat: _index == 1,
            label: "Alargy",
            onPressed: () {
              setState(() => _index = 1);
              _screenController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox.expand(
            child: PageView(
              controller: _screenController,
              onPageChanged: (_page) {
                setState(() {
                  _index = _page;
                });
              },
              children: widget.tabList,
            ),
          );
        },
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  final double margin = 5;

  final List<BarButton> buttons;
  List<Widget> _buttonOrganizer() {
    const double width = 57;
    final int len = buttons.length;
    final List<Widget> final_list = [];
    int _counter = 0;
    while (_counter < len) {
      if (_counter == (len / 2)) {
        final_list.add(
          SizedBox(
            width: width + margin * 2,
          ),
        );
      }
      final_list.add(buttons[_counter]);
      _counter++;
    }
    return final_list;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _list = _buttonOrganizer();
    return BottomAppBar(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      notchMargin: margin,
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Container(
          clipBehavior: Clip.hardEdge,
          // padding: const EdgeInsets.symmetric(vertical: 6),
          height: 64,
          decoration: BoxDecoration(
            color: Colors.green[600],
            borderRadius: BorderRadius.circular(10),
          ),
          child: SafeArea(
            child: Row(
              children: _list,
            ),
          ),
        ),
      ),
    );
  }
}

///The class that creates the buttons.
class BarButton extends StatelessWidget {
  const BarButton({
    Key? key,
    required this.icon,
    required this.stat,
    required this.onPressed,
    this.label,
  }) : super(key: key);

  final Icon icon;
  final bool stat;
  final VoidCallback onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(stat ? 10 : 0),
          splashColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: stat ? Colors.yellow : null,
              borderRadius: BorderRadius.circular(stat ? 10 : 0),
            ),
            padding: const EdgeInsets.all(2),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: FittedBox(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: icon,
                            ),
                          ),
                        ),
                        if (stat)
                          const SizedBox(
                            width: 8,
                          ),
                        if (stat)
                          AnimatedOpacity(
                            opacity: stat ? 1 : 0,
                            duration: const Duration(seconds: 2),
                            child: Text("$label"),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Expanded(
//     flex: 6,
//     child: Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: SizedBox(
//         //height: double.infinity,
//         //width: double.infinity,
//         child: FittedBox(
//           fit: BoxFit.cover,
//           child: widget.icon,
//         ),
//       ),
//     ),
//   ),
//   const Spacer(),
//   Expanded(
//     flex: !widget.stat ? 4 : 2,
//     child: AnimatedCrossFade(
//       duration: const Duration(milliseconds: 1000),
//       crossFadeState: widget.stat
//           ? CrossFadeState.showSecond
//           : CrossFadeState.showFirst,
//       firstChild: (widget.label == null)
//           ? Container()
//           : SizedBox.expand(
//               child: FittedBox(
//                 child: Center(
//                   child: Text(
//                     "${widget.label}",
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w500, fontSize: 14),
//                   ),
//                 ),
//               ),
//             ),
//       secondChild: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.black,
//             shape: BoxShape.circle,
//           ),
//         ),
//       ),
//     ),
//   )

//Last one with simpler structure
//  Expanded(
//       child: FittedBox(fit: BoxFit.none, child: widget.icon)),
//   SizedBox(
//     height: 5,
//   ),
//   Expanded(
//       child: Center(
//     child: AnimatedCrossFade(
//       firstCurve: Curves.easeInSine,
//       secondCurve: Curves.easeOutSine,
//       sizeCurve: Curves.easeOutSine,
//       duration: Duration(milliseconds: 400),
//       crossFadeState: stat
//           ? CrossFadeState.showFirst
//           : CrossFadeState.showSecond,
//       firstChild: Text(
//         '${widget.label ?? ''}',
//         style:
//             TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//       ),
//       secondChild: Container(
//         height: 8,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           shape: BoxShape.circle,
//         ),
//       ),
//       layoutBuilder:
//           (topChild, topChildKey, bottomChild, bottomChildKey) =>
//               Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: <Widget>[
//           Positioned(
//             key: bottomChildKey,
//             // left: 0.0,
//             // top: 0.0,
//             // right: 0.0,
//             child: bottomChild,
//           ),
//           Positioned(
//             // left: 0.0,
//             // top: 0.0,
//             // right: 0.0,
//             key: topChildKey,
//             child: topChild,
//           ),
//         ],
//       ),
//     ),
//   ))
