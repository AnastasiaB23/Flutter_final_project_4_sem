import 'package:flutter/material.dart';
import 'package:practice6/screens/to_do_screen.dart';

List<String> ButtonType = ['button1', 'button2', 'button3', 'button4'];

class ToDoCategory extends StatelessWidget {
  ToDoCategory({super.key});

  String _categoryName(int categoryId) {
    switch (categoryId) {
      case 1:
        return "1. Срочное и важное";
      case 2:
        return "2. Не срочное и важное";
      case 3:
        return '3. Срочное и не важное';
      case 4:
        return '4. Не срочное и не важное';
      default:
        return 'ничего неть(';
    }
  }

  ButtonStyle _buttonStyleForToDoPrev() {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  TextStyle _textStyleForToDoPrev(context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.longestSide / 40,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.9),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background_bees.jpg'),
                      fit: BoxFit.fitHeight),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.longestSide / 4.3,
                    ),
                    Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      height:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrangeAccent,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: TextButton(
                                          style: _buttonStyleForToDoPrev(),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ToDoScreen(
                                                        buttonName: ButtonType[0],
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            _categoryName(1),
                                            style: _textStyleForToDoPrev(context),
                                          ))),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      height:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: TextButton(
                                          style: _buttonStyleForToDoPrev(),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ToDoScreen(
                                                        buttonName: ButtonType[1],
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            _categoryName(2),
                                            style: _textStyleForToDoPrev(context),
                                          )))
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.shortestSide / 11,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      height:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: TextButton(
                                          style: _buttonStyleForToDoPrev(),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ToDoScreen(
                                                        buttonName: ButtonType[2],
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            _categoryName(3),
                                            style: _textStyleForToDoPrev(context),
                                          ))),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      height:
                                          MediaQuery.of(context).size.shortestSide /
                                              2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(25)),
                                      child: TextButton(
                                          style: _buttonStyleForToDoPrev(),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ToDoScreen(
                                                        buttonName: ButtonType[3],
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            _categoryName(4),
                                            style: _textStyleForToDoPrev(context),
                                          )))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
