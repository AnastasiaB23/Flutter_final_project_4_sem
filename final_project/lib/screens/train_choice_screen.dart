import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:practice6/screens/train_exercises_screen.dart';

String URLs(int number) {
  switch (number) {
    case 1:
      return "https://i.artfile.ru/2560x1600_1329959_[www.ArtFile.ru].jpg";
    case 2:
      return "https://www.bodybuildingbyjohn.com/wp-content/uploads/2016/10/Yoga-Benefits-for-Men.jpg";
    default:
      return "URL didn't found(";
  }
}

CachedNetworkImage _cachedNetworkImage(int number) {
  return CachedNetworkImage(
    imageUrl: URLs(number),
    errorWidget: (context, url, error) => const Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    ),
  );
}

class TrainChoiceScreen extends StatelessWidget {
  const TrainChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrainExercisesScreen(female: true,)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: _cachedNetworkImage(1),
                ),
                Text('Для девушек', style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.longestSide/40, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrainExercisesScreen(female: false,)));
            },
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: _cachedNetworkImage(2),
                ),
                Text('Для мужчин', style: TextStyle(color: Colors.black, fontWeight:  FontWeight.bold, fontSize: MediaQuery.of(context).size.longestSide/40,),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
