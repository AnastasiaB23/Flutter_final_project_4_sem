import 'package:flutter/material.dart';
import 'package:practice6/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoScreen extends StatefulWidget {
  int? id;

  ToDoScreen({super.key, required id});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  // final todosList = ToDo.myToDoList1();
  // // final todosList = ToDo.todoList();
  // List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  SharedPreferencesService? service;

  @override
  void initState() {
    // _foundToDo = todosList;
    super.initState();
  }

  initSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    service = SharedPreferencesService(sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.indigo,
                size: 20,
              ),
            ),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                controller: _todoController,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                // onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(8.0),
                  // prefixIconConstraints: BoxConstraints(
                  //     maxHeight: 20,
                  //     minWidth: 25
                  // ),
                  border: InputBorder.none,
                  hintText: 'Поиск',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  contentPadding: EdgeInsets.only(left: 0, bottom: 2),
                  focusedBorder: InputBorder.none,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.transparent,
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
                obscureText: false,
              ),
            )
          ]),
        ),
      ),
      body:
          // Stack(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.symmetric(
          //         horizontal: 20,
          //         vertical: 15,
          //       ),
          //       child: Column(
          //       children: [
          SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.indigo,
                    )),
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                height: 60,
                child: Row(children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.check_box_outlined,
                          color: Colors.indigo,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text('Go to gym',
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )
                ])
            )
          ],
        ),
      ),
      // searchBox(),
      // Expanded(
      //   child:
      //   ListView(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(
      //           top: 50,
      //           bottom: 20,
      //         ),
      //         child: Text(
      //           'All ToDos',
      //             // CHANGE to a specific category!!!!!
      //           style: TextStyle(
      //             fontSize: 30,
      //             fontWeight: FontWeight.w500,
      //           ),
      //         ),
      //       ),
      // Row(
      //   children: [
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Icon(
      //       Icons.check_box_outlined,
      //       color: Colors.indigo,
      //       size: 20,
      //     ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Expanded(child:
      //       Text('Go to gym', overflow: TextOverflow.ellipsis),
      //     ),
      //   ],
      //
      // ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GestureDetector(
      //     onTap: () {},
      //     child: Icon(
      //       Icons.delete,
      //       color: Colors.red,
      //     ),
      //   ),
      // ),
      // for (ToDo todoo in _foundToDo.reversed)
      //   ToDoItem(
      //     todo: todoo,
      //     onToDoChanged: _handleToDoChange,
      //     onDeleteItem: _deleteToDoItem,),
    );

    //     ),
    //
    //
    // );
    // ),
    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: Row(children: [
    //     Expanded(child: Container(margin: EdgeInsets.only(
    //       bottom: 20,
    //       right: 20,
    //       left: 20,
    //     ),
    //       padding: EdgeInsets.symmetric(
    //         horizontal: 20,
    //         vertical: 5,
    //       ),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(0.0, 0.0),
    //           blurRadius: 10.0,
    //           spreadRadius: 0.0,
    //         ),],
    //         borderRadius: BorderRadius.circular(10),
    //
    //       ),
    //       child: TextField(
    //         controller: _todoController,
    //         decoration: InputDecoration(
    //           hintText: 'Добавить...',
    //           border: InputBorder.none
    //         ),
    //
    //       ),
    //     ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(bottom: 20, right: 20),
    //       child: ElevatedButton(
    //         child: Text('+', style: TextStyle(fontSize: 40,),),
    //         onPressed: () {
    //           _addToDoItem(_todoController.text);
    //         },
    //         style: ElevatedButton.styleFrom(
    //           foregroundColor: Colors.indigo,
    //           minimumSize: Size(60, 60),
    //           elevation: 10,
    //         ),
    //       ),
    //     ),
    //   ],),
    // )
    //   ],
    //   ),
    // );
  }

// void _handleToDoChange(ToDo todo){
//   setState((){
//     todo.isDone = !todo.isDone;
//   });
// }
//
// void _deleteToDoItem(String id){
//   setState(() {
//     todosList.removeWhere((item) => item.id == id);
//   });
// }
//
// void _addToDoItem(String toDo){
//   setState(() {
//     todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
//   });
//   _todoController.clear();
// }
//
//
// void _runFilter(String enteredKeyword){
//   List<ToDo> results = [];
//   if (enteredKeyword.isEmpty){
//     results = todosList;
//   }
//   else{
//     results = todosList
//         .where((item) => item.todoText!
//           .toLowerCase()
//           .contains(enteredKeyword.toLowerCase()))
//         .toList();
//   }
//   setState(() {
//     _foundToDo = results;
//   });
// }

//   Widget searchBox(){
//     // return Container(
//     //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//     //   decoration: BoxDecoration(
//     //     color: Colors.indigo.shade50,
//     //     borderRadius: BorderRadius.circular(20),
//     //   ),
//     //   child: TextField(
//     //     textInputAction: TextInputAction.search,
//     //     maxLines: 1,
//     //     controller: _todoController,
//     //     keyboardType: TextInputType.text,
//     //     textAlignVertical: TextAlignVertical.center,
//     //     // onChanged: (value) => _runFilter(value),
//     //     decoration: InputDecoration(
//     //       contentPadding: EdgeInsets.all(0),
//     //       prefixIcon: Icon(
//     //         Icons.search,
//     //         color: Colors.black54,
//     //         size: 20,
//     //       ),
//     //       prefixIconConstraints: BoxConstraints(
//     //         maxHeight: 20,
//     //         minWidth: 25
//     //       ),
//     //       border: InputBorder.none,
//     //
//     //       hintText: 'Поиск',
//     //       hintStyle: TextStyle(color: Colors.blueGrey),
//     //     ),
//     //     obscureText: false,
//     //   ),
//     // );
//   }
}
