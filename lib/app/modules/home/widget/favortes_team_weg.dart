import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/widget_controller/favorites_team_controller.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class FavoriteTeam extends StatelessWidget {
   FavoriteTeam({
    super.key,
  });

  final FavoritesTeamController controller = Get.put( FavoritesTeamController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Your favorite teams",
                 style: GoogleFonts.sourceSans3(
                  color: Colors.white,
                  fontSize: 20,
                   fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Favourite_Favorite_Team(),


          SizedBox(height: 20,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your may also like",
                style:GoogleFonts.sourceSans3(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
              ) ,),
              SizedBox(height: 22,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.selectLeague(0),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 0
                              ? Color(0xFFF6F978)
                              : Color(0xFF0a3d3e),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Premier League",
                              style: TextStyle(
                                color: controller.selectedIndex.value == 0
                                    ? Colors.black
                                    : Color(0xFF68B5B6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    GestureDetector(
                      onTap: () => controller.selectLeague(1),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 1
                              ? Color(0xFFF6F978)
                              : Color(0xFF0a3d3e),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Champions League",
                              style: TextStyle(
                                color: controller.selectedIndex.value == 1
                                    ? Colors.black
                                    : Color(0xFF68B5B6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    GestureDetector(
                      onTap: () => controller.selectLeague(2),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 2
                              ? Color(0xFFF6F978)
                              : Color(0xFF0a3d3e),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "LaLiga",
                              style: TextStyle(
                                color: controller.selectedIndex.value == 2
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                ),
              ),

              SizedBox(height: 12 ,),

            ],
          ),

        ],
      ),
    );
  }
}




class Favourite_Favorite_Team extends StatelessWidget {
  const Favourite_Favorite_Team({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // First Card
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xFF0a3d3e),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Image.asset(
                        AssetPaths.brington,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Color(0xFFF6F978),
                      size: 28,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Brington",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),

          // Second Card
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xFF0a3d3e),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                       // color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Image.asset(
                        AssetPaths.arsenal,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Color(0xFFF6F978),
                      size: 28,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Brington",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),

          // Third Card
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xFF0a3d3e),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                       // color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Image.asset(
                        AssetPaths.liverpool,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Color(0xFFF6F978),
                      size: 28,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Brington",
                  style: GoogleFonts.sourceSans3(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}