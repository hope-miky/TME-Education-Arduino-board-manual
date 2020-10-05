import 'package:flutter/material.dart';

class FlightsStepper extends StatefulWidget {
  @override
  _FlightsStepperState createState() => _FlightsStepperState();
}

class _FlightsStepperState extends State<FlightsStepper> {
  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    Widget page = pageNumber == 1
        ? Page(
            key: Key('page1'),
            onOptionSelected: () => setState(() => pageNumber = 2),
            question: 'Introduction',
            answers: <String>[
              'The TME-EDU-ARD-2 educational board for learning of Arduino programming has been prepared for the needs of the TME Education programme.',
              'The board has over 20 peripherals using all available outputs of the controller.',
              'The elements are connected, however, it is still possible to change these connections using the jumpers (more on this later).'
            ],
            number: 1,
          )
        : pageNumber == 2
            ? Page(
                key: Key('page2'),
                onOptionSelected: () => setState(() => pageNumber = 3),
                question: 'What is Arduino?',
                answers: <String>[
                  'Arduino platform is one of the most popular solutions dedicated to beginners to electronics in the world.',
                  'It integrates popular AVR micro controllers and dedicated, beginners-friendly programming language (based on C / C++) into a coherent and easy-to-use tool with an infinite number of applications.',
                ],
                number: 2,
              )
            : pageNumber == 3
                ? Page(
                    key: Key('page4'),
                    onOptionSelected: () => setState(() => pageNumber = 4),
                    question: 'Basic kit description',
                    answers: <String>[
                      'There is a place for the Arduino UNO controller in the top left-hand corner of the board. In the bottom left-hand corner there is a section with displays (LCD and OLED) and with LEDs.',
                      'To the right of the display there are 5 large monostable buttons. On the right-hand side there is an IR receiver, a potentiometer, light sensor, buzzer, temperature sensor, microphone and a 7-segment display with a pin expander.',
                      'In the upper, middle part of the board, you can find a connector for external power, a set of jumpers to reconfigure the connections and place for a Bluetooth module and any additional shield with other accessories.'
                    ],
                    number: 3,
                  )
                : Page(
                    key: Key('page5'),
                    onOptionSelected: () => setState(() => pageNumber = 1),
                    question: 'Peripherals connected to the Arduino UNO:',
                    answers: <String>[
                      'Single-colour LED (D13).',
                      'Three-colour (RGB) LED ( D9 - D11).',
                      '7-SEG display',
                      '5 Addresable LED',
                      'Keyboard with 5 monostable buttons',
                      'Potentiometer',
                      'Temprature sensor',
                      'Light dependent resistor',
                      'Sound sensor (microphone)',
                      'LCD display',
                      'OLED Display',
                      'Bluetooth module'
                    ],
                    number: 4,
                  );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(right: 25),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Plane(),
              Line(),
              Positioned.fill(
                left: 32.0 + 8,
                child: AnimatedSwitcher(
                  child: page,
                  duration: Duration(milliseconds: 250),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32.0 + 32 + 8,
      top: 100,
      bottom: 0,
      width: 1,
      child: Container(color: Colors.teal.withOpacity(0.5)),
    );
  }
}

class Page extends StatefulWidget {
  final int number;
  final String question;
  final List<String> answers;
  final VoidCallback onOptionSelected;

  const Page(
      {Key key,
      @required this.onOptionSelected,
      @required this.number,
      @required this.question,
      @required this.answers})
      : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  List<GlobalKey<_ItemFaderState>> keys;
  int selectedOptionKeyIndex;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    keys = List.generate(
      2 + widget.answers.length,
      (_) => GlobalKey<_ItemFaderState>(),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    onInit();
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        double minTop = MediaQuery.of(context).padding.top + 55;
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 26.0 + 32 + 8,
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
              child: child,
            );
          },
          child: Dot(),
        );
      },
    );
    Overlay.of(context).insert(entry);
    await _animationController.forward(from: 0);
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 25),
        ItemFader(key: keys[0], child: StepNumber(number: widget.number)),
        ItemFader(
          key: keys[1],
          child: StepQuestion(question: widget.question),
        ),
        Spacer(),
        ...widget.answers.map((String answer) {
          int answerIndex = widget.answers.indexOf(answer);
          int keyIndex = answerIndex + 2;
          return ItemFader(
            key: keys[keyIndex],
            child: OptionItem(
              name: answer,
              onTap: (offset) => onTap(keyIndex, offset),
              showDot: selectedOptionKeyIndex != keyIndex,
            ),
          );
        }),
        SizedBox(height: 64),
      ],
    );
  }

  void onTap(int keyIndex, Offset offset) async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.hide();
      if (keys.indexOf(key) == keyIndex) {
        setState(() => selectedOptionKeyIndex = keyIndex);
        animateDot(offset).then((_) => widget.onOptionSelected());
      }
    }
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState.show();
    }
  }
}

class StepNumber extends StatelessWidget {
  final int number;

  const StepNumber({Key key, @required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Text(
        '0$number',
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.teal.withOpacity(0.5),
        ),
      ),
    );
  }
}

class StepQuestion extends StatelessWidget {
  final String question;

  const StepQuestion({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Text(
        question,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class OptionItem extends StatefulWidget {
  final String name;
  final void Function(Offset dotOffset) onTap;
  final bool showDot;

  const OptionItem(
      {Key key, @required this.name, @required this.onTap, this.showDot = true})
      : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RenderBox object = context.findRenderObject();
        Offset globalPosition = object.localToGlobal(Offset.zero);
        widget.onTap(globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            SizedBox(width: 26),
            Dot(visible: widget.showDot),
            SizedBox(width: 26),
            Expanded(
              child: Text(
                widget.name,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key key, @required this.child}) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  //1 means its below, -1 means its above
  int position = 1;
  AnimationController _animationController;
  Animation _animation;

  void show() {
    setState(() => position = 1);
    _animationController.forward();
  }

  void hide() {
    setState(() => position = -1);
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 64 * position * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class Dot extends StatelessWidget {
  final bool visible;

  const Dot({Key key, this.visible = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: visible ? Colors.teal : Colors.transparent,
      ),
    );
  }
}

class Plane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32.0 + 8,
      top: 32,
      child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.info,
          size: 64,
          color: Colors.teal,
        ),
      ),
    );
  }
}
