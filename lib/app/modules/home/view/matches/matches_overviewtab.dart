import 'package:flutter/material.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF0A3D3E),
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.premier_league,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('Premier League',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.match_delels_clender,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('7th Jan 2026, 02:00 PM',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.match_delels_emirates,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('Emirates Stadium, London, England',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF0A3D3E),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('League Position',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.premier_league,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('Premier League',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.match_delels_clender,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('7th Jan 2026, 02:00 PM',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.match_delels_emirates,height: 24,width: 24,),
                      SizedBox(width: 15,),
                      Text('Emirates Stadium, London, England',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}