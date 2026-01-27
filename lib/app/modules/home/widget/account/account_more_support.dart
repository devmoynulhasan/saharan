import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/view/account/about_us.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class Account_More_Support extends StatelessWidget {
  const Account_More_Support({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: Color(0xFF0A3D3E),
          borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.to(AboutUs());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.about,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'About Us',
                        style: GoogleFonts.sourceSans3(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AssetPaths.back_icon,
                    height: 24,
                    width: 7,
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Color(0xFF215051),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                //Get.to()
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.contact_support,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Contact Support',
                        style: GoogleFonts.sourceSans3(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AssetPaths.back_icon,
                    height: 24,
                    width: 7,
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Color(0xFF215051),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetPaths.star,
                        height: 24,
                        width: 24,

                      ),
                      SizedBox(width: 10),
                      Text(
                        'Rate this App',
                        style: GoogleFonts.sourceSans3(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AssetPaths.back_icon,
                    height: 24,
                    width: 7,
                  )
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}