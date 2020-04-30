import 'package:flutter/material.dart';
import 'package:tme_ard_v2/app_theme.dart';

class ComponentsTextView extends StatelessWidget {

  final List<Map<String, dynamic>> data = [
    {
      "tittle": "7 Segment display",
      "conto": "I2C port with address - 0x24",
      "subtittle": "There is a 7-segment display with a common anode in the top right-hand corner of the board, which was connected to Arduino via the I2C expander (0x24 address). The use of different addresses allows simultaneous use of many components communicating with the same data lines. This allows simultaneous use of text LCD.",
      "quantity": "1",
    },
    {
      "tittle": "Digitally controlled RGB LEDs",
      "conto": "D12",
      "subtittle": "There are 5 digitally controlled RGB LEDs on the board. All these diodes are connected in series to one Arduino output (D12). WS2812B diodes have a built-in controller, so that different colour can be assigned to each diode.The LEDs are numbered from 0 to 4. The LED number 0 is next to the OLED display, the remaining 4 LEDs have been placed on the other side of the board (in the corners), thanks to which they can illuminate the board from the bottom. Diodes should be turned on beginning from adding a library and configuring an object that contains information about them.",
      "quantity": "5",
    },
    {
      "tittle": "Arduino Uno",
      "conto": "",
      "subtittle": "There is a place for the Arduino UNO controller in the top left-hand corner of the board",
      "quantity": "1",
    },
    {
      "tittle": "Bluetooth module connector",
      "conto": "TX - RX",
      "subtittle": "The board has a space for attaching an optional Bluetooth module, e.g. HC-05. The angled 6-pin connector for its connection is located to the right of the jumper strip",
      "quantity": "1",
    },
    {
      "tittle": "Keyboard with 5 monostable buttons.",
      "conto": "D4-8",
      "subtittle": "There are 5 monostable buttons on the board that are connected to digital pins D4, D5, D6, D7 and D8. All buttons have been equipped with RC filters, thanks to which the readings are stable and there is no need to program the inputs in order to avoid the so-called. contact vibrations.",
      "quantity": "5",
    },
    {
      "tittle": "Buzzer with generator",
      "conto": "D2",
      "subtittle": "A buzzer with a generator (sound emitting device) is connected to pin D2. Controlling of this device is performed in the same way as the above example with a diode. The logical 1 on the Arduino output will make the buzzer sound.",
      "quantity": "1",
    },
    {
      "tittle": "Text LCD display 2x16 characters",
      "conto": "I2C port with address 0x20",
      "subtittle": "One of the main elements of the educational board is a text LCD display, on which you can display 2 lines of text (16 characters each). The display is connected via an additional intermediary system that communicates with Arduino via the digital I2C interface. Thanks to this, only 2 signal lines are used to control this display.",
      "quantity": "1",
    },
    {
      "tittle": "Simple, single-colour LED",
      "conto": "D13",
      "subtittle": "The educational board has been equipped with one, standard LED diode, which is located in the lower left corner of the board. There is a marking D13 next to the diode, which means that this element can be operated in a digital way (D from digital). The number \"13\" is the number of the Arduino pin to which the element is connected with the default configuration of jumpers.",
      "quantity": "1",
    },
    {
      "tittle": "Light sensor",
      "conto": "A3",
      "subtittle": "analog sensor placed on the board is the KPS-3227 light sensor, which by default is connected to the A3 input. By testing the voltage at the output of this sensor, you can measure the amount of light falling on the board - the brighter the light is, the higher voltage should be.",
      "quantity": "1",
    },
    {
      "tittle": "Microphone",
      "conto": "A0",
      "subtittle": "There is a microphone on the board that has been connected to the Arduino in a way that allows it to be used as a noise level sensor. This microphone can be used, for example, to switch diodes on by clapping or signalling too high sound levels in a room.",
      "quantity": "1",
    },
    {
      "tittle": "OLED graphic display with I2C interface",
      "conto": "I2C port with address 0x3C",
      "subtittle": "Another element connected to the I2C interface is the OLED graphic display (address 0x3C), which is next to the LEDs. The display used on the board has the popular SSD1306 driver.",
      "quantity": "1",
    },
    {
      "tittle": "Potentiometer",
      "conto": "A1",
      "subtittle": "The simplest analog sensor located on the board is a potentiometer connected to the A1 pin (A for “analog”). In this case, the use of this element as a voltage divider is used.",
      "quantity": "1",
    },
    {
      "tittle": "Simple, three-colour (RGB) LED",
      "conto": "D9-11",
      "subtittle": "There is LED2 diode on the board, which is an RGB diode. This means that its housing has 3 luminous structures: red (R), green (G) and blue (B).",
      "quantity": "1",
    },
    {
      "tittle": "Thermometer",
      "conto": "A2",
      "subtittle": "The board has an analog temperature sensor MCP9701 (connected to A2 by default). This sensor can be used identically to a light sensor. In this case, an increase in voltage at its output will mean a rise in temperature.",
      "quantity": "1",
    },
    
  ];

  final int id;

  ComponentsTextView({this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.teal[50],
                  border: Border.all(color: Colors.teal[300])
                ),
      child: Column(
        children: <Widget>[

          Text(data[id]["tittle"].toString(),
          style: AppTheme.title.copyWith(
            color: Colors.teal
          ),
          ),

          Text("Connected to - " + data[id]["conto"].toString(),
          style: AppTheme.subtitle,
          ),

          Text("Quantity - " + data[id]["quantity"].toString(),
            style: AppTheme.subtitle,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data[id]["subtittle"].toString(),
            textAlign: TextAlign.center,
            style: AppTheme.caption,
            ),
          ),

          
        ],
      ),
    );
  }
}