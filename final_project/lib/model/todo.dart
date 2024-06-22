import '/screens/todo_preview_screen.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  // if (toDoScreen1){
  //   List <ToDo> myToDoList1 = [];
  // }
  static List<ToDo> todoList() {
    return[
      ToDo(id: '01', todoText: 'Утренняя зарядка', isDone: true),
      ToDo(id: '02', todoText: 'Съесть белковый обед', ),
      ToDo(id: '03', todoText: 'Запланировать тренировку на завтра', ),
    ];

  }

  static List<ToDo> myToDoList1() {
    return[
      ToDo(id: '01', todoText: 'Утренняя зарядка', isDone: true),
      ToDo(id: '02', todoText: 'Съесть белковый обед', ),
      ToDo(id: '03', todoText: 'Запланировать тренировку на завтра', ),
    ];

  }

}