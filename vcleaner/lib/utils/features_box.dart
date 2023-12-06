import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FeatureBox extends StatelessWidget {
  final String featureName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;

  const FeatureBox({
    super.key,
    required this.featureName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn?Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(9)
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon 
            Image.asset(
              iconPath,
              height:65,
              color: powerOn? Colors.white : Colors.black,),
              
      
            // Feature + Switch

            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text(
                    featureName,
                    style: TextStyle(
                      color: powerOn? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                )),
                Transform.rotate(
                  angle:3*pi/2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                    ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}