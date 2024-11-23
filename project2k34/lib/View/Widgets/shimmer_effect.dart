import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FullScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 241, 240, 240)!,
      highlightColor: const Color.fromARGB(255, 228, 228, 228)!,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        itemCount: 10, // Number of shimmer items
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            height: 100, // Height of each shimmer block
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}