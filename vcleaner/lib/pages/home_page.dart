import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcleaner/pages/video_page.dart';
import 'package:vcleaner/utils/features_box.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Padding Constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  //Smart Features List

  List mySmartDevices = [
    // [Name , Icon path, powerStatus]
  ['Mapping', 'lib/icons/icons8-map-48.png', false],
  ['Clean', 'lib/icons/icons8-clean-48.png', false],
  ['Navigate', 'lib/icons/nav.png', false],
  ['Dock', 'lib/icons/return.png', false],
  ];

  // power button changed

  void powerSwitchChanged(bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
      for (int i=0; i< 4; i++){
        if ( i == index){
          continue;
        }
        else{
          mySmartDevices[i][2] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            //custom AppBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal:horizontalPadding, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],),
              
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()));
                    },
                    child: Icon(
                      Icons.video_camera_back,
                      size: 60,
                      color: Colors.grey[800],),
                  )
                ],
              ),
            ),

            //Welcome Home
            const SizedBox(height:20),        

            

             Padding(
              padding: const EdgeInsets.symmetric(horizontal:40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome To', style: TextStyle(fontSize: 20,color: Colors.grey[700] ),),
                  Text('vCleaner', style: GoogleFonts.bebasNeue(fontSize: 72, ),),
                ],
              ),
            ),

            //Smart Devices Grid
          //const SizedBox(height:10), 

          Padding(
            padding: EdgeInsets.symmetric(horizontal:horizontalPadding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 2,
            ),
          ),
          const SizedBox(height:10),

          Padding(                
            padding: EdgeInsets.only(
              left: horizontalPadding,
              right:horizontalPadding,
              top: verticalPadding),
            child: Text('Features', style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, color: Colors.grey[800]),),
          ),


          Expanded(child: 
            GridView.builder(
              itemCount: mySmartDevices.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom:25, left: 25, right:25),
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                childAspectRatio: 1/1.2),
               
               itemBuilder:(context, index) {
                 return FeatureBox(
                  featureName: mySmartDevices[index][0],
                  iconPath:mySmartDevices[index][1] ,
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index));
                 
               }, ))      

          ],
        ),
      ),
    );
  }
}