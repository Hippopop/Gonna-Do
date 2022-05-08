import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({Key? key}) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late bool _isOpened;
  late GlobalKey _mainBox;
  late double _height, _width, _xPos, _yPos;
  late final OverlayEntry overlay;
  @override
  void initState() {
    super.initState();
    _isOpened = false;
    _mainBox = LabeledGlobalKey('main_box');
    overlay = _gettingOverlay();
  }

  void _findBoxPosition() {
    _height = _mainBox.currentContext!.size!.height;
    _width = _mainBox.currentContext!.size!.width;

    final RenderBox? renderObject =
        _mainBox.currentContext!.findRenderObject() as RenderBox?;
    final Offset offset = renderObject!.localToGlobal(Offset.zero);
    _xPos = offset.dx;
    _yPos = offset.dy;
    print(
        "$_height,$_width, ${renderObject.size.height},${renderObject.size.width}");
  }

  OverlayEntry _gettingOverlay() {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: _xPos,
        width: _width,
        top: _yPos + _height,
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 16,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: _height * 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _mainBox,
      onTap: () {
        setState(() {
          if (_isOpened = !_isOpened) {
            //Positioning method;
            _findBoxPosition();

            //Getting the overlay.
            Overlay.of(context)!.insert(overlay);
          } else {
            overlay.remove();
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Center(
              child: FittedBox(
                child: Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: FittedBox(
                child: Text(
                  "Filter",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
