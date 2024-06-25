import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice6/screens/entryscreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  final List<Color> gradientColors = [
    Colors.white,
    Colors.lightBlue,
  ];
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Lottie.asset('assets/target_logo.json'),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: gradientColors,
                          stops: [
                            _animation.value + 0,
                            _animation.value - 0,
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EntryScreen()));
                          },
                          child: Text(
                            'Погнали!',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.longestSide / 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outlined,
                  color: Colors.blueGrey.shade300,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  '''Версия: 1.2.3                               
От автора: была рада создать его для Вас)
Пользуйтесь на здоровье и воплощайте мечты в жизнь!:)'''),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Спасибо)'),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      'О приложении',
                      style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontSize:
                              MediaQuery.of(context).size.longestSide / 50),
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        color: Colors.indigo,
      ),
    );
  }
}
