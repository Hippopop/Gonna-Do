// ignore_for_file: prefer_const_constructors, require_trailing_commas, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gonna_do/Source/Widgets/custom_dropdown_btn.dart';

class AllGonnaDoPage extends StatefulWidget {
  const AllGonnaDoPage({Key? key}) : super(key: key);

  @override
  State<AllGonnaDoPage> createState() => _AllGonnaDoPageState();
}

class _AllGonnaDoPageState extends State<AllGonnaDoPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black38,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: const Text(
                            "Total : 5",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        child: CustomDropdownButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<int>(

//                               focusColor: Colors.amber,
//                               isDense: true,
//                               //value: 2,
//                               alignment: Alignment.center,
//                               isExpanded: true,
//                               //focusColor: Colors.green,
//                               icon: const Icon(Icons.abc_outlined),
//                               items: const [
//                                 DropdownMenuItem<int>(
//                                   value: 2,
//                                   //enabled: true,
//                                   child: Text('hi'),
//                                 ),
//                                 DropdownMenuItem<int>(
//                                   child: Text('hi'),
//                                   value: 3,
//                                 ),
//                                 DropdownMenuItem<int>(
//                                   child: Text('hi'),
//                                   value: 4,
//                                 ),
//                               ],
//                               onChanged: (index) {
//                                 setState(() {});
//                               },
//                             ),
//                           ),
//                         ),

