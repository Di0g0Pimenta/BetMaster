import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  ReusableWidget({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 64,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 382,
              height: 64,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 5, color: Color(0xFFFF5370)),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
          ),
          Positioned(
            left: 7,
            top: 23,
            child: Container(
              height: 18.29,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
