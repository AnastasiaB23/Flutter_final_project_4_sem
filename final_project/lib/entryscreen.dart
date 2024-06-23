import 'package:flutter/cupertino.dart';
import 'package:practice6/screens/weather_screen.dart';
import 'package:practice6/shared_preferences_service.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:practice6/screens/todo_preview_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/first_screen.dart';


// class EntryScreenModel with ChangeNotifier {
//   Widget _currentWidgetIndex = StartMenu();
//
//   Widget get currentWidgetIndex => _currentWidgetIndex;
//
//   void changeWidget(Widget index) {
//     _currentWidgetIndex = index;
//     notifyListeners();
//   }
// }


SizedBox _sizedBoxBetween({double height = 10}){
  return SizedBox(
    height: height,
    );
}



class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();


}

ButtonStyle _buttonStyle(){
  return TextButton.styleFrom(
    surfaceTintColor: Colors.pinkAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  );
}

TextStyle _textStyle(){
  return TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.9),
  );
}


// // Вторичный экран
// class SecondaryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Вторичный экран"),
//       ),
//       body: ChangeNotifierProvider(
//         create: (context) => SecondaryScreenModel(),
//         child: Consumer<SecondaryScreenModel>(
//           builder: (context, model, child) {
//             return Column(
//               children: [
//                 // Кнопки для переключения виджетов
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => model.changeWidget(0),
//                       child: Text("Виджет 1"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => model.changeWidget(1),
//                       child: Text("Виджет 2"),
//                     ),
//                   ],
//                 ),
//                 // Вывод выбранного виджета
//                 Expanded(
//                   child: IndexedStack(
//                     index: model.currentWidgetIndex,
//                     children: [
//                       Widget1(),
//                       Widget2(),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
class _EntryScreenState extends State<EntryScreen> {


  @override
  Widget build(BuildContext context) {
    return entryScreen();

      // body: startMenu(),
      // appBar: AppBar(
      //   title: Text('Мой путь',
      //   style: TextStyle(
      //     fontSize: 40,
      //     fontStyle: FontStyle.italic,
      //   ),
      //   ),
      // ),
      // body: ChangeNotifierProvider(
      //   create: (context) => EntryScreenModel(),
      //   child: Consumer<EntryScreenModel>(
      //     builder: (context, model, child) {
      //       return model._currentWidgetIndex;
              // Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              //   Text('Погнали!',
              //     style: _textStyle(),),
              //   // Кнопки для переключения виджетов
              //   // Row(
              //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   //   children: [
              //   ElevatedButton(
              //     onPressed: () => model.changeWidget(1),
              //     child: Text("Начать"),
              //   ),
              //   ElevatedButton(
              //     onPressed: () => model.changeWidget(2),
              //     child: Text("Настройки"),
              //   ),
                // ],
                // ),
                // Вывод выбранного виджета
                // Expanded(
                //   child: IndexedStack(
                //     index: model.currentWidgetIndex,
                //     children: [
                //       startMenu(),
                //       entryScreen(),
                //       settingsMenu(),
                //     ],
                //   ),
                // ),
            //   ],
            // );
      //     },
      //   ),
      // ),
      // ChangeNotifierProvider(
      //   create: (context) => EntryScreenModel(),
      //   child: Consumer<EntryScreenModel>(
      //     builder: (context, model, child) {
      //       return Column(
      //         children: [
      //           // Кнопки для переключения виджетов
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () => model.changeWidget(0),
      //                 child: Text("Виджет 1"),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () => model.changeWidget(1),
      //                 child: Text("Виджет 2"),
      //               ),
      //             ],
      //           ),
      //           // Вывод выбранного виджета
      //           Expanded(
      //             child: IndexedStack(
      //               index: model.currentWidgetIndex,
      //               children: [
      //                 startMenu(),
      //                 entryScreen(),
      //                 settingsMenu(),
      //               ],
      //             ),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),
    // );
  }

  Widget entryScreen (){
    return Scaffold(
      body: Center(
      child:ListView(
        children: <Widget>[
          Container(
              color: Colors.lightBlue.shade100,
              width: 2000,
              height: 170,
              child:
              TextButton(
                  style: _buttonStyle(),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyGoals()),); // CHANGE LATER!
                  },
                  child: Text('Мои цели', style: _textStyle()
                  )
              )
          ),
          Container(
            color: Colors.lightBlue.shade200,
            width: 2000,
            height: 170,
            child:
            TextButton(
                style: _buttonStyle(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherPage()),); // CHANGE LATER!
                },
                child: Text('Мой спорт', style: _textStyle()
                )
            ),
          ),
          Container(
            color: Colors.lightBlue.shade300,
            width: 2000,
            height: 170,
            child:
            TextButton(
                style: _buttonStyle(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyGoals()),); // CHANGE LATER!
                },
                child: Text('Мои цели', style: _textStyle()
                )
            ),
          ),
          Container(
            color: Colors.lightBlue.shade400,
            width: 2000,
            height: 170,
            child:
            TextButton(
                style: _buttonStyle(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoCategory(),)); // CHANGE LATER!
                },
                child: Text('Мои to-do', style: _textStyle()
                )
            ),
          ),
          Container(
            color: Colors.lightBlue.shade500,
            width: 2000,
            height: 170,
            child:
            TextButton(
                style: _buttonStyle(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyGoals()),); // CHANGE LATER!
                },
                child: Text('Мои цели', style: _textStyle()
                )
            ),
          ),
        ],
      ),
      ),
    );
  }

  // Widget settingsMenu(){
  //   return
  //     Text('settings');
  // }


    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //
    //     Text('Погнали!',
    //     style: _textStyle(),),
    //     ElevatedButton(
    //       onPressed: () => model.changeWidget(0),
    //       child: Text("Виджет 1"),
    //     ),
    //     ElevatedButton(
    //       onPressed: () => model.changeWidget(1),
    //       child: Text("Виджет 2"),
    //     ),


  //     ],
  //   );
  // }
}

// class StartMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Text('старт');
//   }
// }
// Widget startMenu(){
//   return Text('старт');
//   // return ChangeNotifierProvider(
//   //   create: (context) => EntryScreenModel(),
//   //   child: Consumer<EntryScreenModel>(
//   //     builder: (context, model, child) {
//   //       return Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Text('Погнали!',
//   //           style: _textStyle(),),
//   //           // Кнопки для переключения виджетов
//   //           // Row(
//   //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //           //   children: [
//   //               ElevatedButton(
//   //                 onPressed: () => model.changeWidget(1),
//   //                 child: Text("Начать"),
//   //               ),
//   //               ElevatedButton(
//   //                 onPressed: () => model.changeWidget(2),
//   //                 child: Text("Настройки"),
//   //               ),
//   //             // ],
//   //           // ),
//   //           // Вывод выбранного виджета
//   //           Expanded(
//   //             child: IndexedStack(
//   //               index: model.currentWidgetIndex,
//   //               children: [
//   //                 startMenu(),
//   //                 entryScreen(),
//   //                 settingsMenu(),
//   //               ],
//   //             ),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   ),
//   // );
// }
