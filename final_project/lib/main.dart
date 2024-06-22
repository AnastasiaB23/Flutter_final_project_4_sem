import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter/counter_noifier.dart';
import 'counter/counter_state.dart';
import 'entryscreen.dart';
import 'screens/todo_preview_screen.dart';
import 'dart:async';
import 'package:get_it/get_it.dart';



void main() async{

  // initDream();
  // pageLoading();
  // await messageAsync();

  runApp(MyApp());
  // runApp(const ProviderScope(child: MyApp()));


}

// class MyData extends InheritedWidget {
//
//   const MyData({super.key, required this.data, required this.color, required super.child});
//   final String data;
//   final Color color;
//
//   static MyData of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<MyData>()!;
//   }
//
//   @override
//   bool updateShouldNotify(covariant oldWidget) {
//     return true;
//
//   }
// }
//
// class Dreams {
//   String? goal;
//   String? deadline;
//   Dreams({this.goal, this.deadline});
// }
//
// GetIt myDream = GetIt.instance;
//
// initDream() {
//   myDream.registerFactoryParam<Dreams, String, String>((param1, param2) =>
//       Dreams(goal: param1, deadline: param2));
// }


// void pageLoading(){
//     print ("Итак...");
//     Future<String> messageFromFuture = futureMessage0();
//     messageFromFuture.then((message){
//        print(message);
//     });
//
//     print ('');
//
// }
//
// Future<String> futureMessage0() {
//   return Future.delayed(Duration(seconds: 2), () => "Внимание...");
// }
//
// Future<String> futureMessage1() {
//   return Future.delayed(Duration(seconds: 4), () => "ПОГНАЛИ!");
// }
//
// String temp = '';

// Future <String> messageAsync() async {
//   try {
//     String asyncMessage = await futureMessage1();
//     temp = asyncMessage;
//     return temp;
//   } catch (error) {
//     return('Ошибка при получении данных: $error');
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // MyData(
    //   data: 'Путь в тысячу шагов начинается с первого шага!',
    //   color: Colors.green,
    // child:
      MaterialApp(
        title: 'Погнали!',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: EntryScreen(),
    // ),
    );
  }
}


// class CounterPage extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final CounterState counterState = ref.watch(counterProvider);
//     final CounterNotifier counterNotifier = ref.watch(counterProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Счётчик'),
//       ),
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Text('Счёт: ${counterState.value}'),
//             ),
//             ElevatedButton(
//               onPressed: () => counterNotifier.increase(),
//               child: const Text('Прибавить'),
//             ),
//             ElevatedButton(
//               onPressed: () => counterNotifier.decrease(),
//               child: const Text('Вычесть'),
//             ),
//             SizedBox(height: 20, width: 50),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement<void, void>(
//                     context,
//                     MaterialPageRoute<void>(
//                       builder: (BuildContext context) => const EntryScreen(),
//                     )
//                 );
//               },
//               child: Text('Назад навсегда'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
