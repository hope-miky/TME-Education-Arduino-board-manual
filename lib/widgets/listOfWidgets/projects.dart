import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';
import 'package:tme_ard_v2/widgets/listOfWidgets/projects_fetured.dart';
import 'package:tme_ard_v2/widgets/reusable/codeview.dart';
import 'package:tme_ard_v2/widgets/reusable/projectCodes.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsView extends StatefulWidget {
  ProjectsView({Key key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
   List<Map<String, dynamic>> listofProjects = [
    {
      "tittle": "7 Segment - Microphone",
      "fetured": false,
      "hex": "7segment-microphone.ino.hex",
      "code": [
        {
          "code": ProjectCodes.segment_microphone,
          "name": "7segment-microphone.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/seven-segment-957235_640.jpg",
      "by": "TME Education",
      "subtittle": "Showing the voice disturbance of a surrounging on 7-SEG display.",
      "category": ["7seg", "all", "advanced", "btn"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/7%20SEGMENT-MICROPHONE"
    },
    {
      "tittle": "Ask 8 ball",
      "fetured": false,
      "hex": "Ask8Ball.ino.hex",
      "code": [
        {
          "code": ProjectCodes.ask8ball,
          "name": "Ask8Ball.ino"
        },
        {
          "code": ProjectCodes.eightBall,
          "name": "8ball.h"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/8-ball-3141731_640.jpg",
      "by": "TME Education",
      "subtittle": "Rolling 8 ball using push buttons and OLED display.",
      "category": ["btn", "all", "oled", "game"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/Ask8Ball"
    },
    
    {
      "tittle": "Button LED",
      "fetured": false,
      "hex": "BUTTON-LED.ino.hex",
      "code": [
        {
          "code": ProjectCodes.button_led,
          "name": "BUTTON-LED.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-2713093_640.jpg",
      "by": "TME Education",
      "subtittle": "In this program, we will combine the skill of operating the led strip with the buttons located on the TME board",
      "category": ["btn", "all", "led", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/BUTTON-LED"
    },
    {
      "tittle": "Buzzer Potentiometer",
      "fetured": false,
      "hex": "Buzzer-Potentiometer.ino.hex",
       "code": [
        {
          "code": ProjectCodes.buzzer_potentiometer,
          "name": "Buzzer-Potentiometer.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/electronics-697857_640.jpg",
      "by": "TME Education",
      "subtittle": "In this project you can control the frequency of the beeps. It's almost like a Geiger-Müller sensor.",
      "category": ["pot", "all", "begin", "all"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/Buzzer-Potentiometer"
    },
    {
      "tittle": "Buzzer voice",
      "fetured": false,
      "hex": "BuzzerMega.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.buzzer_voice,
          "name": "BuzzerMega.ino"
        },
        {
          "code": ProjectCodes.song,
          "name": "song.h"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/speaker-3686639_640.jpg",
      "by": "TME Education",
      "subtittle": "Making a wonderfull music by playing around with frequency changes using a buzzer",
      "category": ["btn", "all", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/BuzzerMega"
    },
    {
      "tittle": "Buzzer Music",
      "fetured": true,
      "hex": "BuzzerMegaShow.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.buzzer_music,
          "name": "BuzzerMegaShow.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/piano-1655558_640.jpg",
      "by": "TME Education",
      "subtittle": "Making diffrent popular musics using a buzzer and some push buttons",
      "category": [ "all", "oled", "advanced", "btn"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/BuzzerMegaShow"
    },
    {
      "tittle": "Demo LED",
      "fetured": false,
      "hex": "DemoLed.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.demo_led,
          "name": "ask_8_ball.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-2713093_640.jpg",
      "by": "TME Education",
      "subtittle": "Controlling RGB LED and LED brightness using a potentiometer",
      "category": ["pot", "all", "led", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/DemoLed"
    },
    {
      "tittle": "Dice",
      "fetured": false,
      "hex": "Dice.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.maindice,
          "name": "Dice.ino"
        },
        {
          "code": ProjectCodes.dice,
          "name": "dice.h"
        },
        {
          "code": ProjectCodes.dice2,
          "name": "dice2.h"
        },
        {
          "code": ProjectCodes.dice3,
          "name": "dice3.h"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/cube-442544_640.jpg",
      "by": "TME Education",
      "subtittle": "Rolling dice game using some push buttons and OLED display.",
      "category": ["oled", "all", "game", "btn", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/Dice"
    },
    {
      "tittle": "Duck jump",
      "fetured": true,
      "hex": "DuckJump.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.duck_jump,
          "name": "DuckJump.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/geese-376436_640.jpg",
      "by": "TME Education",
      "subtittle": "Build a wonderful game - Moving a duck through a road",
      "category": ["game", "all", "advanced", "oled", "btn"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/DuckJump"
    },
    {
      "tittle": "Knob LED",
      "fetured": false,
      "hex": "KNOB-LED.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.knob_led,
          "name": "DuckJump.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-631977_640.jpg",
      "by": "TME Education",
      "subtittle": "Changing and playing around with RGB led colors using a potentiometer",
      "category": ["all", "led", "pot", "lcd", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/KNOB-LED"
    },
    {
      "tittle": "Knob-Osciloscope",
      "fetured": false,
      "hex": "Knop_Oscilloscope.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.knob_osiloscope,
          "name": "Knop_Oscilloscope.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/oscilloscope-2652341_640.jpg",
      "by": "TME Education",
      "subtittle": "Showing voltage level as an osciloscope",
      "category": ["all", "oled", "pot", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/Knob_Oscilloscope"
    },
    {
      "tittle": "LCD Alphabet",
      "fetured": false,
      "hex": "LCD-ALPHABET.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.lcd_alphabet,
          "name": "LCD-ALPHABET.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/integrated-circuit-441294_640.jpg",
      "by": "TME Education",
      "subtittle": "Showing alphabet digits A-Z using an LCD",
      "category": ["all", "lcd", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/LCD-ALPHABET"
    },
    {
      "tittle": "LCD Text",
      "fetured": false,
      "hex": "LCD-TEXT.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.lcd_text,
          "name": "LCD-TEXT.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/integrated-circuit-441294_640.jpg",
      "by": "TME Education",
      "subtittle": "Showing text and variable values using LCD display",
      "category": ["all", "lcd", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/LCD-TEXT"
    },
    {
      "tittle": "LCD Watch",
      "fetured": false,
      "hex": "LCD_Watch.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.lcd_watch,
          "name": "LCD-ALPHABET.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/integrated-circuit-441294_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a real time clock using LCD display",
      "category": ["all", "lcd", "begin"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/LCD_Watch"
    },
    {
      "tittle": "LED blink",
      "fetured": false,
      "hex": "Blink.uno.hex",
      "code": [
        {
          "code": ProjectCodes.led_blink,
          "name": "led blink.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-2713093_640.jpg",
      "by": "TME Education",
      "subtittle": "Blinking LED with a fixed time interval",
      "category": ["all", "led", "begin"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/LED%20BLINK"
    },
    {
      "tittle": "LED Strip",
      "hex": "LED-strip.ino.standard.hex",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.led_strip,
          "name": "LED-strip.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-631977_640.jpg",
      "by": "TME Education",
      "subtittle": "Displaying diffrent colors using addresable LEDs",
      "category": ["all", "led", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/LED-STRIP"
    },

    {
      "tittle": "Light sensor LCD",
      "hex": "LightSensor-LCD.ino.standard.hex",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.light_sensor,
          "name": "LightSensor-LCD.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/light-bulb-503881_640.jpg",
      "by": "TME Education",
      "subtittle": "Working with Light sensors and LCD display",
      "category": ["all", "sensor", "lcd", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/LightSensor-LCD"
    },

    {
      "tittle": "Logo TME",
      "hex": "LogoTmeEdu.ino.standard.hex",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.logo_TME,
          "name": "LogoTmeEdu.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/main_images/logo.png",
      "by": "TME Education",
      "subtittle": "Displaying TME Education LOGO using OLED display",
      "category": ["all", "oled", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/LogoTmeEdu"
    },

    {
      "tittle": "Microphone speacker",
      "hex": "MICROPHONE-SPEAKER.ino.standard.hex",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.mic_speacker,
          "name": "MICROPHONE-SPEAKER.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/piano-1655558_640.jpg",
      "by": "TME Education",
      "subtittle": "Sensing sound signals and displaying it using LCD",
      "category": ["all", "sensor", "begin"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/MICROPHONE-SPEAKER"
    },

    {
      "tittle": "OLED Graphics",
      "fetured": false,
      "hex": "Oled-Graphics.ino.standard.hex",
      "code": [
        {
          "code": ProjectCodes.oled_graphics,
          "name": "Oled-Graphics.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/electric-948208_640.jpg",
      "by": "TME Education",
      "subtittle": "Working with diffrent shapes in OLED",
      "category": ["all", "oled", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/Oled-Graphics"
    },

    {
      "tittle": "Paint",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.paint,
          "name": "Paint.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/art-1851483_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a paint device using OLED display",
      "category": ["all", "btn", "lcd", "oled", "pot", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/Paint"
    },

    {
      "tittle": "Pong game",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.pong_game,
          "name": "Pong_Game.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/sport-3097621_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a pong game using some push buttons and OLED display.",
      "category": ["all", "pot", "lcd", "advanced", "game"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/Pong_Game"
    },

    {
      "tittle": "RGB Show",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.rgb_show,
          "name": "RGB_show.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/arduino-1080213_640.jpg",
      "by": "TME Education",
      "subtittle": "Displaying diffrent colors using RGB LED",
      "category": ["all", "led", "begin"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/RGB_show"
    },

    {
      "tittle": "Random number",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.rand_num,
          "name": "RandomNumbers.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/seven-segment-957235_640.jpg",
      "by": "TME Education",
      "subtittle": "Displaying random numbers using 7-SEG and OLED display",
      "category": ["all", "oled", "7seg", "pot", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/RandomNumbers"
    },

    {
      "tittle": "Snake game",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.snake_game,
          "name": "Snake.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/iphone-472197_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a sanke game using OLED Display",
      "category": ["all", "pot", "game", "btn", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/blob/master/Snake"
    },

    {
      "tittle": "Thermometer LCD",
      "fetured": false,
      "code": [
        {
          "code": ProjectCodes.thermometer_lcd,
          "name": "THERMOMETER-LCD.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/thermometer-693852_640.jpg",
      "by": "TME Education",
      "subtittle": "Working with Temprature sensor and LCD display",
      "category": ["all", "sensor", "lcd", "advanced"],
      "link": "https://github.com/tmeeducation/TME-EDU-ARD-2-examples/tree/master/THERMOMETER-LCD"
    },

    {
      "tittle": "TME Arduino Demo",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.tme_demo,
          "name": "TME-EDU-ARD-2-demo.ino"
        },
       
      ],
      "imagepath": "assets/images/project/service-428540_640.jpg",
      "by": "TME Education",
      "subtittle": "A demo code to test every functionality of TME Education arduino board",
      "category": ["all", "advanced"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/TME-EDU-ARD-2-demo"
    },

    {
      "tittle": "Timer",
      "fetured": true,
      "code": [
        {
          "code": ProjectCodes.timer,
          "name": "Timer.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/clock-691143_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a timer using OLED display",
      "category": ["all", "oled", "btn", "advanced"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/Timer"
    },

    {
      "tittle": "Weather station",
      "fetured": true,
       "code": [
        {
          "code": ProjectCodes.weather_station,
          "name": "WeatherStation.ino"
        },
        {
          "code": ProjectCodes.intro,
          "name": "intro.h"
        },
        {
          "code": ProjectCodes.include,
          "name": "include.h"
        }
      ],
      "imagepath": "assets/images/project/technology-1850021_640.jpg",
      "by": "TME Education",
      "subtittle": "Building a weather station using sensors and OLED display",
      "category": ["all", "sensor", "led", "oled", "lcd", "advanced"],
      "link": "https://github.com/Tesfamichael1074/TME-EDU-ARD-2-examples/tree/master/WeatherStation"
    },
    
  ];

  String selected = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              
              children: <Widget>[
                SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
            ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // RaisedButton(
                        //   onPressed: (){
                        //     Navigator.push(context, MaterialPageRoute(builder: (contex) => CodeView()));
                        //   },
                        // child: Text("Project"),
                        // ),

                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("Filter",
                          textAlign: TextAlign.left, 
                          style: AppTheme.caption.copyWith(
                            fontSize: 15,
                          ),),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width ,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: <Widget>[

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "all";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "all" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("All"),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "begin";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "begin" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("Beginers"),
                                    ),
                                  ),
                                  
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "led";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "led" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("LED"),
                                    ),
                                  ),
                                  
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "btn";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "btn" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("Push buttons"),
                                    ),
                                  ),
                                  
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "7seg";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "7seg" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("7 SEG"),
                                    ),
                                  ),
                                  
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "lcd";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "lcd" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("LCD"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "advanced";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "advanced" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("Advanced"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "oled";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "oled" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("OLED"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "game";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "game" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("Games"),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selected = "sensor";
                                      });
                                    },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: selected == "sensor" ?  Colors.amber[500] :Colors.teal[100] 
                                        ),
                                        child: Text("Sensors"),
                                    ),
                                  ),
                                  
                                  

                                  
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),


                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,

                          child: GridView.count(
                            crossAxisCount: 1,
                            scrollDirection: Axis.horizontal,
                            crossAxisSpacing: 100,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.6,
                            shrinkWrap: true,
                            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
                          
                            

                            children: listofProjects.where((test) => test["category"].contains(selected)).map( (f) {
                              return Container(
                                child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                   color: Colors.teal[50],
                                   border: Border.all(color: Colors.teal[300])
                                 ),
                                  child: Row(

                                    children: <Widget>[
                                      
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        height: double.maxFinite,
                                        child: ClipRRect(
                                         borderRadius: BorderRadius.all(Radius.circular(20)),
                                         child: Image.asset(f["imagepath"],
                                           fit: BoxFit.cover,
                                         ),
                                          ),
                                      ),

                                      Flexible(
                                          child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[

                                              Text(f["tittle"],
                                              style: AppTheme.title.copyWith(
                                                      color: Colors.teal,
                                                      fontWeight: FontWeight.normal,

                                                    ),
                                                ),

                                                Text("By -" +f["by"],
                                                      textAlign: TextAlign.left,
                                                      style: AppTheme.caption.copyWith(
                                                      fontWeight: FontWeight.normal
                                                    ),
                                                ),

                                                SingleChildScrollView(
                                                   child: Container(
                                                    height: 80,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                      child: Text( f["subtittle"],
                                                            textAlign: TextAlign.left,
                                                            style: AppTheme.subtitle.copyWith(
                                                              color: Colors.brown,
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: 13
                                                          ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                // Spacer(),

                                                Flexible(
                                               child: Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: ()async {
                                                              var url = '${f["link"]}';
                                                              if (await canLaunch(url)) {
                                                                await launch(url, forceSafariVC: false);
                                                              } else {
                                                                throw 'Could not launch $url';
                                                              }
                                                            },
                                                        icon: Icon(Icons.integration_instructions_outlined , color: Colors.blue[400],)
                                                        ),

                                                      IconButton(
                                                          onPressed: () {
                                                                  Navigator.push(context, MaterialPageRoute(builder: (contex) => CodeView(project: f,)));
                                                              },
                                                          icon: Icon(Icons.settings_ethernet , color: Colors.amber[900],)
                                                        ),

                                                    ],
                                                  ),
                                                  
                                                ),

                                                // SizedBox(height: 20,)
                                                
                                            ],
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              );
                            } ).toList()
                            
                            
                            
                            ),
                        ),
                        

                        ProjectsFetured(listofProjects: listofProjects,)

                      ],
                  ),
                ),
              ],
            ),
          ),


          
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.teal[500],
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60), bottomLeft: Radius.circular(60))
            ),
            child: Column(
              children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text("Projects Dashboard", style: AppTheme.title.copyWith(
                    fontSize: 25,
                    color: AppTheme.nearlyWhite
                  ),),
                )
              ],
            ),
          ),

          
        ],
      ),
    );


  }

 
}