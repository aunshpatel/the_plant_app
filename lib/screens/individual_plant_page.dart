import 'package:flutter/material.dart';
import 'package:the_plant_app/screens/widgets/consts.dart';
import '../models/plant.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({super.key});

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  int selectedPlantSize = -1;

  @override
  Widget build(BuildContext context) {
    final Plant plant = ModalRoute.of(context)!.settings.arguments as Plant;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(plant.imageUrl),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(plant.name, style: const TextStyle(fontSize: 24)),
                Row(
                  children: [
                    Text(plant.price, style: const TextStyle(fontSize: 24)),
                    Text(plant.priceUnit, style: const TextStyle(fontSize: 24)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0XFFFFD700)),
                Text(plant.rating, style: kGoldTextStyle,)
              ],
            ),
            const SizedBox(height: 18),
            const Text('Choose Size', style: kHeaderStyle,),
            const SizedBox(height: 8),
            Container(
              height: 50,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plant.availableSize.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: selectedPlantSize == index ? kSelectedPlantSizeButton : kUnselectedPlantSizeButton,
                            child:MaterialButton(
                              onPressed: () {
                                print(plant.availableSize[index]);
                                setState(() {
                                  selectedPlantSize = index;
                                });
                              },
                              child: Text('${plant.availableSize[index].toString()} ${plant.unit}', style: selectedPlantSize == index ? kSelectedPlantSizeText : kUnselectedPlantSizeText,),
                            ),
                          ),
                        )
                    );
                  }
                )
              ),
            ),
            const SizedBox(height: 18),
            const Text('Description', style: kHeaderStyle,),
            const SizedBox(height: 8),
            Text(plant.description),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.favorite_border, size: 50,),
                    )
                ),
                Container(
                  decoration: kSelectedPlantSizeButton,
                  width: 200,
                  child:MaterialButton(
                    onPressed: null,
                    child: Text('Add to cart', style: kSelectedPlantSizeText,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class PlantDetailPage extends StatelessWidget {
//
// }
