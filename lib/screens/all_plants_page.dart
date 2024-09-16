import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_plant_app/screens/widgets/consts.dart';
import 'package:the_plant_app/screens/widgets/placeholders.dart';
import '../blocs/plant_bloc.dart';
import 'package:shimmer/shimmer.dart';

class AllPlantsPage extends StatefulWidget {
  const AllPlantsPage({super.key});

  @override
  State<AllPlantsPage> createState() => _AllPlantsPageState();
}

class _AllPlantsPageState extends State<AllPlantsPage> {
  bool isSearchBoxOpen = false;
  TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Plants'),
        actions: [
          !isSearchBoxOpen ? IconButton(
            onPressed: () {
              setState(() {
                isSearchBoxOpen = true;
              });
            },
            icon: Icon(Icons.search),
          ) : Padding(
            padding: EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: searchBarController,
                      keyboardType: TextInputType.name,
                      onChanged:(value){ },
                      decoration: InputDecoration(hintText: 'Search'),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isSearchBoxOpen = false;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
      body: BlocBuilder<PlantBloc, PlantState>(
        builder: (context, state) {
          if (state is PlantLoading) {
            return Center(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: const SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BannerPlaceholder(),
                        TitlePlaceholder(width: double.infinity),
                        SizedBox(height: 16.0),
                        ContentPlaceholder(
                          lineType: ContentLineType.threeLines,
                        ),
                        SizedBox(height: 16.0),
                        TitlePlaceholder(width: 200.0),
                        SizedBox(height: 16.0),
                        ContentPlaceholder(
                          lineType: ContentLineType.twoLines,
                        ),
                        SizedBox(height: 16.0),
                        TitlePlaceholder(width: 200.0),
                        SizedBox(height: 16.0),
                        ContentPlaceholder(
                          lineType: ContentLineType.twoLines,
                        ),
                      ],
                    ),
                  )),
            );
          } else if (state is PlantLoaded) {
            final plants = state.plants;
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
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
                                      child: const Center(
                                        child: Icon(Icons.favorite_border),
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
          } else if (state is PlantError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}