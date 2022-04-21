import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gonna_do/Source/View/AllGonnaDoPage/all_gonna_do.dart';



class LandscapeHome extends StatefulWidget {
  const LandscapeHome({Key? key}) : super(key: key);

  @override
  State<LandscapeHome> createState() => _LandscapeHomeState();
}

class _LandscapeHomeState extends State<LandscapeHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    String image =
        "https://images.unsplash.com/photo-1649208544383-cafc52bc48f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60";
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                width: double.infinity,
                                child: FittedBox(
                                  child: Badge(
                                    ignorePointer: true,
                                    elevation: 8,
                                    stackFit: StackFit.passthrough,
                                    badgeContent: const Text(
                                      '10',
                                    ),
                                    child: CircleAvatar(
                                      //maxRadius: 500,
                                      backgroundColor: const Color.fromARGB(64, 0, 0, 0),
                                      foregroundImage: NetworkImage(
                                        image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 5,
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Mostafijul Islam',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'mostafijul@gmail.com',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(83, 0, 0, 0),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(87, 0, 0, 0),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 8,
            child: AllGonnaDoPage(),
          ),
        ],
      ),
    );
  }
}

