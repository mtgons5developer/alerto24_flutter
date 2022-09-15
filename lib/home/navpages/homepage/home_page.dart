import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "Home Page",
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       elevation: 0,
  //       backgroundColor: Colors.white,
  //     ),
  //     body: Container(
  //       child: Center(
  //         child: Text(
  //           "Home Page",
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Column(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 45, bottom: 15),
  //         padding: EdgeInsets.only(left: 20, right: 20),
  //         child: Container(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 children: [
  //                   BigText(text: "Philippines", color: Colors.blue),
  //                   Row(
  //                     children: [
  //                       SmallText(text: "City", color: Colors.black),
  //                       Icon(Icons.arrow_drop_down_rounded)
  //                     ],
  //                   )
  //                 ],
  //               ),
  //               Center(
  //                   child: Container(
  //                 width: 45,
  //                 height: 45,
  //                 child: Icon(Icons.search, color: Colors.white),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(15),
  //                   color: Colors.blue,
  //                 ),
  //               ))
  //             ],
  //           ),
  //         ),
  //       ),
  //       TikTokVideos(),
  //     ],
  //   ));
  // }
