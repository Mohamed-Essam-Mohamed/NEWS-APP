import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAnimationTab extends StatelessWidget {
  const LoadingAnimationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Row(
        children: [
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 207, 207, 207),
            highlightColor: const Color.fromARGB(255, 255, 255, 255),
            child: Container(
              margin: const EdgeInsets.only(
                top: 15,
                left: 8,
                right: 8,
              ),
              padding: const EdgeInsets.all(10),
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
      itemCount: 5,
    );
  }
}
