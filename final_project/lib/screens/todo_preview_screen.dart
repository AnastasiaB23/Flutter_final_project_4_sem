import 'package:flutter/material.dart';
import 'package:practice6/entryscreen.dart';
import 'package:practice6/screens/to_do_screen.dart';
import 'first_screen.dart';
import '/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'to_do_screen.dart';

ButtonStyle _buttonStyleForToDoPrev(){
  return TextButton.styleFrom(
    surfaceTintColor: Colors.pinkAccent.shade200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  );
}

TextStyle _textStyleForToDoPrev(){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.9),
  );
}



List<String> ButtonType = ['button1', 'button2', 'button3', 'button4'];

class ToDoCategory extends StatelessWidget{


  ToDoCategory({super.key});
  // ToDoScreen toDoScreen1 = ToDoScreen(id: 0,);
  // ToDoScreen toDoScreen2 = ToDoScreen(id: 1,);
  // EntryScreen entryScreen = EntryScreen();


  String _categoryName(int categoryId){
    switch(categoryId){
      case 1:
        return "1. Срочное и важное";
      case  2:
        return "2. Не срочное и важное";
      case 3:
        return '3. Срочное и не важное';
      case  4:
        return '4. Не срочное и не важное';
      default:
        return 'Все to-do';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  color: Colors.deepOrangeAccent,
                  width: 150,
                  height: 150,
                  child:
                  TextButton(
                      style: _buttonStyleForToDoPrev(),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoScreen(buttonName: ButtonType[0],)),);
                        // CHANGE LATER!
                      },
                      child: Text(_categoryName(1), style: _textStyleForToDoPrev(),
                      )
                  )
              ),
                Container(
                    color: Colors.green,
                    width: 150,
                    height: 150,
                    child:
                    TextButton(
                        style: _buttonStyleForToDoPrev(),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoScreen(buttonName: ButtonType[1],)),);
                          // CHANGE LATER!
                        },
                        child: Text(_categoryName(2), style: _textStyleForToDoPrev(),
                        )
                    )
                )
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  color: Colors.yellow,
                  width: 150,
                  height: 150,
                  child:
                  TextButton(
                      style: _buttonStyleForToDoPrev(),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoScreen(buttonName: ButtonType[2],)),);
                        // CHANGE LATER!
                      },
                      child: Text(_categoryName(3), style: _textStyleForToDoPrev(),
                      )
                  )
              ),
              Container(
                  color: Colors.blueAccent,
                  width: 150,
                  height: 150,
                  child:
                  TextButton(
                      style: _buttonStyleForToDoPrev(),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoScreen(buttonName: ButtonType[3],)),);
                        // CHANGE LATER!
                      },
                      child: Text(_categoryName(4), style: _textStyleForToDoPrev(),
                      )
                  )
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //         color: Colors.lightGreen,
          //         width: 350,
          //         height: 100,
          //         child:
          //         TextButton(
          //             style: _buttonStyleForToDoPrev(),
          //             onPressed: () {
          //               Navigator.push(context, MaterialPageRoute(builder: (context)=> MyGoals()),);
          //               // CHANGE LATER!
          //             },
          //             child: Text(_categoryName(0), style: _textStyleForToDoPrev(),
          //             )
          //         )
          //     ),
          //   ],
          // ),
      ],
      ),

      );

  }
}
// прописать различные состояния экрана (как гпт предложил) и
// сделать разные отсеки хранения для содержимого категорий