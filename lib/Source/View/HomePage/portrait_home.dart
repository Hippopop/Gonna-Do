import 'package:flutter/material.dart';
import 'package:gonna_do/Source/View/AllGonnaDoPage/all_gonna_do.dart';
import 'package:gonna_do/Source/View/ProfilePage/profile_page.dart';
import 'package:gonna_do/Source/Widgets/bottom_nav.dart';



class PortraitHome extends StatefulWidget {
  @override
  State<PortraitHome> createState() => _PortraitHomeState();
}

class _PortraitHomeState extends State<PortraitHome> {
  // int _currentPageIndex = 0;

  // late PageController _page;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _page = PageController();
  //   // _page.addListener(() {
  //   //   setState(() {});
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return const BottomTab(tabList: [ProfilePage(), AllGonnaDoPage()]);
  }
}




/// Bottom Navy Bar setup

// bottomNavigationBar: BottomNavyBar(
//         //backgroundColor: Colors.blue[400],
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         selectedIndex: _currentPageIndex,
//         iconSize: 26,
//         showElevation: true,
        
//         items: [
//           BottomNavyBarItem(
//             title: Text('''Gonna Do's'''),
//             icon: Icon(Icons.list_alt_rounded),
//             textAlign: TextAlign.center,
//           ),
//           BottomNavyBarItem(
//             title: Text('My Profile'),
//             icon: Icon(Icons.account_circle),
//             textAlign: TextAlign.center,
//           ),
//         ],
//         onItemSelected: (index) {
//           setState(() => _currentPageIndex = index);
//           //_page.jumpToPage(index);
//           _page.animateToPage(index,
//               duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
//         },
//       ),





// SizedBox.expand(
//         child: PageView(
//           //physics: PageScrollPhysics(parent: ),
//           controller: _page,
//           onPageChanged: (index) {
//             //print(index);
//             setState(() {
//               _currentPageIndex = index;
//             });
//           },
//           children: [
//             AllGonnaDoPage(),
//             ProfilePage(),
//           ],
//         ),
//       ),
