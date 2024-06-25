import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WidgetState extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changeWidget(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

bool isFemale = true;

Widget currWidget(bool female) {
  if (female) {
    return womanExercisesWidgetPart1();
  } else {
    return manExercisesWidgetPart1();
  }
}

class TrainExercisesScreenModel with ChangeNotifier {
  Widget _currentWidgetIndex = currWidget(isFemale);

  Widget get currentWidgetIndex => _currentWidgetIndex;

  void changeWidget(Widget index) {
    _currentWidgetIndex = index;
    notifyListeners();
  }
}

class TrainExercisesScreen extends StatefulWidget {
  bool female;

  TrainExercisesScreen({Key? key, required this.female}) : super(key: key);

  @override
  State<TrainExercisesScreen> createState() => _TrainExercisesScreenState();
}

bool isVisible = false;

class _TrainExercisesScreenState extends State<TrainExercisesScreen> {
  late bool female;

  @override
  void initState() {
    super.initState();
    female = widget.female;
    dependOnMFWidgets();
  }

  List<Widget> dependOnMFWidgets() {
    if (female) {
      isFemale = true;
      return [
        womanExercisesWidgetPart1(),
        womanExercisesWidgetPart2(),
      ].toList();
    } else {
      isFemale = false;
      return [
        manExercisesWidgetPart1(),
        manExercisesWidgetPart2(),
      ].toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: countdownTimer(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => WidgetState(),
        child: Consumer<WidgetState>(builder: (context, state, child) {
          return Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => state.changeWidget(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.blue.shade400,
                      ),
                      child: Center(
                          child: Text(
                        'Часть 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => state.changeWidget(1),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.purple.shade300,
                      ),
                      child: Center(
                        child: Text(
                          'Часть 2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey,
                      ),
                      child: Icon(Icons.timer_outlined),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: state.selectedIndex,
                  children: dependOnMFWidgets(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class countdownTimer extends StatefulWidget {
  const countdownTimer({super.key});

  @override
  State<countdownTimer> createState() => _countdownTimerState();
}

class _countdownTimerState extends State<countdownTimer> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStart() => stopwatch.start();

  void handleStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 100)
        .toString()
        .padLeft(2, "0"); // this one for the miliseconds
    String seconds = ((milli ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the minute

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            returnFormattedText(),
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.shortestSide / 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              handleStart();
            },
            icon: Icon(Icons.play_arrow),
            style: ButtonStyle(
              iconSize: const MaterialStatePropertyAll<double>(32),
            ),
          ),
          IconButton(
              onPressed: () {
                handleStop();
              },
              icon: Icon(Icons.pause),
              style: ButtonStyle(
                iconSize: const MaterialStatePropertyAll<double>(32),
              )),
          IconButton(
              onPressed: () {
                stopwatch.reset();
                handleStop();
              },
              icon: Icon(Icons.replay_sharp),
              style: ButtonStyle(
                iconSize: const MaterialStatePropertyAll<double>(32),
              ))
        ],
      ),
    );
  }
}

Widget descriptionTextStyle (String text, context){
  return Container(
    padding: EdgeInsets.all(8.0),
    child:
    Text(text, style: TextStyle(fontSize: MediaQuery.of(context).size.shortestSide / 20,)),
  );
}

class womanExercisesWidgetPart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        descriptionTextStyle('Отжимания «Паук» укрепляют мышцы кора, а также косые мышцы живота и квадрицепс.'
            'Выполняйте в три подхода по 8-10 повторений на каждую ногу;', context),
        Lottie.asset('assets/woman_spider_man_pushups.json'),
        descriptionTextStyle('Упражнение «Открытие книги» улучшает подвижность грудного отдела позвоночника и снимает ощущение скованности в этой области. '
            'Выполняйте по 8–15 повторений на каждую сторону в медленном темпе.', context),
        Lottie.asset('assets/woman_open_books.json'),
      ],
    );
  }
}

class womanExercisesWidgetPart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        descriptionTextStyle('«Мёртвый жук» — упражнение для укрепления пресса и глубоких мышц кора. '
            'Выполнять упражнение следует 10–12 раз в три подхода.', context),
        Lottie.asset('assets/woman_deadbug.json'),
        descriptionTextStyle('Поза кобры укрепляеи мышцы спины, ягодиц и рук. '
            'Повторяйте два-три раза по 15-30 секунд через короткий отдых.', context),
        Lottie.asset('assets/woman_cobra.json'),
      ],
    );
  }
}

class manExercisesWidgetPart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        descriptionTextStyle('Подобная растяжка с приседаниями позволяет хорошо разогреть мышцы перед силовой тренировкой. '
            'Выполнять упражнение следует 10-12 раз в три подхода.', context),
        Lottie.asset('assets/man_aerobic.json'),
        descriptionTextStyle('Русский твист - это простое упражнение для мышц брюшного пресса для проработки позвоночника, плеч и бедер.'
            ' Выполнять от 10 до 25 повторений в 3-4 подхода.', context),
        Lottie.asset('assets/man_russian_twist.json'),
      ],
    );
  }
}

class manExercisesWidgetPart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        descriptionTextStyle('Упражнение "Планка низко-высоко" (plank low to high) - '
            'это динамическая вариация классической планки, которая направлена на развитие мышц спины, ягодиц и пресса.  '
            'Начните с 2-3 подходов по 8-10 повторений.', context),
        Lottie.asset('assets/man_plank_low_to_high.json'),
        descriptionTextStyle('Упражнение «велосипедный хруст» (elbow-to-knee twisting crunch) направлено на работу мышц живота. '
            'Начните с 2-3 подходов по 10-12 повторений с каждой стороны.', context),
        Lottie.asset('assets/man_elbow_to_knee_crunch.json'),
      ],
    );
  }
}
