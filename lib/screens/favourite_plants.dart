import 'package:flutter/material.dart';
import 'package:the_plant_app/screens/widgets/consts.dart';
class FavouritePlants extends StatefulWidget {
  const FavouritePlants({super.key});

  @override
  State<FavouritePlants> createState() => _FavouritePlantsState();
}

class _FavouritePlantsState extends State<FavouritePlants> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favouritePlantList.length,
      itemBuilder: (context, index) {
        final plant = favouritePlantList[index];
        return ListTile(
          title: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height:140,
                    width: 155,
                    child: Stack(
                      alignment: Alignment.bottomCenter, // Align contents of stack to the bottom
                      children: [
                        Container(
                          height: 90,
                          width: 155,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(64, 196, 255, 0.9), // Start color
                                Color.fromRGBO(64, 196, 255, 0.4), // End color
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          // height: 150,
                          width: 155,
                          child: Image.network(plant.imageUrl),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                              alignment: Alignment.bottomRight,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: isPlantFavourite == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red,),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(plant.name, style: kTextTitleStyle,),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0XFFFFD700)),
                            Text(plant.rating, style: kGoldTextStyle,)
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${plant.displaySize} '),
                        Text(plant.unit),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${plant.price} '),
                        Text(plant.priceUnit),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/plant', arguments: plant);
          },
        );
      },
    );
  }
}
