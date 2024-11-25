import 'package:flutter/material.dart';

class Myscaffold {
  static showLoginScaffold(BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: SizedBox(
                                      height:
                                          150, // Set the desired height of the image
                                      child: Image.asset(
                                        "assets/Images/greeSubmit.png",
                                        fit: BoxFit
                                            .contain, // Adjust how the image scales
                                      ),
                                    ),
                                    backgroundColor: Colors
                                        .transparent, // Transparent background
                                    behavior: SnackBarBehavior
                                        .floating, // Floats the SnackBar
                                    elevation: 0, // Removes shadow
                                    padding: EdgeInsets
                                        .zero, // No extra padding around content
                                  ),
                                );
                             
  }
  static myNormalScaffold(BuildContext context,{String ?text}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text!),
      )
    );
     
  }
}

  


    