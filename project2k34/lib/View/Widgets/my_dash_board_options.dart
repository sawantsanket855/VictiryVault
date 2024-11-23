
import 'package:flutter/material.dart';
import 'package:project2k34/View/Player_information.dart';

class mydashBoardOption extends StatefulWidget {
   String HeaderValue;
   mydashBoardOption({super.key,required this.HeaderValue});

  @override
  State<mydashBoardOption> createState() => _mydashBoardOptionState();
}

class _mydashBoardOptionState extends State<mydashBoardOption> {
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap:(){
       Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return PlayerInformation();
        })
       );
      },
      child: Container(
                    padding:  const EdgeInsets.only(left: 20),
                    // color: Colors.amber,
                    margin:  const EdgeInsets.only(top: 20),
                    child:  Row(
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${widget.HeaderValue}",
      
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
    );
  }
}