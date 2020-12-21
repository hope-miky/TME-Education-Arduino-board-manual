class ProjectCodes {
  ProjectCodes._();

  static const intro = '''
  void intro(hd44780_I2Cexp lcd){
  String projectName = PROJECT_NAME;
  String version = VERSION;
  
	lcd.clear(); 
	lcd.setCursor(0, 0);
	lcd.print("TMEeducation.com");
  
	lcd.setCursor(0, 1);
  for(int i = 0; i < (16 - projectName.length()) / 2; i++){
    lcd.print(" ");
  }
	lcd.print(PROJECT_NAME);
  
	delay(2500);
  
	lcd.setCursor(0, 1);
  lcd.print("                ");
  
  lcd.setCursor(0, 1);
  for(int i = 0; i < (16 - version.length()) / 2; i++){
    lcd.print(" ");
  }
	lcd.print(VERSION);

	delay(2500);  
  lcd.clear();
  delay(100);
}
  ''';

  static const include = '''
    
/*  TME EDUCATION
 *  Includes from Library Manager
 *  v1.0.0
 *  -------------
 *  The libraries listed below are the basic 
 *  source of tools that we can use in our programs
 */
#include <Adafruit_SSD1306.h> //In this header file we have to comment "#define SSD1306_128_32", and uncoment "#define SSD1306_128_64"
#include <Adafruit_GFX.h>
#include <Wire.h>
#include <hd44780.h>
#include <hd44780ioClass/hd44780_I2Cexp.h>
#include <Adafruit_MCP23008.h>
#include <Adafruit_NeoPixel.h>
#include "intro.h"

  ''';
  static const blink = '''
/*
 * TME Education Ethiopia
 * www.tmeeducation.com
 * This code is proudly made by Robe getachew on Augest 23
 * Pulse readng example 
*/

int pin = 7;
unsigned long duration;

void setup() {
  Serial.begin(9600);
  pinMode(pin, INPUT);
}

void loop() {
  duration = pulseIn(pin, HIGH);
  Serial.println(duration);
}
       ''';
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static const segment7 = ''' 
/*
 * TME Education Ethiopia
 * www.tmeeducation.com
 * This code is proudly made by Tesfamichael Mola on Sptember 14
 * &-segment display practice
*/


#include "Adafruit_MCP23008.h"

Adafruit_MCP23008 mcp;

uint8_t seg7[11] = {
  B11111100, // 0
  B01100000, // 1
  B11011010, // 2
  B11110010, // 3
  B01100110, // 4
  B10110110, // 5
  B10111110, // 6
  B11100000, // 7
  B11111110, // 8
  B11110110, // 9
  B01100001  // 1. (10)
};

void setup() {
  // put your setup code here, to run once:
  mcp.begin(0x4); // offset above 0x20 (lowest address)
  mcp.pinMode(0, OUTPUT);
  mcp.pinMode(1, OUTPUT);
  mcp.pinMode(2, OUTPUT);
  mcp.pinMode(3, OUTPUT);
  mcp.pinMode(4, OUTPUT);
  mcp.pinMode(5, OUTPUT);
  mcp.pinMode(6, OUTPUT);
  mcp.pinMode(7, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
 zero();
 delay(1000);
 clear1();
 delay(1000);
 one();
 delay(1000);
 clear1();
  delay(1000);
 two();
 delay(1000);
 clear1();
 delay(1000);
 three();
 delay(1000);
 clear1();
 delay(1000);
 four();
 delay(1000);
 clear1();
 delay(1000);
 five();
 delay(1000);
 clear1();
 delay(1000);
 six();
 delay(1000);
 clear1();
 delay(1000);
 seven();
 delay(1000);
 clear1();
 delay(1000);
 eight();
 delay(1000);
 clear1();
 delay(1000);
 nine();
 delay(1000);
 clear1();
 delay(1000);
}


void clear1(){
for (int i =0; i<8; i++){
   mcp.digitalWrite(i, false);
  }
  }

  ///////// zero /////////
void zero(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, true);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, false);
  }

  ////////    one    ///////
  
  void one(){
  mcp.digitalWrite(0, false);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, false);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, false);
  mcp.digitalWrite(6, false);
  }

////////////   two     ////////////
void two(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, false);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, true);
  mcp.digitalWrite(5, false);
  mcp.digitalWrite(6, true);
  }


//////////////    three   //////////////

void three(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, false);
  mcp.digitalWrite(6, true);
  }


  ///////////// four    ////////////////
  void four(){
  mcp.digitalWrite(0, false);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, false);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, true);
  }


  //////////////////    five    ////////

 void five(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, false);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, true);
  }


  /////////////////   six    /////////////////

  void six(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, false);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, true);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, true);
  }


  ////////////////   seven  ////////////////

  void seven(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, false);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, false);
  mcp.digitalWrite(6, false);
  }


  ///////////////   eight  //////// 

  void eight(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, true);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, true);
  }

////////////////   nine    /////////////

void nine(){
  mcp.digitalWrite(0, true);
  mcp.digitalWrite(1, true);
  mcp.digitalWrite(2, true);
  mcp.digitalWrite(3, true);
  mcp.digitalWrite(4, false);
  mcp.digitalWrite(5, true);
  mcp.digitalWrite(6, true);
  }
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////
  static const bouncing_ball = '''
/*
 * TME Education, 2020.
 * Made by tesfamichael Molla Ali, TME Education Ambassador in Ethiopia.
 * Bouncing ball using OLED display.
*/

// Declearing libraries
#include <Wire.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
#define OLED_RESET     4 
// Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

int x = 10, y = 10;   // X and Y Coordinates
int vx = 3, vy = 1;   // X and Y velocities

void setup() {
  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3D for 128x64
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
  delay(2000); // Pause for 2 seconds

  // Clear the buffer
  display.clearDisplay();

}

void loop() {
  // put your main code here, to run repeatedly:
  display.clearDisplay();
  moves();  // Update coordinates
  display.fillCircle(x, y, 1, WHITE);    // Create the circle with new coordinates
  display.display();    // Update screen
  
}

void moves() {
  // move to the prefered position based on velocities
    x += vx;
    y += vy;

  
  // Handle jumping out of the screen 
    if( 0 > x || x >= SCREEN_WIDTH ) {
       vx = -vx;
       x = -x;
       if( 0 > x ) 
          x += SCREEN_WIDTH << 1;
    }

    if( 0 > y || y >= SCREEN_HEIGHT ) {
       vy = -vy;
       y = -y;
       if( 0 > y )
          y += SCREEN_HEIGHT << 1;
    }
 
}
  ''';

  ///////////////////////////////////////////////////////////////////////////////////////////

  static const car_game = '''
  /*
 * TME Education, 2020.
 * Made by tesfamichael Molla Ali, TME Education Ambassador in Ethiopia.
 * Car game using OLED display.
*/ 
#include <Wire.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4
#define INPUTPIN 8
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);

struct Obstacle {
  const uint8_t* bitmap;
  bool active;
  int posx;
  int posy;
}obstacle1,obstacle2,obstacle3;

// 15x25px
const unsigned char playerBitmap [] PROGMEM = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x80, 0x07, 0xc0, 
  0x06, 0xc0, 0x04, 0x00, 0x05, 0x60, 0x07, 0xc0, 0x04, 0x40, 0x07, 0xc0, 0x07, 0xc0, 0x05, 0x40, 
  0x04, 0x40, 0x07, 0xc0, 0x03, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00
};

// 'my', 128x64px
const unsigned char gameOver [] PROGMEM = {
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0x80, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfc, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfd, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfd, 0xff, 0x1f, 0xfe, 0xff, 0xf7, 0xef, 0xe0, 0x3e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xfc, 0xe7, 0xfc, 0x7f, 0xe3, 0xc7, 0xdf, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfd, 0xfb, 0xff, 0xfb, 0xbf, 0xdd, 0xb7, 0xbf, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfd, 0xf7, 0xbd, 0xfb, 0xbf, 0xdd, 0xbb, 0xb8, 0x1e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfd, 0xf6, 0x4d, 0xf7, 0xff, 0xdd, 0xfb, 0xb8, 0x7e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xe6, 0xed, 0xf7, 0xff, 0xde, 0x7b, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0xf1, 0xfe, 0xdf, 0xfe, 0x7b, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xef, 0xff, 0xec, 0xef, 0xbe, 0x7d, 0xb8, 0x3e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xef, 0xff, 0xed, 0x6f, 0xb7, 0xcd, 0xbf, 0xbe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0xbd, 0xcd, 0x67, 0xb3, 0xcd, 0xbf, 0xbe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0xbe, 0xd9, 0xf7, 0xb3, 0xcd, 0xb8, 0x7e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0x8e, 0x9f, 0xf7, 0x61, 0xaf, 0xbf, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xe6, 0xee, 0xbf, 0xfb, 0x6d, 0xbf, 0xbf, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf6, 0x4d, 0xb0, 0x0b, 0x6c, 0x77, 0xbb, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf3, 0xbd, 0x77, 0xdb, 0x6f, 0xf6, 0xb8, 0x1e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xfb, 0xfb, 0x6f, 0xdd, 0x6f, 0xf6, 0xbf, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xfc, 0xe7, 0x2f, 0xeb, 0x1f, 0xf0, 0xdf, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xff, 0x1f, 0x9f, 0xf7, 0xbf, 0xf9, 0xe0, 0x3e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xfe, 0x07, 0xc7, 0xf8, 0x60, 0x06, 0x00, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf9, 0xf9, 0x97, 0xfb, 0x6f, 0xf6, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf3, 0xfc, 0x9a, 0xf3, 0x60, 0x56, 0xff, 0x9e, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf7, 0x06, 0xdb, 0xf6, 0x68, 0x0e, 0xc1, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf6, 0xf7, 0x5d, 0xf6, 0xed, 0xfe, 0xde, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xe6, 0xfb, 0x6d, 0xe6, 0xed, 0xfe, 0xde, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0xfb, 0x6c, 0xef, 0xe9, 0xfe, 0xde, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xec, 0xfb, 0x7e, 0xcf, 0xe8, 0x0e, 0xdc, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xef, 0xfb, 0x76, 0xdf, 0xef, 0xee, 0xdb, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xef, 0xff, 0x76, 0xdb, 0xef, 0xee, 0xff, 0xbe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xec, 0xff, 0x77, 0x5b, 0xec, 0x0e, 0xff, 0xbe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xe4, 0xfb, 0x7b, 0x33, 0xed, 0xfe, 0xc1, 0xbe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xee, 0xfb, 0x7b, 0xb7, 0xfd, 0xfe, 0xdd, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xe6, 0xfb, 0x7d, 0xf7, 0xfd, 0xfe, 0xde, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf6, 0xf7, 0x7d, 0xef, 0xff, 0xfe, 0xde, 0xdf, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfc, 0xf3, 0x0e, 0xfc, 0x2f, 0xec, 0x02, 0xde, 0xde, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xfb, 0xff, 0xfe, 0xcf, 0xef, 0xf6, 0xde, 0xdf, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xfc, 0xfb, 0xfe, 0xdf, 0xef, 0xf6, 0xde, 0xdf, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xfe, 0x07, 0xff, 0x1f, 0xe0, 0x06, 0x1e, 0x3f, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0xff, 0xbf, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0x7f, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0x06, 0x38, 0x07, 0x1c, 0x00, 0x08, 0x18, 0xf0, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xc2, 0x10, 0x01, 0x04, 0x00, 0x0c, 0x00, 0x63, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf0, 0x13, 0xf2, 0x41, 0xff, 0xff, 0x80, 0x27, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf2, 0x03, 0xf2, 0x49, 0xff, 0xff, 0x80, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf2, 0x47, 0xf2, 0x49, 0xff, 0xff, 0xc2, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf2, 0x7f, 0xf2, 0x41, 0xff, 0xff, 0xe6, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf2, 0x7f, 0xf2, 0x61, 0xff, 0xff, 0xfe, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xf0, 0xff, 0xf2, 0x7f, 0xff, 0xff, 0xfe, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xfa, 0x7f, 0xff, 0xff, 0xfe, 0x67, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf8, 0x7f, 0xff, 0xff, 0xff, 0x0f, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfc, 0xff, 0xff, 0xff, 0xff, 0x1f, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 
  0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
};




void setup() {
  
  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3D for 128x64
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  display.display();
  delay(10); // Pause for 2 seconds
  Serial.begin(9600);
  pinMode(A1, INPUT);
  

}
bool obstacle = false;
int lposx, lposy;
int wid = 20, hig = 10;
int del = 1, score  = 0;
void loop() {
  display.clearDisplay();
  display.drawLine(34,0,34,64, WHITE);
  display.drawLine(94,0,94,64, WHITE);
  lineDrawer();
  drawPlayer(playerPose());
  drawObstacle();
  check();
  display.setTextColor(WHITE);
  display.setTextSize(1.0);
  display.setCursor(0,20); 
  display.print("score");
  display.setCursor(5,30); 
  display.print(score);
  display.display();
  delay(100);

  
  }
 void(*resetFunc) (void) = 0;
  void check(){
   if ((playerPose() >= lposx) && (playerPose() <= lposx+wid)){
    if (lposy>50){
      display.clearDisplay();
      display.drawBitmap(0, 0,  gameOver, 128, 64, WHITE);
      display.display();
      delay(1000);
      score = 0;
      resetFunc();
    }
   }
  }

 
  
  void drawObstacle(){

   if (obstacle == false){
    obstacle = true;
    lposx = randomGen();
    lposy = 0;
    display.fillRect(lposx, lposy, wid, hig, WHITE);
   }

   else {
      if (lposy<64){
        display.fillRect(lposx, nextypose(), wid, hig, WHITE);
        display.display();
        score++;
      }

        else{
          obstacle = false;
        }
   }

    
  }

 int nextypose(){
  int temp = millis()/1000;
  if ( temp >= 5)
      del = 2;
  if (temp >= 15)
      del = 4;
  if (temp >= 25)
      del = 6;
  if (temp >= 35)
      del = 8;
  if (temp >= 45)
      del = 10;
  lposy = lposy + del;
  return lposy;
 }

  

  int playerPose(){
    return map(analogRead(A1),0,1023,34,80);
  }

  void drawPlayer(int pose){
    display.drawBitmap(pose, 45,  playerBitmap, 15, 25, WHITE);
  }

  void lineDrawer(){
        if (millis()%3 == 0){
            //display.clearDisplay();
            drawLines1();
            display.display();
        }
    
        else if (millis()%3 == 1){
          //display.clearDisplay();
          drawLines2();
          display.display();
        }

        else {
          //display.clearDisplay();
          drawLines3();
          display.display();
        }
    
    }
  

  void drawLines1(){
   display.drawLine(64,0,64,10, WHITE);
   display.drawLine(64,15,64,25, WHITE);
   display.drawLine(64,30,64,40, WHITE);
   display.drawLine(64,45,64,55, WHITE);
   display.drawLine(64,60,64,64, WHITE);
   
  }

  void drawLines2(){
   display.drawLine(64,0,64,5, WHITE);
   display.drawLine(64,10,64,20, WHITE);
   display.drawLine(64,25,64,35, WHITE);
   display.drawLine(64,40,64,50, WHITE);
   display.drawLine(64,55,64,64, WHITE);
  }


  void drawLines3(){
   display.drawLine(64,0,64,8, WHITE);
   display.drawLine(64,13,64,23, WHITE);
   display.drawLine(64,28,64,38, WHITE);
   display.drawLine(64,43,64,53, WHITE);
   display.drawLine(64,58,64,64, WHITE);
  }

  int randomGen(){
    return random(34,80);
  }
  ''';

  ////////////////////////////////////////////////////////////////////////////////////

  static const segment_microphone = '''
/*  TME EDUCATION
 *  7Seg-Microphone
 *  v0.1.0
 *  -------------
 *  In this program we will count the tapping on the microphone on the 7-segment display.
 */ 

#define PROJECT_NAME "7Seg-Mic"
#define VERSION "v0.1.0"

////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define MICROPHONE 0


////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate
#define SENSITIVITY 50 //using the previous program "10_Speaker-Potentiometer" 
                       //Select the appropriate value of the microphone sensitivity.

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_MCP23008 seg;
int i = 0;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  //we give the address of the display.
  seg.begin(0x4);

  //From now on, we're dealing with it the same as with diodes.
  for(int i = 0; i < 8; i++)
    seg.pinMode(i, OUTPUT);
  
  count(0);
}

void loop(){
  if(analogRead(MICROPHONE) > SENSITIVITY){
    i++;
    if(i > 9){
      i = 0;
    }
    
    count(i);
    delay(500);
  }
}

void count(int digit){  
  uint8_t data = 0; //uint8_t - an unsigned 8-bit integer

  //The manner of influencing the values of the respective bits on the display has been explained
  //in the graphics attached to the project.

  //switch-case allows us to choose the way the program works depending on the value we give to it
  //As you can see, a few numbers do not display correctly. Can you correct them?
  switch(digit){
    case 0:
      data = B11111100;
      break;
    case 1:
      data = B01100000;
      break;
    case 2:
      data = B11011010;
      break;
    case 3:
      data = B01110011;
      break;
    case 4:
      data = B01100110;
      break;
    case 5:
      data = B10100100;
      break;
    case 6:
      data = B11011110;
      break;
    case 7:
      data = B11100000;
      break;
    case 8:
      data = B11111110;
      break;
    case 9:
      data = B11110110;
      break;
  }

  //The bitRead() method allows us to read a specific bit from a variable. bitRead(variable, bitNumber)
  for(int i = 0; i < 8; i++)
    seg.digitalWrite(i, bitRead(data, 7 - i));
}

  ''';

  ///////////////////////////////////////////////////////////////////////////////////////////////////
  static const eightBall = '''
  
#define BMPWIDTH  64
#define BMPHEIGHT 64
const unsigned char bitmap[] PROGMEM = {
  0x00,0x00,0x00,0x03,0xE0,0x00,0x00,0x00,
  0x00,0x00,0x00,0xFF,0xFF,0x80,0x00,0x00,
  0x00,0x00,0x07,0xFF,0xFF,0xF0,0x00,0x00,
  0x00,0x00,0x1F,0xFF,0xFF,0xFC,0x00,0x00,
  0x00,0x00,0x7F,0xFF,0xFF,0xFF,0x00,0x00,
  0x00,0x01,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,
  0x00,0x03,0xFF,0xFF,0xFF,0xFF,0xE0,0x00,
  0x00,0x0F,0xFF,0xFF,0xE0,0xFF,0xF8,0x00,
  0x00,0x1F,0xFF,0xFE,0x00,0x0F,0xFC,0x00,
  0x00,0x3F,0xFF,0xF8,0x00,0x03,0xFE,0x00,
  0x00,0x7F,0xFF,0xF0,0x00,0x01,0xFF,0x00,
  0x00,0xFF,0xFF,0xC0,0x00,0x00,0x7F,0x80,
  0x01,0xFF,0xFF,0x81,0xF0,0x00,0x3F,0xC0,
  0x01,0xFF,0xFF,0x03,0xF8,0x00,0x1F,0xC0,
  0x03,0xFF,0xFF,0x07,0xFC,0x00,0x1F,0xE0,
  0x07,0xFF,0xFE,0x0E,0x0E,0x00,0x0F,0xF0,
  0x07,0xFF,0xFC,0x1C,0x07,0x00,0x07,0xF0,
  0x0F,0xFF,0xFC,0x1C,0x07,0x00,0x07,0xF8,
  0x0F,0xFF,0xF8,0x1C,0x07,0x00,0x03,0xF8,
  0x1F,0xFF,0xF8,0x1C,0x07,0x00,0x03,0xFC,
  0x1F,0xFF,0xF8,0x1C,0x07,0x70,0x03,0xFC,
  0x3F,0xFF,0xF8,0x0E,0x0F,0xFC,0x03,0xFE,
  0x3F,0xFF,0xF0,0x07,0xFF,0xFF,0x01,0xFE,
  0x3F,0xFF,0xF0,0x03,0xFF,0x07,0x01,0xFE,
  0x7F,0xFF,0xF0,0x01,0xFE,0x03,0x81,0xFF,
  0x7F,0xFF,0xF0,0x00,0x0C,0x01,0x81,0xFF,
  0x7F,0xFF,0xF0,0x00,0x1C,0x01,0xC1,0xFF,
  0x7F,0xFF,0xF8,0x00,0x1C,0x01,0xC3,0xFF,
  0x7F,0xFF,0xF8,0x00,0x1C,0x01,0xC3,0xFF,
  0x7F,0xFF,0xF8,0x00,0x0C,0x01,0x83,0xFF,
  0xFF,0xFF,0xF8,0x00,0x0E,0x03,0x83,0xFF,
  0xFF,0xFF,0xFC,0x00,0x07,0x07,0x07,0xFF,
  0xFF,0xFF,0xFC,0x00,0x07,0xFF,0x07,0xFF,
  0xFF,0xFF,0xFE,0x00,0x01,0xFC,0x0F,0xFF,
  0xFF,0xFF,0xFF,0x00,0x00,0x70,0x1F,0xFF,
  0x7F,0xFF,0xFF,0x00,0x00,0x00,0x1F,0xFF,
  0x7F,0xFF,0xFF,0x80,0x00,0x00,0x3F,0xFF,
  0x7F,0xFF,0xFF,0xC0,0x00,0x00,0x7F,0xFF,
  0x7F,0xFF,0xFF,0xF0,0x00,0x01,0xFF,0xFF,
  0x7F,0xFF,0xFF,0xF8,0x00,0x03,0xFF,0xFF,
  0x7F,0xFF,0xFF,0xFE,0x00,0x0F,0xFF,0xFF,
  0x3F,0xFF,0xFF,0xFF,0xE0,0xFF,0xFF,0xFE,
  0x3F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFE,
  0x3F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFE,
  0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFC,
  0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFC,
  0x0F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
  0x0F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
  0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF0,
  0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF0,
  0x03,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xE0,
  0x01,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,
  0x01,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,
  0x00,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x80,
  0x00,0x7F,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,
  0x00,0x3F,0xFF,0xFF,0xFF,0xFF,0xFE,0x00,
  0x00,0x1F,0xFF,0xFF,0xFF,0xFF,0xFC,0x00,
  0x00,0x0F,0xFF,0xFF,0xFF,0xFF,0xF8,0x00,
  0x00,0x03,0xFF,0xFF,0xFF,0xFF,0xE0,0x00,
  0x00,0x01,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,
  0x00,0x00,0x7F,0xFF,0xFF,0xFF,0x00,0x00,
  0x00,0x00,0x1F,0xFF,0xFF,0xFC,0x00,0x00,
  0x00,0x00,0x07,0xFF,0xFF,0xF0,0x00,0x00,
  0x00,0x00,0x00,0xFF,0xFF,0x80,0x00,0x00 
};
  ''';
  /////////////////////////////////////////////////////////////////////////////////////////////////////

  static const ask8ball = ''' 
  /*  TME EDUCATION
 *  8Ball
 *  v0.1.1
 *  -------------
 *  Using this program you can ask for everything.
 */ 

#define PROJECT_NAME "8Ball"
#define VERSION "v0.1.1"

#include "includes.h"
#include "8ball.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_CENTER 8
#define BUZZER 2
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);
  pinMode(KEY_CENTER, INPUT);
  pinMode(BUZZER, OUTPUT);
  
  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();

  lcd.clear();
  lcd.print("  Press center");
  lcd.setCursor(0, 1);
  lcd.print("     to ask");

  display.setTextColor(1); 
  display.setTextSize(2);

  randomSeed(analogRead(0));
}

void loop(){
  if(digitalRead(KEY_CENTER)){
    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(100);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(200);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(300);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);    
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(400);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(600);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(800);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1000);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30 + random(0, 30), -15 + random(0, 30), bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1000);

    display.clearDisplay();
    display.fillRect(0, 0, 128, 64, 1);
    display.drawBitmap(30, 0, bitmap, BMPWIDTH, BMPHEIGHT, 0);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1500);

    display.clearDisplay();
    display.setCursor(0, 0);
    switch(random(1, 10)){
      case 1: display.print("Without   a doubt."); break;
      case 2: display.print("As I      see it,   Yes."); break;
      case 3: display.print("Don't     count on  it."); break;
      case 4: display.print("Reply hazy try again."); break;
      case 5: display.print("Signs     point to  yes."); break;
      case 6: display.print("Yes       definitely."); break;
      case 7: display.print("Ask again."); break;
      case 8: display.print("My reply  is no."); break;
      case 9: display.print("You may   rely on   it."); break;
    }
    display.display();
  }
}

  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////

  static const button_led = '''
/*  TME EDUCATION
 *  Buttons-LED
 *  v0.1.0
 *  -------------
 *  In this program, we will combine the skill of operating the led strip with the buttons located on the TME board
 */ 
#define PROJECT_NAME "Buttons-LED"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_UP 6
#define KEY_DOWN 5
#define KEY_LEFT 4
#define KEY_RIGHT 7
#define KEY_CENTER 8
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_NeoPixel ledStrip = Adafruit_NeoPixel(5, 12, NEO_GRB + NEO_KHZ800);

//We want the program to enable us to turn off the LEDs, 
//change their color and brightness, therefore we declare below three variables
boolean show = true; // on/off
int value = 100;     // brightness
int color = 100;     // color

void setup(){
  Serial.begin(9600);
  lcd.begin(16, 2);
  intro(lcd);

  //The buttons are connected to the appropriate pins defined above in the "CONSTANTS" section. 
  //If the button is pressed, the signal comes to the Arduino, so we have to pass on to our program 
  //at first that we should treat the pins as inputs. We do this using the pinMode() method
  pinMode(KEY_RIGHT , INPUT);
  pinMode(KEY_LEFT , INPUT);
  pinMode(KEY_UP , INPUT);
  pinMode(KEY_DOWN , INPUT);
  pinMode(KEY_CENTER , INPUT);

  ledStrip.begin();
}

void loop(){
  delay(10);
  //To read whether a given button is pressed, read the value of a given pin using the digitalRea() method. 
  //After pressing one of the buttons, the appropriate value from the three previously declared variables changes.

  ////////////////////////////////////////////////////  ON / OFF
  if(digitalRead(KEY_CENTER)){
    show = !show;
    //check what happens if you delete the line with a delay method below.
    //The explanation can be found in the file "explaination.png", which is located in the folder with the project
    delay(500);
  }
  ////////////////////////////////////////////////////  BRIGHTNESS ++
  if(digitalRead(KEY_UP) && value < 255){
    value++;
  }
  ////////////////////////////////////////////////////  BRIGHTNESS --
  if(digitalRead(KEY_DOWN) && value > 0){
    value--;
  }
  ////////////////////////////////////////////////////  COLOR ++
  if(digitalRead(KEY_LEFT) && color < 255 ){
    color++;
  }
  ////////////////////////////////////////////////////  COLOR --
  if(digitalRead(KEY_RIGHT) && color > 0){
    color--;
  }

  //At the very end of the loop, after changing the value of any of the variables, we set the diode parameters to current. 
  //You may have noticed that to turn off the diode, I used a method that reduces its brightness to zero.  
  for (int i = 0; i < 5 ; i++){
  ledStrip.setPixelColor(i, 50, color, 100);
  ledStrip.setBrightness(value);
  if(!show){
    ledStrip.setBrightness(0);
  }
  ledStrip.show();
}
}
  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////

  static const buzzer_potentiometer = '''
  /*  TME EDUCATION
 *  Speaker-Potentiometer
 *  v0.1.0
 *  -------------
 *  In this program you can control the frequency of the beeps. It's almost like a Geiger-Müller sensor.
 */ 
#define PROJECT_NAME "Speaker-Potentio"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define SPEAKER 2
#define POTENTIOMETER A1

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  //The built-in loudspeaker has a built-in generator so we can not control its frequency. 
  //On the other hand, its use is as simple as the use of LEDs. See for yourself how the program looks like.
  //Your task: Try to make two faster beeps at each interval.
  pinMode(SPEAKER, OUTPUT);  
}

void loop(){
  delay(analogRead(POTENTIOMETER));
  bip();
}

void bip(){
  digitalWrite(SPEAKER, HIGH);
  delay(10);
  digitalWrite(SPEAKER, LOW);
}

  ''';
  ////////////////////////////////////////////////////////////////////////////////////////////////
  static const song = '''


//#define SONG "The Simpsons:d=4,o=5,b=160:c.6,e6,f#6,8a6,g.6,e6,c6,8a,8f#,8f#,8f#,2g,8p,8p,8f#,8f#,8f#,8g,a#.,8c6,8c6,8c6,c6";
//#define SONG "Indiana:d=4,o=5,b=250:e,8p,8f,8g,8p,1c6,8p.,d,8p,8e,1f,p.,g,8p,8a,8b,8p,1f6,p,a,8p,8b,2c6,2d6,2e6,e,8p,8f,8g,8p,1c6,p,d6,8p,8e6,1f.6,g,8p,8g,e.6,8p,d6,8p,8g,e.6,8p,d6,8p,8g,f.6,8p,e6,8p,8d6,2c6";
//#define SONG "TakeOnMe:d=4,o=4,b=160:8f#5,8f#5,8f#5,8d5,8p,8b,8p,8e5,8p,8e5,8p,8e5,8g#5,8g#5,8a5,8b5,8a5,8a5,8a5,8e5,8p,8d5,8p,8f#5,8p,8f#5,8p,8f#5,8e5,8e5,8f#5,8e5,8f#5,8f#5,8f#5,8d5,8p,8b,8p,8e5,8p,8e5,8p,8e5,8g#5,8g#5,8a5,8b5,8a5,8a5,8a5,8e5,8p,8d5,8p,8f#5,8p,8f#5,8p,8f#5,8e5,8e5";
//#define SONG "Entertainer:d=4,o=5,b=140:8d,8d#,8e,c6,8e,c6,8e,2c.6,8c6,8d6,8d#6,8e6,8c6,8d6,e6,8b,d6,2c6,p,8d,8d#,8e,c6,8e,c6,8e,2c.6,8p,8a,8g,8f#,8a,8c6,e6,8d6,8c6,8a,2d6";
//#define SONG "Muppets:d=4,o=5,b=250:c6,c6,a,b,8a,b,g,p,c6,c6,a,8b,8a,8p,g.,p,e,e,g,f,8e,f,8c6,8c,8d,e,8e,8e,8p,8e,g,2p,c6,c6,a,b,8a,b,g,p,c6,c6,a,8b,a,g.,p,e,e,g,f,8e,f,8c6,8c,8d,e,8e,d,8d,c";
//#define SONG "Xfiles:d=4,o=5,b=125:e,b,a,b,d6,2b.,1p,e,b,a,b,e6,2b.,1p,g6,f#6,e6,d6,e6,2b.,1p,g6,f#6,e6,d6,f#6,2b.,1p,e,b,a,b,d6,2b.,1p,e,b,a,b,e6,2b.,1p,e6,2b.";
//#define SONG "Looney:d=4,o=5,b=140:32p,c6,8f6,8e6,8d6,8c6,a.,8c6,8f6,8e6,8d6,8d#6,e.6,8e6,8e6,8c6,8d6,8c6,8e6,8c6,8d6,8a,8c6,8g,8a#,8a,8f";
//#define SONG "20thCenFox:d=16,o=5,b=140:b,8p,b,b,2b,p,c6,32p,b,32p,c6,32p,b,32p,c6,32p,b,8p,b,b,b,32p,b,32p,b,32p,b,32p,b,32p,b,32p,b,32p,g#,32p,a,32p,b,8p,b,b,2b,4p,8e,8g#,8b,1c#6,8f#,8a,8c#6,1e6,8a,8c#6,8e6,1e6,8b,8g#,8a,2b";
//#define SONG "Bond:d=4,o=5,b=80:32p,16c#6,32d#6,32d#6,16d#6,8d#6,16c#6,16c#6,16c#6,16c#6,32e6,32e6,16e6,8e6,16d#6,16d#6,16d#6,16c#6,32d#6,32d#6,16d#6,8d#6,16c#6,16c#6,16c#6,16c#6,32e6,32e6,16e6,8e6,16d#6,16d6,16c#6,16c#7,c.7,16g#6,16f#6,g#.6";
//#define SONG "MASH:d=8,o=5,b=140:4a,4g,f#,g,p,f#,p,g,p,f#,p,2e.,p,f#,e,4f#,e,f#,p,e,p,4d.,p,f#,4e,d,e,p,d,p,e,p,d,p,2c#.,p,d,c#,4d,c#,d,p,e,p,4f#,p,a,p,4b,a,b,p,a,p,b,p,2a.,4p,a,b,a,4b,a,b,p,2a.,a,4f#,a,b,p,d6,p,4e.6,d6,b,p,a,p,2b";
//#define SONG "StarWars:d=4,o=5,b=45:32p,32f#,32f#,32f#,8b.,8f#.6,32e6,32d#6,32c#6,8b.6,16f#.6,32e6,32d#6,32c#6,8b.6,16f#.6,32e6,32d#6,32e6,8c#.6,32f#,32f#,32f#,8b.,8f#.6,32e6,32d#6,32c#6,8b.6,16f#.6,32e6,32d#6,32c#6,8b.6,16f#.6,32e6,32d#6,32e6,8c#6"
//#define SONG "Back to the Future:d=16,o=5,b=200:4g.,p,4c.,p,2f#.,p,g.,p,a.,p,8g,p,8e,p,8c,p,4f#,p,g.,p,a.,p,8g.,p,8d.,p,8g.,p,8d.6,p,4d.6,p,4c#6,p,b.,p,c#.6,p,2d.6"
//#define SONG "GoodBad:d=4,o=5,b=56:32p,32a#,32d#6,32a#,32d#6,8a#.,16f#.,16g#.,d#,32a#,32d#6,32a#,32d#6,8a#.,16f#.,16g#.,c#6,32a#,32d#6,32a#,32d#6,8a#.,16f#.,32f.,32d#.,c#,32a#,32d#6,32a#,32d#6,8a#.,16g#.,d#";
//#define SONG "TopGun:d=4,o=4,b=31:32p,16c#,16g#,16g#,32f#,32f,32f#,32f,16d#,16d#,32c#,32d#,16f,32d#,32f,16f#,32f,32c#,16f,d#,16c#,16g#,16g#,32f#,32f,32f#,32f,16d#,16d#,32c#,32d#,16f,32d#,32f,16f#,32f,32c#,g#";
//#define SONG "A-Team:d=8,o=5,b=125:4d#6,a#,2d#6,16p,g#,4a#,4d#.,p,16g,16a#,d#6,a#,f6,2d#6,16p,c#.6,16c6,16a#,g#.,2a#";
//#define SONG "Flinstones:d=4,o=5,b=40:32p,16f6,16a#,16a#6,32g6,16f6,16a#.,16f6,32d#6,32d6,32d6,32d#6,32f6,16a#,16c6,d6,16f6,16a#.,16a#6,32g6,16f6,16a#.,32f6,32f6,32d#6,32d6,32d6,32d#6,32f6,16a#,16c6,a#,16a6,16d.6,16a#6,32a6,32a6,32g6,32f#6,32a6,8g6,16g6,16c.6,32a6,32a6,32g6,32g6,32f6,32e6,32g6,8f6,16f6,16a#.,16a#6,32g6,16f6,16a#.,16f6,32d#6,32d6,32d6,32d#6,32f6,16a#,16c.6,32d6,32d#6,32f6,16a#,16c.6,32d6,32d#6,32f6,16a#6,16c7,8a#.6";
//#define SONG "Jeopardy:d=4,o=6,b=125:c,f,c,f5,c,f,2c,c,f,c,f,a.,8g,8f,8e,8d,8c#,c,f,c,f5,c,f,2c,f.,8d,c,a#5,a5,g5,f5,p,d#,g#,d#,g#5,d#,g#,2d#,d#,g#,d#,g#,c.7,8a#,8g#,8g,8f,8e,d#,g#,d#,g#5,d#,g#,2d#,g#.,8f,d#,c#,c,p,a#5,p,g#.5,d#,g#";
//#define SONG "Gadget:d=16,o=5,b=50:32d#,32f,32f#,32g#,a#,f#,a,f,g#,f#,32d#,32f,32f#,32g#,a#,d#6,4d6,32d#,32f,32f#,32g#,a#,f#,a,f,g#,f#,8d#";
//#define SONG "Smurfs:d=32,o=5,b=200:4c#6,16p,4f#6,p,16c#6,p,8d#6,p,8b,p,4g#,16p,4c#6,p,16a#,p,8f#,p,8a#,p,4g#,4p,g#,p,a#,p,b,p,c6,p,4c#6,16p,4f#6,p,16c#6,p,8d#6,p,8b,p,4g#,16p,4c#6,p,16a#,p,8b,p,8f,p,4f#";
//#define SONG "MahnaMahna:d=16,o=6,b=125:c#,c.,b5,8a#.5,8f.,4g#,a#,g.,4d#,8p,c#,c.,b5,8a#.5,8f.,g#.,8a#.,4g,8p,c#,c.,b5,8a#.5,8f.,4g#,f,g.,8d#.,f,g.,8d#.,f,8g,8d#.,f,8g,d#,8c,a#5,8d#.,8d#.,4d#,8d#.";
//#define SONG "LeisureSuit:d=16,o=6,b=56:f.5,f#.5,g.5,g#5,32a#5,f5,g#.5,a#.5,32f5,g#5,32a#5,g#5,8c#.,a#5,32c#,a5,a#.5,c#.,32a5,a#5,32c#,d#,8e,c#.,f.,f.,f.,f.,f,32e,d#,8d,a#.5,e,32f,e,32f,c#,d#.,c#";
#define SONG "MissionImp:d=16,o=6,b=95:32d,32d#,32d,32d#,32d,32d#,32d,32d#,32d,32d,32d#,32e,32f,32f#,32g,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,a#,g,2d,32p,a#,g,2c#,32p,a#,g,2c,a#5,8c,2p,32p,a#5,g5,2f#,32p,a#5,g5,2f,32p,a#5,g5,2e,d#,8d";
//#define SONG "smbdeath:d=4,o=5,b=90:32c6,32c6,32c6,8p,16b,16f6,16p,16f6,16f.6,16e.6,16d6,16c6,16p,16e,16p,16c";
//#define SONG "Monty P:d=4,o=5,b=200:f6,8e6,d6,8c#6,c6,8b,a#,8a,8g,8a,8a#,a,8g,2c6,8p,8c6,8a,8p,8a,8a,8g#,8a,8f6,8p,8c6,8c6,8p,8a,8a#,8p,8a#,8a#,8p,8c6,2d6,8p,8a#,8g,8p,8g,8g,8f#,8g,8e6,8p,8d6,8d6,8p,8a#,8a,8p,8a,8a,8p,8a#,2c6,8p,8c6";
//#define SONG "Yaketysax:d=4,o=5,b=125:8d.,16e,8g,8g,16e,16d,16a4,16b4,16d,16b4,8e,16d,16b4,16a4,16b4,8a4,16a4,16a#4,16b4,16d,16e,16d,g,p,16d,16e,16d,8g,8g,16e,16d,16a4,16b4,16d,16b4,8e,16d,16b4,16a4,16b4,8d,16d,16d,16f#,16a,8f,d,p,16d,16e,16d,8g,16g,16g,8g,16g,16g,8g,8g,16e,8e.,8c,8c,8c,8c,16e,16g,16a,16g,16a#,8g,16a,16b,16a#,16b,16a,16b,8d6,16a,16b,16d6,8b,8g,8d,16e6,16b,16b,16d,8a,8g,g;"
//#define SONG "YMCA:d=4,o=5,b=160:8c#6,8a#,2p,8a#,8g#,8f#,8g#,8a#,c#6,8a#,c#6,8d#6,8a#,2p,8a#,8g#,8f#,8g#,8a#,c#6,8a#,c#6,8d#6,8b,2p,8b,8a#,8g#,8a#,8b,d#6,8f#6,d#6,f.6,d#.6,c#.6,b.,a#,g#";
//#define SONG "BarbieGirl:d=4,o=5,b=125:8g#,8e,8g#,8c#6,a,p,8f#,8d#,8f#,8b,g#,8f#,8e,p,8e,8c#,f#,c#,p,8f#,8e,g#,f#";
//#define SONG "DarudeS:d=4,o=6,b=112:16d,16d,16d,16d,8d,16d,16d,16d,16d,16d,16d,8d,16g,16g,16g,16g,16g,16g,8g,16f,16f,16f,16f,16f,8f,16c,16c,16d,16d,16d,16d,8d,16d,16d,16d,16d,16d,16d,8d,16f,16d,16d,16d,16d,8d";

  ''';
  //////////////////////////////////////////////////////////////////////////////////////////////////

  static const buzzer_voice = '''
/*  TME EDUCATION
 *  BuzzerMega
 *  v0.1.0
 *  -------------
 *  This program will play everething in RTTTL format
 */ 


#define PROJECT_NAME "BuzzerMega"
#define VERSION "v0.2.0"

#include "includes.h"
#include "song.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

uint16_t noteList[4][12] =  {{261, 277, 293, 311, 329, 349, 370, 392, 415, 440, 466, 493},
                          {523, 554, 587, 622, 659, 698, 740, 784, 830, 880, 932, 987},
                          {1047, 1109, 1175, 1245, 1319, 1397, 1480, 1568, 1661, 1760, 1865, 1976},
                          {2093, 2217, 2349, 2489, 2637, 2794, 2960, 3136, 3322, 3520, 3729, 3951}};

class Rtttl{
  public:
    String name;
    int duration;
    int octave;
    int tempo;
    String notes;

  Rtttl(String song){
    this->name = song.substring(0, song.indexOf(':'));
    this->duration = song.substring(song.indexOf("d=") + 2).toInt();
    this->octave = song.substring(song.indexOf("o=") + 2).toInt();
    this->tempo = song.substring(song.indexOf("b=") + 2).toInt();
    this->notes = song.substring(song.indexOf(":", song.indexOf("b=")) + 1);
    this->notes.replace(" ", "");
  }
  
  void Play(){
    String duration;
    String note;
    String octave;
    bool dot;
    int pitch;
    
    int pointer = 0;
    String token = "";
    
    while(true){
      token = notes.substring(pointer, notes.indexOf(",", pointer));
      
      duration = "";
      note = "";
      octave = "";
      
      int i = 0;
      while(token[i] >= '0' && token[i] <= '9' && i < token.length()){
        if(token[i] == '.'){
          i++;
          break;
        }
        duration += token[i];
        i++;
      }
  
      while((token[i] < '0' || token[i] > '9') && i < token.length()){
        if(token[i] == '.'){
          i++;
          break;
        }
        note += token[i];
        i++;
      }
  
      while(token[i] >= '0' && token[i] <= '9' && i < token.length()){
        if(token[i] == '.'){
          i++;
          break;
        }
        octave += token[i];
        i++;
      }
  
      dot = token.indexOf(".") != -1;
  
      if(duration == ""){
        duration = this->duration;
      }
      if(octave == ""){
        octave = this->octave;
      }
  
      pitch = -1;
      if(note.indexOf("c") != -1)
        pitch = 0;
      if(note.indexOf("c#") != -1)
        pitch = 1;
      if(note.indexOf("d") != -1)
        pitch = 2;
      if(note.indexOf("d#") != -1)
        pitch = 3;
      if(note.indexOf("e") != -1)
        pitch = 4;
      if(note.indexOf("f") != -1)
        pitch = 5;
      if(note.indexOf("f#") != -1)
        pitch = 6;
      if(note.indexOf("g") != -1)
        pitch = 7;
      if(note.indexOf("g#") != -1)
        pitch = 8;
      if(note.indexOf("a") != -1)
        pitch = 9;
      if(note.indexOf("a#") != -1)
        pitch = 10;
      if(note.indexOf("b") != -1)
        pitch = 11;
      if(note.indexOf("p") != -1)
        pitch = 12;

      int durationInt = (60000) / this->tempo * 4 / duration.toInt();
      durationInt = dot ? durationInt + durationInt / 2 : durationInt;
      
      int frequency = noteList[octave.toInt() - 4][pitch];
      if(pitch == 12)
        frequency = 0;
        
      tone(2, frequency, durationInt);
      delay(durationInt);

      pointer = notes.indexOf(",", pointer) + 1;
      if(pointer == 0)
        break;   
    }
    }
};

void setup(){
  Serial.begin(9600);
//  lcd.begin(16, 2);
 // intro(lcd);

  String song = SONG;
  Rtttl rtttl(song);
  rtttl.Play();
}

void loop(){
  
}

  ''';

  ///////////////////////////////////////////////////////////////////////////////////////////////

  static const buzzer_music = '''
  /*  TME EDUCATION
 *  BuzzerMegaShow
 *  v0.1.0
 *  -------------
 *  This program will play everething in RTTTL format
 */ 
#define PROJECT_NAME "BuzzerMegaShow"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define LED_1 13
#define LED_2 9
#define BUZZER 2
#define KEY_LEFT 4
#define KEY_RIGHT 7
#define KEY_CENTER 8

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(0);
boolean status = false;
uint8_t song = 0;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();

  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(BUZZER, OUTPUT);

  pinMode(KEY_LEFT, INPUT);
  pinMode(KEY_RIGHT, INPUT);
  pinMode(KEY_CENTER, INPUT);

  setPrevious(true);
  setPlay(true);
  setNext(true);
  setPrevious(false);
  setPlay(false);
  setNext(false);
  chooseDescription(song);
}

void loop(){
  if(digitalRead(KEY_LEFT)){
    if(song <= 0)
      song = 7;
    song--;

    setPrevious(true);
    while(digitalRead(KEY_LEFT)){
      
    }
    setPrevious(false);
    chooseDescription(song);    
  }

  if(digitalRead(KEY_RIGHT)){
    if(song >= 6)
      song = -1;
    song++;

    setNext(true);
    while(digitalRead(KEY_RIGHT)){
      
    }
    setNext(false);
    chooseDescription(song);    
  }

  if(digitalRead(KEY_CENTER)){
    setPlay(true);
    while(digitalRead(KEY_RIGHT)){
      
    }    
    chooseSong(song);
    setPlay(false);
  }
}

void chooseDescription(uint8_t song){
  switch(song){
    case 0:
      printText("Indiana Jones");
      break;
    case 1:
      printText("Take on me");
      break;
    case 2:
      printText("Star Wars");
      break;
    case 3:
      printText("Back to the Future");
      break;
    case 4:
      printText("Mission Imposible");
      break;
    case 5:
      printText("Barbie Girl");
      break;
    case 6:
      printText("Pink Panther");
      break;
  }
}

void chooseSong(uint8_t song){
  switch(song){
    case 0:
      song0();
      break;
    case 1:
      song1();
      break;
    case 2:
      song2();
      break;
    case 3:
      song3();
      break;
    case 4:
      song4();
      break;
    case 5:
      song5();
      break;
    case 6:
      song6();
      break;
  }
}

void play(int freq, int duration){
  tone(BUZZER, freq, duration);
  
  if(status){
    digitalWrite(LED_1, LOW);
    digitalWrite(LED_2, HIGH);
  }else{
    digitalWrite(LED_1, HIGH);
    digitalWrite(LED_2, LOW);
  }
  status = !status;
  delay(duration);
}

void printText(String text){
  lcd.clear();
  if(text.length() > 16){
    lcd.print(text.substring(0, text.lastIndexOf(" ")));
    lcd.setCursor(0, 1);
    lcd.print(text.substring(text.lastIndexOf(" ") + 1));
  }else{
    lcd.print(text);
  }
  delay(1000);
}

void setPrevious(boolean fill){
  if(fill){
    display.fillTriangle(39, 18,
                      39, 44,
                      13, 31,
                      1);
                    
    display.fillTriangle(26, 18,
                      26, 44,
                      0, 31,
                      1);
  }else{
    display.fillTriangle(39 - 1, 18 + 1,
                      39 - 1, 44 - 1,
                      13 + 1, 31,
                      0);
                      
    display.fillTriangle(26 - 1, 18 + 1,
                      26 - 1, 44 - 1,
                      0 + 1, 31,
                      0);
  }
  display.display();
}

void setPlay(boolean fill){
  if(fill){
    display.fillTriangle(50, 18,
                      50, 44,
                      76, 31,
                      1);
  }else{
    display.fillTriangle(50 + 1, 18 + 1,
                      50 + 1, 44 - 1,
                      76 - 1, 31,
                      0);
  }
  display.display();
}

void setNext(boolean fill){
  if(fill){
    display.fillTriangle(85, 18,
                      85, 44,
                      111, 31,
                      1);
                    
    display.fillTriangle(99, 18,
                      99, 44,
                      125, 31,
                      1);
  }else{
    display.fillTriangle(85 + 1, 18 + 1,
                      85 + 1, 44 - 1,
                      111 - 1, 31,
                      0);
                      
    display.fillTriangle(99 + 1, 18 + 1,
                      99 + 1, 44 - 1,
                      125 - 1, 31,
                      0);
  }
  display.display();
}

void song0(){ // Indiana Jone
//  play(659, 240);
//  play(0, 120);
//  play(698, 120);
//  play(784, 120);
//  play(0, 120);
//  play(1047, 960);
//  play(0, 180);
//  play(587, 240);
//  play(0, 120);
//  play(659, 120);
//  play(698, 960);
//  play(0, 360);
//  play(784, 240);
//  play(0, 120);
//  play(880, 120);
//  play(987, 120);
//  play(0, 120);
//  play(1397, 960);
//  play(0, 240);
//  play(880, 240);
//  play(0, 120);
//  play(987, 120);
//  play(1047, 480);
//  play(1175, 480);
//  play(1319, 480);
//  play(659, 240);
//  play(0, 120);
//  play(698, 120);
//  play(784, 120);
//  play(0, 120);
//  play(1047, 960);
//  play(0, 240);
//  play(1175, 240);
//  play(0, 120);
//  play(1319, 120);
//  play(1397, 1440);
//  play(784, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1319, 360);
//  play(0, 120);
//  play(1175, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1319, 360);
//  play(0, 120);
//  play(1175, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1397, 360);
//  play(0, 120);
//  play(1319, 240);
  play(0, 120);
  play(1175, 120);
  play(1047, 480);
}

void song1(){ // Take on me
  play(740, 187);
  play(740, 187);
  play(740, 187);
  play(587, 187);
  play(0, 187);
  play(493, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(830, 187);
  play(830, 187);
  play(880, 187);
  play(987, 187);
  play(880, 187);
  play(880, 187);
  play(880, 187);
  play(659, 187);
  play(0, 187);
  play(587, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(659, 187);
  play(659, 187);
  play(740, 187);
  play(659, 187);
  play(740, 187);
  play(740, 187);
  play(740, 187);
  play(587, 187);
  play(0, 187);
  play(493, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(830, 187);
  play(830, 187);
  play(880, 187);
  play(987, 187);
  play(880, 187);
  play(880, 187);
  play(880, 187);
  play(659, 187);
  play(0, 187);
  play(587, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(659, 187);
  play(659, 187);
}

void song2(){ // Star Wars
  play(0, 166);
  play(740, 166);
  play(740, 166);
  play(740, 166);
  play(987, 999);
  play(1480, 999);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1319, 166);
  play(1109, 999);
  play(740, 166);
  play(740, 166);
  play(740, 166);
  play(987, 999);
  play(1480, 999);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1319, 166);
  play(1109, 666);
}

void song3(){ // Back to the Future
  play(784, 450);
  play(0, 75);
  play(523, 450);
  play(0, 75);
  play(740, 900);
  play(0, 75);
  play(784, 112);
  play(0, 75);
  play(880, 112);
  play(0, 75);
  play(784, 150);
  play(0, 75);
  play(659, 150);
  play(0, 75);
  play(523, 150);
  play(0, 75);
  play(740, 300);
  play(0, 75);
  play(784, 112);
  play(0, 75);
  play(880, 112);
  play(0, 75);
  play(784, 225);
  play(0, 75);
  play(587, 225);
  play(0, 75);
  play(784, 225);
  play(0, 75);
  play(1175, 225);
  play(0, 75);
  play(1175, 450);
  play(0, 75);
  play(1109, 300);
  play(0, 75);
  play(987, 112);
  play(0, 75);
  play(1109, 112);
  play(0, 75);
  play(1175, 900);
}

void song4(){ // Mission Imposible
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1175, 78);
  play(1245, 78);
  play(1319, 78);
  play(1397, 78);
  play(1480, 78);
  play(1568, 78);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1865, 157);
  play(0, 157);
  play(2093, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1397, 157);
  play(0, 157);
  play(1480, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1865, 157);
  play(0, 157);
  play(2093, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1397, 157);
  play(0, 157);
  play(1480, 157);
  play(0, 157);
  play(1865, 157);
  play(1568, 157);
  play(1175, 1262);
  play(0, 78);
  play(1865, 157);
  play(1568, 157);
  play(1109, 1262);
  play(0, 78);
  play(1865, 157);
  play(1568, 157);
  play(1047, 1262);
  play(932, 157);
  play(1047, 315);
  play(0, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1480, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1397, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1319, 1262);
  play(1245, 157);
  play(1175, 315);
}

void song5(){ // Barbie Girl
  play(830, 240);
  play(659, 240);
  play(830, 240);
  play(1109, 240);
  play(880, 480);
  play(0, 480);
  play(740, 240);
  play(622, 240);
  play(740, 240);
  play(987, 240);
  play(830, 480);
  play(740, 240);
  play(659, 240);
  play(0, 480);
  play(659, 240);
  play(554, 240);
  play(740, 480);
  play(554, 480);
  play(0, 480);
  play(740, 240);
  play(659, 240);
  play(830, 480);
  play(740, 480);
}

void song6(){ // Pink Panther
  play(587, 187);
  play(659, 187);
  play(0, 750);
  play(698, 187);
  play(784, 187);
  play(0, 750);
  play(587, 187);
  play(659, 187);
  play(0, 93);
  play(698, 187);
  play(784, 187);
  play(0, 93);
  play(1047, 187);
  play(987, 187);
  play(0, 93);
  play(587, 187);
  play(659, 187);
  play(0, 93);
  play(987, 187);
  play(880, 750);
  play(0, 750);
  play(880, 93);
  play(784, 93);
  play(659, 93);
  play(587, 93);
  play(659, 750);
}
  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////////

  static const demo_led = '''
  /*  TME EDUCATION
 *  BuzzerMegaShow
 *  v0.1.0
 *  -------------
 *  This program will play everething in RTTTL format
 */ 
#define PROJECT_NAME "BuzzerMegaShow"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define LED_1 13
#define LED_2 9
#define BUZZER 2
#define KEY_LEFT 4
#define KEY_RIGHT 7
#define KEY_CENTER 8

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(0);
boolean status = false;
uint8_t song = 0;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();

  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(BUZZER, OUTPUT);

  pinMode(KEY_LEFT, INPUT);
  pinMode(KEY_RIGHT, INPUT);
  pinMode(KEY_CENTER, INPUT);

  setPrevious(true);
  setPlay(true);
  setNext(true);
  setPrevious(false);
  setPlay(false);
  setNext(false);
  chooseDescription(song);
}

void loop(){
  if(digitalRead(KEY_LEFT)){
    if(song <= 0)
      song = 7;
    song--;

    setPrevious(true);
    while(digitalRead(KEY_LEFT)){
      
    }
    setPrevious(false);
    chooseDescription(song);    
  }

  if(digitalRead(KEY_RIGHT)){
    if(song >= 6)
      song = -1;
    song++;

    setNext(true);
    while(digitalRead(KEY_RIGHT)){
      
    }
    setNext(false);
    chooseDescription(song);    
  }

  if(digitalRead(KEY_CENTER)){
    setPlay(true);
    while(digitalRead(KEY_RIGHT)){
      
    }    
    chooseSong(song);
    setPlay(false);
  }
}

void chooseDescription(uint8_t song){
  switch(song){
    case 0:
      printText("Indiana Jones");
      break;
    case 1:
      printText("Take on me");
      break;
    case 2:
      printText("Star Wars");
      break;
    case 3:
      printText("Back to the Future");
      break;
    case 4:
      printText("Mission Imposible");
      break;
    case 5:
      printText("Barbie Girl");
      break;
    case 6:
      printText("Pink Panther");
      break;
  }
}

void chooseSong(uint8_t song){
  switch(song){
    case 0:
      song0();
      break;
    case 1:
      song1();
      break;
    case 2:
      song2();
      break;
    case 3:
      song3();
      break;
    case 4:
      song4();
      break;
    case 5:
      song5();
      break;
    case 6:
      song6();
      break;
  }
}

void play(int freq, int duration){
  tone(BUZZER, freq, duration);
  
  if(status){
    digitalWrite(LED_1, LOW);
    digitalWrite(LED_2, HIGH);
  }else{
    digitalWrite(LED_1, HIGH);
    digitalWrite(LED_2, LOW);
  }
  status = !status;
  delay(duration);
}

void printText(String text){
  lcd.clear();
  if(text.length() > 16){
    lcd.print(text.substring(0, text.lastIndexOf(" ")));
    lcd.setCursor(0, 1);
    lcd.print(text.substring(text.lastIndexOf(" ") + 1));
  }else{
    lcd.print(text);
  }
  delay(1000);
}

void setPrevious(boolean fill){
  if(fill){
    display.fillTriangle(39, 18,
                      39, 44,
                      13, 31,
                      1);
                    
    display.fillTriangle(26, 18,
                      26, 44,
                      0, 31,
                      1);
  }else{
    display.fillTriangle(39 - 1, 18 + 1,
                      39 - 1, 44 - 1,
                      13 + 1, 31,
                      0);
                      
    display.fillTriangle(26 - 1, 18 + 1,
                      26 - 1, 44 - 1,
                      0 + 1, 31,
                      0);
  }
  display.display();
}

void setPlay(boolean fill){
  if(fill){
    display.fillTriangle(50, 18,
                      50, 44,
                      76, 31,
                      1);
  }else{
    display.fillTriangle(50 + 1, 18 + 1,
                      50 + 1, 44 - 1,
                      76 - 1, 31,
                      0);
  }
  display.display();
}

void setNext(boolean fill){
  if(fill){
    display.fillTriangle(85, 18,
                      85, 44,
                      111, 31,
                      1);
                    
    display.fillTriangle(99, 18,
                      99, 44,
                      125, 31,
                      1);
  }else{
    display.fillTriangle(85 + 1, 18 + 1,
                      85 + 1, 44 - 1,
                      111 - 1, 31,
                      0);
                      
    display.fillTriangle(99 + 1, 18 + 1,
                      99 + 1, 44 - 1,
                      125 - 1, 31,
                      0);
  }
  display.display();
}

void song0(){ // Indiana Jone
//  play(659, 240);
//  play(0, 120);
//  play(698, 120);
//  play(784, 120);
//  play(0, 120);
//  play(1047, 960);
//  play(0, 180);
//  play(587, 240);
//  play(0, 120);
//  play(659, 120);
//  play(698, 960);
//  play(0, 360);
//  play(784, 240);
//  play(0, 120);
//  play(880, 120);
//  play(987, 120);
//  play(0, 120);
//  play(1397, 960);
//  play(0, 240);
//  play(880, 240);
//  play(0, 120);
//  play(987, 120);
//  play(1047, 480);
//  play(1175, 480);
//  play(1319, 480);
//  play(659, 240);
//  play(0, 120);
//  play(698, 120);
//  play(784, 120);
//  play(0, 120);
//  play(1047, 960);
//  play(0, 240);
//  play(1175, 240);
//  play(0, 120);
//  play(1319, 120);
//  play(1397, 1440);
//  play(784, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1319, 360);
//  play(0, 120);
//  play(1175, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1319, 360);
//  play(0, 120);
//  play(1175, 240);
//  play(0, 120);
//  play(784, 120);
//  play(1397, 360);
//  play(0, 120);
//  play(1319, 240);
  play(0, 120);
  play(1175, 120);
  play(1047, 480);
}

void song1(){ // Take on me
  play(740, 187);
  play(740, 187);
  play(740, 187);
  play(587, 187);
  play(0, 187);
  play(493, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(830, 187);
  play(830, 187);
  play(880, 187);
  play(987, 187);
  play(880, 187);
  play(880, 187);
  play(880, 187);
  play(659, 187);
  play(0, 187);
  play(587, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(659, 187);
  play(659, 187);
  play(740, 187);
  play(659, 187);
  play(740, 187);
  play(740, 187);
  play(740, 187);
  play(587, 187);
  play(0, 187);
  play(493, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(0, 187);
  play(659, 187);
  play(830, 187);
  play(830, 187);
  play(880, 187);
  play(987, 187);
  play(880, 187);
  play(880, 187);
  play(880, 187);
  play(659, 187);
  play(0, 187);
  play(587, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(0, 187);
  play(740, 187);
  play(659, 187);
  play(659, 187);
}

void song2(){ // Star Wars
  play(0, 166);
  play(740, 166);
  play(740, 166);
  play(740, 166);
  play(987, 999);
  play(1480, 999);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1319, 166);
  play(1109, 999);
  play(740, 166);
  play(740, 166);
  play(740, 166);
  play(987, 999);
  play(1480, 999);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1109, 166);
  play(1976, 999);
  play(1480, 499);
  play(1319, 166);
  play(1245, 166);
  play(1319, 166);
  play(1109, 666);
}

void song3(){ // Back to the Future
  play(784, 450);
  play(0, 75);
  play(523, 450);
  play(0, 75);
  play(740, 900);
  play(0, 75);
  play(784, 112);
  play(0, 75);
  play(880, 112);
  play(0, 75);
  play(784, 150);
  play(0, 75);
  play(659, 150);
  play(0, 75);
  play(523, 150);
  play(0, 75);
  play(740, 300);
  play(0, 75);
  play(784, 112);
  play(0, 75);
  play(880, 112);
  play(0, 75);
  play(784, 225);
  play(0, 75);
  play(587, 225);
  play(0, 75);
  play(784, 225);
  play(0, 75);
  play(1175, 225);
  play(0, 75);
  play(1175, 450);
  play(0, 75);
  play(1109, 300);
  play(0, 75);
  play(987, 112);
  play(0, 75);
  play(1109, 112);
  play(0, 75);
  play(1175, 900);
}

void song4(){ // Mission Imposible
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1245, 78);
  play(1175, 78);
  play(1175, 78);
  play(1245, 78);
  play(1319, 78);
  play(1397, 78);
  play(1480, 78);
  play(1568, 78);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1865, 157);
  play(0, 157);
  play(2093, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1397, 157);
  play(0, 157);
  play(1480, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1865, 157);
  play(0, 157);
  play(2093, 157);
  play(0, 157);
  play(1568, 157);
  play(0, 315);
  play(1568, 157);
  play(0, 315);
  play(1397, 157);
  play(0, 157);
  play(1480, 157);
  play(0, 157);
  play(1865, 157);
  play(1568, 157);
  play(1175, 1262);
  play(0, 78);
  play(1865, 157);
  play(1568, 157);
  play(1109, 1262);
  play(0, 78);
  play(1865, 157);
  play(1568, 157);
  play(1047, 1262);
  play(932, 157);
  play(1047, 315);
  play(0, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1480, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1397, 1262);
  play(0, 78);
  play(932, 157);
  play(784, 157);
  play(1319, 1262);
  play(1245, 157);
  play(1175, 315);
}

void song5(){ // Barbie Girl
  play(830, 240);
  play(659, 240);
  play(830, 240);
  play(1109, 240);
  play(880, 480);
  play(0, 480);
  play(740, 240);
  play(622, 240);
  play(740, 240);
  play(987, 240);
  play(830, 480);
  play(740, 240);
  play(659, 240);
  play(0, 480);
  play(659, 240);
  play(554, 240);
  play(740, 480);
  play(554, 480);
  play(0, 480);
  play(740, 240);
  play(659, 240);
  play(830, 480);
  play(740, 480);
}

void song6(){ // Pink Panther
  play(587, 187);
  play(659, 187);
  play(0, 750);
  play(698, 187);
  play(784, 187);
  play(0, 750);
  play(587, 187);
  play(659, 187);
  play(0, 93);
  play(698, 187);
  play(784, 187);
  play(0, 93);
  play(1047, 187);
  play(987, 187);
  play(0, 93);
  play(587, 187);
  play(659, 187);
  play(0, 93);
  play(987, 187);
  play(880, 750);
  play(0, 750);
  play(880, 93);
  play(784, 93);
  play(659, 93);
  play(587, 93);
  play(659, 750);
}
  ''';

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const maindice = '''
/*  TME EDUCATION
 *  Dice
 *  v0.1.0
 *  -------------
 *  Roll a dice
 */ 
#define PROJECT_NAME "Dice"
#define VERSION "v0.1.0"

#include "includes.h"
#include "dice.h"
#include "dice2.h"
#include "dice3.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_CENTER 8
#define BUZZER 2
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);
Adafruit_MCP23008 seg;


void setup(){
  lcd.begin(16, 2);
  intro(lcd);  

  pinMode(KEY_CENTER, INPUT);
  pinMode(BUZZER, OUTPUT);
  
  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();

  seg.begin(0x4);
  for(int i = 0; i < 8; i++)
    seg.pinMode(i, OUTPUT);

  lcd.clear();
  lcd.print("Press center");
  lcd.setCursor(0, 1);
  lcd.print("to roll");
}

void loop(){
  if(digitalRead(KEY_CENTER)){
    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(100);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap3, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(200);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap2, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(300);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(400);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap3, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(500);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(600);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap3, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(800);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap2, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1000);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1200);

    display.clearDisplay();
    display.drawBitmap(0, 0, bitmap3, BMPWIDTH, BMPHEIGHT, 1);
    display.display();
    tone(BUZZER, 100, 10);
    delay(1200);

    char val = '0' + random(1,6);
    
    printOnSevenSeg(val);
  }
}

void printOnSevenSeg(char sign){
  uint8_t data = 0;
  
  switch(sign){
    case '0':
      data = B11111100;
      break;
    case '1':
      data = B01100000;
      break;
    case '2':
      data = B11011010;
      break;
    case '3':
      data = B11110010;
      break;
    case '4':
      data = B01100110;
      break;
    case '5':
      data = B10110110;
      break;
    case '6':
      data = B10111110;
      break;
    case '7':
      data = B11100000;
      break;
    case '8':
      data = B11111110;
      break;
    case '9':
      data = B11110110;
      break;
  }
  
  for(int i = 0; i < 8; i++)
    seg.digitalWrite(i, bitRead(data, 7 - i));  
}
  ''';

  static const dice = '''
    #define BMPWIDTH  64
#define BMPHEIGHT 64
const unsigned char bitmap[] PROGMEM = {
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x01,0xFF,0xFF,0xFF,0xFF,0xF8,
  0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x08,
  0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x18,
  0x00,0x00,0x18,0x00,0x00,0x00,0x00,0x28,
  0x00,0x00,0x20,0x00,0x00,0x1C,0x00,0x48,
  0x00,0x00,0x40,0x00,0x00,0x3E,0x00,0x88,
  0x00,0x00,0x80,0x00,0x00,0x3E,0x01,0x08,
  0x00,0x01,0x00,0x00,0x00,0x3E,0x02,0x08,
  0x00,0x02,0x00,0x07,0x00,0x1C,0x04,0x08,
  0x00,0x04,0x00,0x0F,0x80,0x00,0x08,0x08,
  0x00,0x18,0x00,0x0F,0x80,0x00,0x10,0x08,
  0x00,0x20,0x00,0x0F,0x80,0x00,0x21,0xC8,
  0x00,0x40,0x00,0x07,0x00,0x00,0x43,0xE8,
  0x00,0x87,0x00,0x00,0x00,0x00,0x83,0xE8,
  0x01,0x0F,0x80,0x00,0x00,0x01,0x03,0xE8,
  0x02,0x0F,0x80,0x00,0x00,0x02,0x01,0xC8,
  0x04,0x0F,0x80,0x00,0x00,0x04,0x00,0x08,
  0x18,0x07,0x00,0x00,0x00,0x08,0x00,0x08,
  0x20,0x00,0x00,0x00,0x00,0x10,0x00,0x08,
  0x40,0x00,0x00,0x00,0x00,0x20,0x00,0x08,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x4E,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x5F,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x5F,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x5F,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x4E,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0xE0,0x00,0x03,0x80,0x40,0x00,0x08,
  0x81,0xF0,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x81,0xF0,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x81,0xF0,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x80,0xE0,0x00,0x03,0x80,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x01,0xC8,
  0x80,0x00,0x00,0x00,0x00,0x40,0x03,0xE8,
  0x80,0x00,0x1C,0x00,0x00,0x40,0x03,0xE8,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x03,0xE8,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x01,0xC8,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x1C,0x00,0x00,0x40,0x00,0x18,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x20,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x40,
  0x80,0x00,0x00,0x00,0x00,0x47,0x00,0x80,
  0x80,0x00,0x00,0x00,0x00,0x4F,0x81,0x00,
  0x80,0x00,0x00,0x00,0x00,0x4F,0x82,0x00,
  0x80,0xE0,0x00,0x00,0x00,0x4F,0x8C,0x00,
  0x81,0xF0,0x00,0x07,0x00,0x47,0x10,0x00,
  0x81,0xF0,0x00,0x0F,0x80,0x40,0x20,0x00,
  0x81,0xF0,0x00,0x0F,0x80,0x40,0x40,0x00,
  0x80,0xE0,0x00,0x0F,0x80,0x40,0x80,0x00,
  0x80,0x00,0x00,0x07,0x00,0x41,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x46,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x48,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x50,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x60,0x00,0x00,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x00 
};
  ''';



  static const dice2 = '''
    const unsigned char bitmap2[] PROGMEM = {
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x01,0xFF,0xFF,0xFF,0xFF,0xF8,
  0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x08,
  0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x18,
  0x00,0x00,0x18,0x00,0x00,0x00,0x00,0x28,
  0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x48,
  0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x88,
  0x00,0x00,0x80,0x00,0x00,0x00,0x01,0x08,
  0x00,0x01,0x00,0x00,0x00,0x00,0x02,0x08,
  0x00,0x02,0x00,0x07,0x00,0x00,0x04,0x08,
  0x00,0x04,0x00,0x0F,0x80,0x00,0x08,0x08,
  0x00,0x18,0x00,0x0F,0x80,0x00,0x10,0x08,
  0x00,0x20,0x00,0x0F,0x80,0x00,0x21,0xC8,
  0x00,0x40,0x00,0x07,0x00,0x00,0x43,0xE8,
  0x00,0x80,0x00,0x00,0x00,0x00,0x83,0xE8,
  0x01,0x00,0x00,0x00,0x00,0x01,0x03,0xE8,
  0x02,0x00,0x00,0x00,0x00,0x02,0x01,0xC8,
  0x04,0x00,0x00,0x00,0x00,0x04,0x00,0x08,
  0x18,0x00,0x00,0x00,0x00,0x08,0x00,0x08,
  0x20,0x00,0x00,0x00,0x00,0x10,0x00,0x08,
  0x40,0x00,0x00,0x00,0x00,0x20,0x00,0x08,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x03,0x80,0x40,0x00,0x08,
  0x80,0x00,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x80,0x00,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x80,0x00,0x00,0x07,0xC0,0x40,0x00,0x08,
  0x80,0x00,0x00,0x03,0x80,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x1C,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x3E,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x1C,0x00,0x00,0x40,0x00,0x18,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x20,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x40,
  0x80,0x00,0x00,0x00,0x00,0x47,0x00,0x80,
  0x80,0x00,0x00,0x00,0x00,0x4F,0x81,0x00,
  0x80,0x00,0x00,0x00,0x00,0x4F,0x82,0x00,
  0x80,0xE0,0x00,0x00,0x00,0x4F,0x8C,0x00,
  0x81,0xF0,0x00,0x00,0x00,0x47,0x10,0x00,
  0x81,0xF0,0x00,0x00,0x00,0x40,0x20,0x00,
  0x81,0xF0,0x00,0x00,0x00,0x40,0x40,0x00,
  0x80,0xE0,0x00,0x00,0x00,0x40,0x80,0x00,
  0x80,0x00,0x00,0x00,0x00,0x41,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x46,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x48,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x50,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x60,0x00,0x00,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x00 
};
  ''';

  static const dice3 = '''
    const unsigned char bitmap3[] PROGMEM = {
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x01,0xFF,0xFF,0xFF,0xFF,0xF8,
  0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x08,
  0x00,0x00,0x04,0xE0,0x00,0x07,0x00,0x18,
  0x00,0x00,0x19,0xF0,0x00,0x0F,0x80,0x28,
  0x00,0x00,0x21,0xF0,0x00,0x0F,0x80,0x48,
  0x00,0x00,0x41,0xF0,0x00,0x0F,0x80,0x88,
  0x00,0x00,0x80,0xE0,0x00,0x07,0x01,0x08,
  0x00,0x01,0x00,0x00,0x00,0x00,0x02,0x08,
  0x00,0x02,0x00,0x07,0x00,0x00,0x04,0x08,
  0x00,0x04,0x00,0x0F,0x80,0x00,0x08,0x08,
  0x00,0x18,0x00,0x0F,0x80,0x00,0x10,0x08,
  0x00,0x20,0x00,0x0F,0x80,0x00,0x20,0x08,
  0x00,0x40,0x00,0x07,0x00,0x00,0x40,0x08,
  0x00,0x87,0x00,0x00,0x07,0x00,0x80,0x08,
  0x01,0x0F,0x80,0x00,0x0F,0x81,0x00,0x08,
  0x02,0x0F,0x80,0x00,0x0F,0x82,0x00,0x08,
  0x04,0x0F,0x80,0x00,0x0F,0x84,0x00,0x08,
  0x18,0x07,0x00,0x00,0x07,0x08,0x00,0x08,
  0x20,0x00,0x00,0x00,0x00,0x10,0x00,0x08,
  0x40,0x00,0x00,0x00,0x00,0x20,0x00,0x08,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x81,0xC0,0x00,0x00,0x00,0x40,0x00,0x08,
  0x83,0xE0,0x00,0x00,0x00,0x40,0x00,0x08,
  0x83,0xE0,0x00,0x00,0x00,0x40,0x38,0x08,
  0x83,0xE0,0x00,0x00,0x00,0x40,0x7C,0x08,
  0x81,0xC0,0x00,0x00,0x00,0x40,0x7C,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x7C,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x38,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x08,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x18,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x20,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x40,
  0x80,0x00,0x00,0x00,0x00,0x40,0x00,0x80,
  0x80,0x00,0x00,0x00,0x00,0x40,0x01,0x00,
  0x80,0x00,0x00,0x00,0x00,0x40,0x02,0x00,
  0x80,0x00,0x00,0x00,0x00,0x40,0x0C,0x00,
  0x80,0x00,0x00,0x07,0x00,0x40,0x10,0x00,
  0x80,0x00,0x00,0x0F,0x80,0x40,0x20,0x00,
  0x80,0x00,0x00,0x0F,0x80,0x40,0x40,0x00,
  0x80,0x00,0x00,0x0F,0x80,0x40,0x80,0x00,
  0x80,0x00,0x00,0x07,0x00,0x41,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x46,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x48,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x50,0x00,0x00,
  0x80,0x00,0x00,0x00,0x00,0x60,0x00,0x00,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xC0,0x00,0x00 
};
  ''';
///////////////////////////////////////////////////////////////////////////////////////////////////////
  static const duck_jump = '''
    /*  TME EDUCATION
 *  FrogJump
 *  v0.0.0
 *  -------------
 *  Description
 */ 
#define PROJECT_NAME "DuckJump"
#define VERSION "v1.0.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_LEFT 4
#define KEY_DOWN 5
#define KEY_UP 6
#define KEY_RIGHT 7
#define KEY_CENTER 8
#define POTENTIOMETER 1
#define BUZZER 2
#define RESET_BTN 4

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate
#define DISPLAY_HEIGHT 64
#define DISPLAY_WIDTH 128

#define LANE_WIDTH 10

#define LINE_LENGTH 12

#define COLOR_WHITE 1
#define COLOR_BLACK 0


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(DISPLAY_WIDTH,DISPLAY_HEIGHT, &Wire, RESET_BTN);

const uint8_t loadedPickupBitmap[] PROGMEM = {0x3f,0x80, 0x22,0x9C, 0x42,0xBE, 0xBE,0xFF, 0x82,0x01, 0x82,0x01, 0x7F,0xFF, 0x38,0x1C};
const uint8_t pickupBitmap[] PROGMEM = {0x3f,0x80, 0x22,0x80, 0x42,0x80, 0xBE,0xFF, 0x82,0x01, 0x82,0x01, 0x7F,0xFF, 0x38,0x1C};
const uint8_t sportCarBitmap[] PROGMEM = {0x00,0x00, 0x03,0xE0, 0x02,0x18, 0x7C,0x0C, 0x80,0x02, 0xB8,0x39, 0x6F,0xEF, 0x38,0x38};
const uint8_t sportCar2Bitmap[] PROGMEM = {0x00,0x00, 0x03,0xE0, 0x04,0x98, 0x7F,0x8C, 0xC0,0xC2, 0xB8,0x39, 0x6F,0xEF, 0x38,0x38};
const uint8_t tirBitmap[] PROGMEM = {0x0F,0xFF,0xFF, 0x12,0x00,0x01, 0x12,0x00,0x01, 0xE2,0x00,0x01, 0x82,0x00,0x00, 0x9A,0xC0,0x0D, 0xE7,0x9F,0xF3, 0x18,0x60,0x0C};

const uint8_t playerBitmap[] PROGMEM = {0x18,0x3C,0x3C,0x42,0xBD,0x81,0x81,0x7E};

struct Vector2{
  int x;
  int y;
  int lane;
};

struct Vehicle{
  Vector2 pos;
  uint8_t speed;
  const uint8_t* bitmap;
  uint8_t width;
  uint8_t height;
  boolean active;
};

struct Player{
  Vector2 pos;
  const uint8_t* bitmap;
  uint8_t width;
  uint8_t height;
  uint8_t jumps;
};

int currMapSize = 0;
int currMapPos = 0;

int nextMapSize = 0;
int nextMapPos = 0;

int numOfVehicles = 0;
int vehicleTimer = 0;
int level = 0;

unsigned long lastVehicleSpawnTime = 0;
unsigned long lastPlayerJumpTime = 0;

// struct Vehicle vehicle1[2] = {{{1,2},3,loadedPickupBitmap, 16, 8},{{20,20},3,loadedPickupBitmap, 16, 8}}; // sport car
// struct Vehicle vehicle2 = {{4,5},6,pickupBitmap, 16, 8}; // pickup
// struct Vehicle vehicle3 = {{4,5},6,sportCarBitmap, 16, 8}; // loaded pickup
// struct Vehicle vehicle4 = {{4,5},6,sportCar2Bitmap, 16, 8}; // loaded pickup
// struct Vehicle vehicle5 = ; // TIR

struct Vehicle vehicles[24] = {  
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},
  {{1,2},5,loadedPickupBitmap, 16, 8, false},

  {{4,5},4,pickupBitmap, 16, 8, false},
  {{4,5},4,pickupBitmap, 16, 8, false},
  {{4,5},4,pickupBitmap, 16, 8, false},
  {{4,5},4,pickupBitmap, 16, 8, false},
  {{4,5},4,pickupBitmap, 16, 8, false},
  {{4,5},4,pickupBitmap, 16, 8, false},
  
  {{4,5},2,sportCarBitmap, 16, 8, false},
  {{4,5},2,sportCarBitmap, 16, 8, false},
  {{4,5},2,sportCarBitmap, 16, 8, false},
  {{4,5},2,sportCarBitmap, 16, 8, false},

  {{4,5},1,sportCar2Bitmap, 16, 8, false},
  {{4,5},1,sportCar2Bitmap, 16, 8, false},

  {{7,8},7,tirBitmap, 24, 8, false},
  {{7,8},7,tirBitmap, 24, 8, false},
  {{7,8},7,tirBitmap, 24, 8, false}
};

struct Player player = {{60,56},playerBitmap,8,8, 0};

void setup(){
  // Serial.begin(9600);
  randomSeed(analogRead(0));
  lcd.begin(16, 2);
  intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();
  pinMode(BUZZER, OUTPUT);
  
  // display.drawBitmap(vehicle1[0].pos.x, vehicle1[0].pos.y, vehicle1[0].bitmap, vehicle1[0].width, vehicle1[0].height, COLOR_WHITE);
  // display.drawBitmap(vehicle1[1].pos.x, vehicle1[1].pos.y, vehicle1[1].bitmap, vehicle1[1].width, vehicle1[1].height, COLOR_WHITE);

  // drawStreet(0,4);
  // display.display();
  // delay(1000);
  // display.clearDisplay();
  // display.drawBitmap(player.pos.x, player.pos.y, player.bitmap, player.width, player.height, COLOR_WHITE);
  // display.display();
  // delay(1000);
}
// generujemy mapę, przechodzimy dany poziom (max 5 pasów ruchu), gdy przejdziemy, to kaczka z mapą zjeżdża w dół, aż nie znajdzie się w pozycji wyjściowej,
// wcześniej generujemy nową mapę, losową ilość pasów ruchów, i ustawiamy jej pozycje na tej podstawie.
void loop(){
  lcd.clear();
  lcd.print("level:");
  lcd.print(level);
  // for(int y = -100; y < DISPLAY_HEIGHT; y++){
  //   display.clearDisplay();
  //   display.drawFastHLine(0, 0, DISPLAY_WIDTH, COLOR_WHITE);
  //   display.drawFastHLine(0, DISPLAY_HEIGHT - 1, DISPLAY_WIDTH, COLOR_WHITE);

  //   drawStreet(y, 4);
  //   display.display();
  // }
  
  ///////////////////// ZAŁADOWANIE ETAPU
  // lcd.clear();
  // lcd.print("level: ");
  // lcd.print(level);
  // GENEROWANIE ROZMIARU AKTUALNEJ MAPY
  currMapSize = random(1, 6);

  // GENEROWANIE ROZMIARU NASTĘPNEJ MAPY
  nextMapSize = random(1, 6);

  // GENEROWANIE POZYCJI AKTUALNEJ MAPY
  currMapPos = 0 - ((LANE_WIDTH + 1) * currMapSize + 1 + player.height);

  // GENEROWANIE POZYCJI NASTĘPNEJ MAPY
  nextMapPos = 0 - ((LANE_WIDTH + 1) * nextMapSize + 1 + player.height);

  // DANIE GRACZOWI ODPOWIEDNIEJ ILOSCI KROKÓW
  player.jumps = currMapSize + 1;

  // DANIE GRACZOWI ODPOWIEDNIEGO NUMERU LINII
  player.pos.lane = currMapSize;

  // AKTUALIZACJA POZYCJI GRACZA
  player.pos.x = 60;
  player.pos.y = 56;

  ////////////////////////// ANIMACJA POJAWIANIA SIĘ MAPY
  // GENEROWANIE POJAZDÓW 
  for(int i = 0; i < 4; i++){
    while(true){
        int currVehicleNum = random(0, 24);

        if(vehicles[currVehicleNum].active != true){
          vehicles[currVehicleNum].pos.x = DISPLAY_WIDTH;
          
          // WYBIERANIE TORU DLA POJAZDÓW
          int currVehicleLane = random(0, currMapSize);
          vehicles[currVehicleNum].pos.y = currMapPos + currVehicleLane * (LANE_WIDTH + 1) + 2;
          // vehicles[currVehicleNum].pos.y -= DISPLAY_HEIGHT;
          vehicles[currVehicleNum].pos.lane = currVehicleLane;

          vehicles[currVehicleNum].active = true;
          break;
        }
      }

    for(int j = 0; j < 2; j++)
    for(int k = 0; k < 24; k++){
      if(vehicles[k].active == true){
        vehicles[k].pos.x-=vehicles[k].speed*4;
      }
    }
  }
  // ZJAZD W DÓŁ MAPY
  for(int i = 0; i < DISPLAY_HEIGHT; i++){   
    display.clearDisplay();
    drawStreet(currMapPos++, currMapSize);
    display.drawBitmap(player.pos.x, player.pos.y, player.bitmap, player.width, player.height, COLOR_WHITE);    

    // RYSOWANIE SAMOCHODÓW
    for(int i = 0; i < 24; i++){
      if(vehicles[i].active == true){
        display.drawBitmap(vehicles[i].pos.x, vehicles[i].pos.y++, vehicles[i].bitmap, vehicles[i].width, vehicles[i].height, COLOR_WHITE);
      }
    }
    display.display();
  }
  ////////////////////////// ANIMACJA POJAWIANIA SIĘ MAPY ^^
  display.clearDisplay();

  // NARYSOWANIE AKTUALNEJ MAPY
  drawStreet(currMapPos, currMapSize);

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////



  
  // NARYSOWANIE GRACZA
  display.drawBitmap(player.pos.x, player.pos.y, player.bitmap, player.width, player.height, COLOR_WHITE);

  lastVehicleSpawnTime = 0;
  ///////////////////// ROZGRYWKA
  while(player.jumps > 0){
    // GENEROWANIE POJAZDU CO OKRESLONY CZAS
    if(lastVehicleSpawnTime < millis()){
      // GENEROWANIE LOSOWEGO POJAZDU
      while(true){
        int currVehicleNum = random(0, 24);

        if(vehicles[currVehicleNum].active != true){
          vehicles[currVehicleNum].pos.x = DISPLAY_WIDTH;
          
          // WYBIERANIE TORU DLA POJAZDÓW
          int currVehicleLane = random(0, currMapSize);
          vehicles[currVehicleNum].pos.y = currMapPos + currVehicleLane * (LANE_WIDTH + 1) + 2;
          vehicles[currVehicleNum].pos.lane = currVehicleLane;

          vehicles[currVehicleNum].active = true;
          break;
        }
      }
      // OBLICZENIE CZASU KOLEJNEGO GENEROWANIA POJAZDU
      lastVehicleSpawnTime = millis() + (1000 / currMapSize * (20 - level));
    }

    // USUWANIE POJAZDÓW POZA MAPĄ
    for(int i = 0; i < 24; i++){
      if(vehicles[i].pos.x < 0 - vehicles[i].width){
        vehicles[i].active = false;
      }
    }

    // PRZESUWANIE POJAZDÓW
    for(int i = 0; i < 24; i++){
      if(vehicles[i].active == true && vehicleTimer % vehicles[i].speed == 0){
        vehicles[i].pos.x--;
      }
    }

    // WYMAZYWANIE POJAZDÓW
    for(int i = 0; i < 24; i++){
      if(vehicles[i].active == true){
        display.fillRect(vehicles[i].pos.x + 1, vehicles[i].pos.y, vehicles[i].width, vehicles[i].height, COLOR_BLACK);
      }
    }

    // RYSOWANIE POJAZDÓW
    for(int i = 0; i < 24; i++){
      if(vehicles[i].active == true){
        display.drawBitmap(vehicles[i].pos.x, vehicles[i].pos.y, vehicles[i].bitmap, vehicles[i].width, vehicles[i].height, COLOR_WHITE);
      }
    }

    //SPRAWDZENIE AKTYWNOSCI GRACZA
    if(digitalRead(KEY_CENTER) && lastPlayerJumpTime < millis()){
      beep();
      // WYMAZANIE GRACZA
      display.fillRect(player.pos.x, player.pos.y, player.width, player.height, COLOR_BLACK);

      // SKOK GRACZA
      player.pos.y -= LANE_WIDTH + 1;
      player.jumps--;
      if(player.jumps == 0)
        level++;
      player.pos.lane--;

      // RYSOWANIE GRACZA
      display.drawBitmap(player.pos.x, player.pos.y, player.bitmap, player.width, player.height, COLOR_WHITE);

      // AKTUALIZACJA CZASU SKOKU
      lastPlayerJumpTime = millis() + 300;
    }

    // SPRAWDZENIE KOLIZJI
    for(int i = 0; i < 24; i++){
      if(vehicles[i].active == true && vehicles[i].pos.lane == player.pos.lane){
        int dist = abs(player.pos.x - vehicles[i].pos.x);

        if(player.pos.x - vehicles[i].pos.x < 0 && dist < player.width || player.pos.x - vehicles[i].pos.x >= 0 && dist < vehicles[i].width){
          player.jumps = 0;
          display.clearDisplay();
          display.setCursor(10, 20);
          display.setTextSize(2);
          display.setTextColor(COLOR_WHITE);
          display.print("GAME OVER");
          display.display();
          for(int i = 0; i < 24; i++){
            vehicles[i].active = false;
          }
          delay(5000);
          level = 0;
        }
      }
    }

    // AKTUALIZOWANIE TIMERA
    vehicleTimer++;
    // if(vehicleTimer > 8)
    //   vehicleTimer = 0;

    // DRUKOWANIE WSZYSTKIEGO
    display.display();
  }

  //WCZYTANIE NOWEGO LEVELA
  if(level != 0){
    //PRZESUWANIE MAPY W DÓŁ
    for(;currMapPos < DISPLAY_HEIGHT; currMapPos++){
      // RYSOWANIE ULICY
      display.clearDisplay();
      drawStreet(currMapPos, currMapSize);

      // RYSOWANIE SAMOCHODÓW
      for(int i = 0; i < 24; i++){
        if(vehicles[i].active == true){
          display.drawBitmap(vehicles[i].pos.x, vehicles[i].pos.y++, vehicles[i].bitmap, vehicles[i].width, vehicles[i].height, COLOR_WHITE);
        }
      }

      // RYSOWANIE GRACZA
      display.drawBitmap(player.pos.x, player.pos.y++, player.bitmap, player.width, player.height, COLOR_WHITE);

      display.display();
    }
  }  
}


/////////////////////////////////////////////// STREET 
void drawStreet(int y, int lines){  //y może być dowolne. Nawet na minusie
  if(y >= DISPLAY_HEIGHT)
    return;

  if(y >= 0)
    display.drawFastHLine(0, y, DISPLAY_WIDTH, COLOR_WHITE);

  for(int yy = y + LANE_WIDTH + 1; yy < DISPLAY_HEIGHT && lines > 0; yy += LANE_WIDTH + 1, lines--){
    if(yy > 0)
      if(lines != 1)
        drawDottedLine(yy);
      else
        display.drawFastHLine(0, yy, DISPLAY_WIDTH, COLOR_WHITE);
  }
}

void drawDottedLine(int y){
  for(int x = 0; x < DISPLAY_WIDTH; x += LINE_LENGTH * 2){
    if(x > DISPLAY_WIDTH - LINE_LENGTH){
      display.drawFastHLine(x, y, DISPLAY_WIDTH - x, COLOR_WHITE);
    } else {
      display.drawFastHLine(x, y, LINE_LENGTH, COLOR_WHITE);
    }
  }
}
/////////////////////////////////////////////// STREET ^^


void beep(){
  digitalWrite(BUZZER, HIGH);
  delay(10);
  digitalWrite(BUZZER, LOW);
}
  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const knob_led = '''
/*  TME EDUCATION
 *  Knob-LED
 *  v0.1.0
 *  -------------
 *  In this program you will learn how to operate the potentiometer built into the board. 
 *  Thanks to it, we can significantly expand our programs with a quite intuitive controller.
 */ 
#define PROJECT_NAME "Knob-LED"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_LEFT 4
#define KEY_RIGHT 7
#define POTENTIOMETER 1
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_NeoPixel ledStrip = Adafruit_NeoPixel(5, 12, NEO_GRB + NEO_KHZ800);

boolean show = true;
//int value = 100;
int red = 100;
int green = 100;
int blue = 100;

//The creation visible below is an enum variable, thanks to which we can select only the values placed in it. 
//Here are r, g and b. 
//This variable is called "col" and its default value is "r"
enum Col{
  r,
  g,
  b
}col = r; //This variable is called "col" and its default value is "r"

void setup(){
  Serial.begin(9600);
  lcd.begin(16, 2);
  intro(lcd);

  pinMode(KEY_LEFT , INPUT);
  pinMode(KEY_RIGHT , INPUT);

  ledStrip.begin();  
  lcd.print("Left to start");
}

void loop(){
  //An important skill of the programmer is to understand what the program is doing. 
  //Try it before running it. For an explanation of how the program works, see the "how.txt" file. 
  //Look at it later and check if you have understood the code correctly without running it.
  delay(50);

  if(digitalRead(KEY_LEFT)){    
    if(col == g)
      col = r;
    else if(col == b)
      col = g;
    printColorDesc(col);
    delay(500);
  }
  if(digitalRead(KEY_RIGHT)){
    if(col == r)
      col = g;
    else if(col == g)
      col = b;
    printColorDesc(col);
    delay(500);
  }  

  if(col == r){
    red = analogRead(POTENTIOMETER) / 4; 
  }else if(col == g){
    green = analogRead(POTENTIOMETER) / 4;
  }else{
    blue = analogRead(POTENTIOMETER) / 4;
  }
  
  ledStrip.setPixelColor(0, red, green, blue);
  ledStrip.show();
}

//This method is responsible for displaying a message informing us of the currently changed color
void printColorDesc(Col col){
  lcd.clear();
  lcd.print("now you change: ");
  lcd.setCursor(0, 1);
  Serial.print(col);
  if(col == r){
    lcd.print("red");
  }
  if(col == g){
    lcd.print("green");
  }
  if(col == b){
    lcd.print("blue");
  }
}

  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  

  static const knob_osiloscope = '''
    /*  TME EDUCATION
 *  Knob-Oscilloscope
 *  v0.1.0
 *  -------------
 *  In this program, we will create our own oscilloscope showing the voltage level on one of the arduino inputs.
 *  It is also the first program in which we will use the display display.
 */ 
#define PROJECT_NAME "Knob-Oscillo"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define POTENTIOMETER A1
#define HEIGHT 64
#define WIDTH 128
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
//Creating a variable responsible for the display display.
Adafruit_SSD1306 display(0);

//We want our oscilloscope to have a history of voltage. 
//To enable this, we have created an array that stores the previous values. 
//As you can see, it's a character type. This is necessary due to memory restrictions imposed by Arduino. 
//And for this task, we are quite sufficient for char instead of int.
char level[WIDTH];

void setup(){
  Serial.begin(9600);
  lcd.begin(16, 2);
  intro(lcd);

  //the begin() method allows us to start working with the display. Its parameters should always be the same.
  display.begin(0x2, 0x3C, false);
  //clearDisplay () in turn cleans the entire display screen
  display.clearDisplay();

  
  for(int i = 0; i < WIDTH; i++)
    level[i] = 0;  
}

void loop(){
  //At this point, we move all the pixels one position. 
  //Unfortunately, this is not an optimal solution. 
  //If the display had a much wider width then we would have to rewrite much more information. 
  //Below you have an example of how you can do it differently.
  //(Commented section with loop)
  for(int i = 0; i < WIDTH - 1; i++)
    level[i] = level[i+1];

  level[WIDTH - 1] = map(analogRead(POTENTIOMETER), 1023,0, 0, HEIGHT - 1);
  display.clearDisplay();

  //In the following loop the drawPixel() method called to the display object
  //allows you to display the pixel in the right place - drawPixel(x, y, color)
  for(int i = 0; i < WIDTH; i++)
    display.drawPixel(i, level[i], 1);
    
  display.display();
}



//int pointer = 0;
//void loop(){
//  level[pointer] = map(analogRead(POTENTIOMETER), 0, 1023, 0, HEIGHT - 1);
//  display.clearDisplay();
//  
//  pointer++;
//  int j = 0;
//  for(int i = pointer; i < WIDTH; i++, j++)
//    display.drawPixel(j, level[i], 1);
//
//  for(int i = 0; i < pointer; i++, j++)
//    display.drawPixel(j, level[i], 1);
//    
//  if(pointer >= WIDTH){
//    pointer = 0;
//  }
//  display.display();
//}


  ''';

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const lcd_alphabet = '''
    /*  TME EDUCATION
 *  LCDAlphabet
 *  v0.1.0
 *  -------------
 *  In this program you will learn what an ASCII table is and how to display individual characters
 */ 
#define PROJECT_NAME "LCDAlphabet"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
char letter;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);
  letter = 65;
}

//Each letter has its numerical value, which corresponds to it. 
//By entering the appropriate value we can get the letter on the display on which we care. 
//The appropriate values can be found in the ASCII table. 
//The cut-down version of the ascii table is visible at the bottom of the program
//Your task is to display small letters and check what will happen 
//when the values are greater than 127. Remember that the maximum value is 255.
void loop(){
  lcd.setCursor(0, 0);
  
  lcd.print(letter);

  delay(500);
  
  letter++;
  if(letter > 90){
    letter = 65;
  }
}

  ''';
///////////////////////////////////////////////////////////////////////////////////////////////

  static const lcd_text = '''
    /*  TME EDUCATION
 *  LCDText
 *  v0.1.0
 *  -------------
 *  How to print text on LCD display
 */ 
#define PROJECT_NAME "LCDText"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board

//The line above told the program how we connect our screen to the board.
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  //Here we start work with our program. First, we have to give the program what dimensions our display has. 
  //That is, how many characters he can display. if you turn on your board you can see small rectangles on the display. 
  //This is the place for our signs.
  lcd.begin(16, 2);
  
  intro(lcd);

  //Yes. It's so simple. To write something on the display simply enter the name of the display, 
  //and then use the appropriate command to display the text
  lcd.print("Hello TME");

  //Now, guess what happens after you uncomment this code.
//  lcd.setCursor(3, 1);
//  lcd.print("Here we are");

  //Finally, look at the intro.h file. This file is responsible for the text you see immediately after starting the program.
  //I left some useful information for you there.
}

void loop(){
  
}
  ''';
///////////////////////////////////////////////////////////////////////////////////////////////////////

  static const lcd_watch = '''
    /*  TME EDUCATION
 *  LCDWatch
 *  v0.1.0
 *  -------------
 *  In this program we will learn how to handle time.
 */ 
#define PROJECT_NAME "LCDWatch"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

//In the previous program, we wrote our program using the setup () function. 
//This is part of the code that starts at the very start of our program.
void setup(){
  lcd.begin(16, 2);
  intro(lcd);
}


//Now we will use the loop () function. It takes place right after the setup () function and repeats
//over and over again until there is no electricity
void loop(){
  lcd.setCursor(0,0); //delete this line, and uncomment the following lines of code (under HOUR, MINUTES and SECONDS)
  //this change should fix the bug with the remaining 9 seconds. Do you know why this error occurred?
  
  //HOURS
//  lcd.setCursor(8, 0);
//  if(getHour() < 10){
//    lcd.print("0");
//  }
  lcd.print(getHour());
  lcd.print(":");

  //MINUTES
//  lcd.setCursor(11, 0);
//  if(getMinute() < 10){
//    lcd.print("0");
//  }
  lcd.print(getMinute());
  lcd.print(":");

  //SECONDS
//  lcd.setCursor(14, 0);
//  if(getSecond() < 10){
//    lcd.print("0");
//  }
  lcd.print(getSecond());
}

//Below you can see the function containing the millis() call. 
//millis() returns the nuber of milliseconds since the TME board began running the current program.
//We used this function to correctly return the program's time in the form of seconds, minutes and hours


int getMillis(){
  //Here we have a method giving milliseconds. Each second consists of 1000 milliseconds. 
  //Your task is to add a millisecond meter to our clock.
  //We use here modulo operation. This is the operator of the remainder of the division 
  //3%2 gives us 1. 3%3 equals 0. 
  return millis() % 1000;
}

int getSecond(){
  return (millis() / 1000) % 60;
}

int getMinute(){
  return (millis() / 1000 / 60) % 60;
}

int getHour(){
  return (millis() / 1000 / 60 / 60) % 60;
}

  ''';

//////////////////////////////////////////////////////////////////////////////////////////////////////

  static const led_blink = '''
/*  TME EDUCATION
 *  LEDBlink
 *  v0.1.0
 *  -------------
 *  In this lesson, we will learn to blink with a diode
 */ 
#define PROJECT_NAME "LEDBlink"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define LED_1 13

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  pinMode(LED_1, OUTPUT); //here we tell to program that we want to use our led in future  
}

void loop(){
  digitalWrite(LED_1, HIGH); //Now we turn on our led.
  delay(1000); //If you want to blink the diode, then you must first turn it on, then wait a bit, 
  //and then turn it off and wait again.
  digitalWrite(LED_1, LOW); //Now we turn off our led.
  delay(1000); //If we comment out the delay function, the diode will still be flashing, 
  //but with such a speed that the only thing we notice is its slight dimming.
}
  ''';
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const led_strip = '''
/*  TME EDUCATION
 *  LEDStrip
 *  v0.1.0
 *  -------------
 *  In this program you will learn how to use an LED strip built into the TME board
 */ 
#define PROJECT_NAME "LEDStrip"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define LED_SERIAL 12
#define LED_COUNT 5

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
//On the board we also have diodes connected to each other in a strip.
//Below, we define an object that will store information about these LEDs. For its creation, 
//we need information about the number of LEDs and where the first one is connected.
Adafruit_NeoPixel ledStrip = Adafruit_NeoPixel(LED_COUNT, LED_SERIAL, NEO_GRB + NEO_KHZ800);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  //Here we start work with diodes
  ledStrip.begin();

  //Now we can start working with diodes. In the setPixelColor method we give as parameters the first number of LEDs, 
  //and then the color values in the order of red, green, blue. We choose color values from 0 to 255.
  //TIP: Arguments for the setPixelColor function: setPixelColor(pixelNumber, red, green, blue);
  for(int i = 0; i < LED_COUNT; i++)
    ledStrip.setPixelColor(i, 5, 10, 20);
  
  //the show method starts the set color
  ledStrip.show();
  delay(1000);

  //the setBrightness method sets the brightness of the diode. By default, it has a value of 255. 
  //So giving 100 automatically reduce the brightness. We can do the same by choosing correspondingly smaller values 
  //in the setPixelColor method
  ledStrip.setBrightness(100);
  ledStrip.show();
  delay(1000);  
}

//It's your job to fix my error and run all the LEDs. A small change is needed. You can do it :)

void loop(){
  
}
  ''';
  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  static const light_sensor = '''
/*  TME EDUCATION
 *  LightSensor-Lcd
 *  v0.1.0
 *  -------------
 *  In this program, we will start the light sensor. Maybe you have a flashlight at hand? :)
 */ 
#define PROJECT_NAME "LightSensor-Lcd"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define LIGHT_SENSOR A3

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  Serial.begin(9600);
  lcd.begin(16, 2);
  intro(lcd);

  //I think you already know how to handle this sensor. 
  //You will see the effect of its operation on the serial monitor. 
  //You can start it by pressing Ctrl + Shift + M. 
  //Change the program so that it shows the intensity of light also on the LCD display.
  pinMode(LIGHT_SENSOR, INPUT);
}

void loop(){
  int light = analogRead(LIGHT_SENSOR) / 1023.0 * 100;
  
  Serial.print(light);
  Serial.println("%");
  lcd.setCursor (0,0);
  lcd.print (light);
  lcd.print ("%");
  delay (100);
  
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const logo_TME = '''
 /*  TME EDUCATION
 *  LogoTmeEdu
 *  v0.2.0
 *  -------------
 *  It is a program showing the TME EDUCATION Logo
 */ 
#define PROJECT_NAME "LogoTmeEdu"
#define VERSION "v0.2.0"
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4

#include "includes.h"
#include "graphics/logoTmeEducation.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate

////////DECLARATIONS/////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);
  
  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.drawBitmap(0, 0, logoTmeEducation, 128, 64, 1);
  display.display();
}

void loop(){  
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const mic_speacker = '''
    /*  TME EDUCATION
 *  Template
 *  v0.0.0
 *  -------------
 *  The program makes it possible to read data from the microphone and represent them using the speaker.
 */ 
 
#define PROJECT_NAME "Microphone-Speaker"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define SPEAKER 2
#define MICROPHONE 0
#define POTENTIOMETER 1

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  pinMode(SPEAKER, OUTPUT);  
  pinMode(MICROPHONE, INPUT);
}

unsigned long tempTime = 0;
int sensitivity = 250;

void loop(){
//Sometimes, when writing a program, we do not know how the equipment works, 
//or how any factor will affect the operation of the program. 
//That is why it is sometimes worth writing a program so that you can easily change its parameters. 
//In this case, by uncommenting the code below, you add the possibility to change the sensitivity. Useful, right?
  
//  if(tempTime < millis()){    
//    lcd.clear();
//    lcd.print(sensitivity);
//    tempTime = millis() + 500;
//  }  
//  sensitivity = analogRead(POTENTIOMETER);

  if(analogRead(MICROPHONE) > sensitivity){
    bip();
    delay(100);
  }
}

void bip(){
  digitalWrite(SPEAKER, HIGH);
  delay(1);
  digitalWrite(SPEAKER, LOW);
}

  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const oled_graphics = '''
    /*  TME EDUCATION
 *  In this program, we'll scratch a little using display display
 *  v0.1.0
 *  -------------
 *  display-Graphics
 */ 
#define PROJECT_NAME "display-Graphics"
#define VERSION "v0.1.0"
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4


#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);


//Creating programs is mainly finding a way to solve the problem. 
//Fortunately, we have some tools that will allow us to solve them. 
//In this program, I gave you some tools. Try to use them to do two things:
//- Draw a face
//- Make a tic-tac-toe game

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  //These methods are explained in the "Knob-Oscilloscope" program if you don't remember what they are responsible for.
  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
}


void loop(){
  //A branch() function is performed at the very bottom of the program. 
  //It is a recursive function, that is, one that calls itself.
  branch(64.0);
  display.display();
  delay(1000);
  display.clearDisplay();

  //drawChar(x, y, char, color, background, size) - draw a char
  display.drawChar(20, 0, 'x', 1, 1, 6);
  display.display();
  delay(1000);
  display.clearDisplay();

  //drawCircle(x, y, radius, color) - draw a circle
  display.drawCircle(32, 32, 10, 1);
  display.display();
  delay(1000);
  display.clearDisplay();

  //drawTriangle(x0, y0, x1, y1, x2, y2, color) - draw a triangle
  display.drawTriangle(32, 32, 10, 50, 10, 20, 1);
  display.display();
  delay(1000);
  display.clearDisplay();

  //drawRoundRect(x, y, width, height, radius, color) - draw a rounded rectangle
  display.drawRoundRect(32, 32, 20, 20, 5, 1);
  display.display();
  delay(1000);
  display.clearDisplay();

  //fillRoundRect(x, y, width, height, radius, color) - draw a filled rounded rectangle
  display.fillRoundRect(32, 32, 20, 20, 5, 1);
  display.display();
  delay(1000);
  display.clearDisplay();

  //drawFastVLine(x, y, height, color) - draw a vertical line
  //drawFastHLine(x, y, widht, color) - draw a horizontal line
  display.drawFastVLine(10, 10, 20, 1);
  display.drawFastHLine(10, 10, 20, 1);
  display.display();
  delay(1000);
  display.clearDisplay();
}


//the recursive function is here ;)
void branch(float h){
  h *= 0.66;

  if(h>2){
    //drawLine(x0, y0, x1, y1, color) - draw a line
    display.drawLine(h, h, h*2+10, h+10, 1);
    branch(h);
  }
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const paint = '''
    /*  TME EDUCATION
 *  Paint
 *  v0.0.0
 *  -------------
 *  Description
 */ 
#define PROJECT_NAME "Paint"
#define VERSION "v0.0.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_LEFT 4
#define KEY_DOWN 5
#define KEY_UP 6
#define KEY_RIGHT 7
#define KEY_CENTER 8
#define POTENTIOMETER 1

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate
#define DISPLAY_HEIGHT 64
#define DISPLAY_WIDTH 128

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(DISPLAY_WIDTH, DISPLAY_HEIGHT, &Wire, 4);
unsigned long screenTime;
unsigned long blinkTime;

//uint8_t bitmapp[1024];

struct xy{
  int x;
  int y;
} cursor;

enum opt{
  SETTINGS = 0,
  DRAW
} option;

enum drawingOpt{
  TOOL = 0,
  SIZE
} drawingOption = TOOL;

enum toolsOpt{
  PEN = 0,
  SPRAY,
  ERASER
} toolType = PEN;

int sizeOfTool = 1;

bool blink = true;

void setup(){
//  Serial.begin(9600);
//  Serial.println("a");
  lcd.begin(16, 2);
  intro(lcd);

  pinMode(KEY_LEFT, INPUT);
  pinMode(KEY_DOWN, INPUT);
  pinMode(KEY_UP, INPUT);
  pinMode(KEY_RIGHT, INPUT);
  pinMode(KEY_CENTER, INPUT);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();

  cursor.x = 0;
  cursor.y = 0;
//  Serial.println("b");
//  for(int i = 0; i < 1024; i++){
//    bitmapp[i] = 0;
//  }
//  Serial.println("c");
//  Serial.println("SETUP");
//  for(int x = 0; x < 128; x += 5){
//    for(int y = 0; y < 64; y += 5){
//      drawPixelOnBitmap(x, y);
//    }
//  }
//  Serial.println("d");
  
//  display.clearDisplay();
//  display.drawBitmap(0, 0, bitmapp, 128, 64, 1);
//  display.display();
//  drawBitmap(bitmapp);
//  Serial.println("e");
  screenTime = millis();
  blinkTime = millis();

  lcd.clear();
  setupProgramMode();
  setupDrawingOption();
}
/////////////////////////////////////////////////
void loop(){  
  if(screenTime + 20 < millis()){ // SLOW LOOP FOR DRAWING

    // STEROWANIE KURSOREM RYSOWANIA
    if(option == DRAW){
      if(digitalRead(KEY_LEFT)){
        cursor.x--;
        if(cursor.x < 0){
          cursor.x = 0;
        }
      }
      if(digitalRead(KEY_RIGHT)){      
        cursor.x++;
        if(cursor.x > DISPLAY_WIDTH){
          cursor.x = DISPLAY_WIDTH;
        }
      }
      if(digitalRead(KEY_UP)){
        cursor.y--;
        if(cursor.y < 0){
          cursor.y = 0;
        }
      }
      if(digitalRead(KEY_DOWN)){
        cursor.y++;
        if(cursor.y > DISPLAY_HEIGHT){
          cursor.y = DISPLAY_HEIGHT;
        }
      }
    } else if(option == SETTINGS){ // STEROWANIE OPCJAMI RYSOWANIA
      if(digitalRead(KEY_LEFT)){
        drawingOption = (drawingOpt)(drawingOption - 1);
        if(drawingOption < 0)
          drawingOption = (drawingOpt)1;
        delay(200);
      }
      if(digitalRead(KEY_RIGHT)){ 
        drawingOption = (drawingOpt)(drawingOption + 1);
        if(drawingOption > 1)
          drawingOption = (drawingOpt)0;
        delay(200);
      }

      if(digitalRead(KEY_UP)){
        if(drawingOption == TOOL){
          toolType = (toolsOpt)(toolType + 1);
          if(toolType > 2)
            toolType = (toolsOpt)0;
        }else if(drawingOption == SIZE){
          sizeOfTool++;
          if(sizeOfTool > 20)
            sizeOfTool = 20;
        }
        delay(200);
      }
      if(digitalRead(KEY_DOWN)){
        if(drawingOption == TOOL){
          toolType = (toolsOpt)(toolType - 1);
          if(toolType < 0)
            toolType = (toolsOpt)2;
        }else if(drawingOption == SIZE){
          sizeOfTool--;
          if(sizeOfTool < 1)
            sizeOfTool = 1;
        }
        delay(200);
      }

      updateDrawingOption();

    }
    
    // DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING DRAWING
    if(digitalRead(KEY_CENTER)){
      if(toolType == PEN){
        pen();
      } else if(toolType == SPRAY){
        spray();
      } else if(toolType == ERASER){
        eraser();
      }
    }
    
    display.display();

    screenTime = millis();    
  }

  // BLINK AND LCD
  if(blinkTime + 500 < millis()){
    if(analogRead(POTENTIOMETER) > 500){
      option = SETTINGS;
      // settings();
    } else {
      option = DRAW;
      // drawing();
    }

    blink = !blink;
    updateProgramMode();

    blinkTime = millis();
  }
}
/////////////////////////////////////////////////////////////////////

void setupDrawingOption(){
  
}

void updateDrawingOption(){
  lcd.setCursor(1, 1);
  if(toolType == PEN){
    lcd.print(" PEN  ");
  } else if(toolType == SPRAY){
    lcd.print("SPRAY ");
  } else if(toolType == ERASER){
    lcd.print("ERASER");
  }

  lcd.setCursor(13, 1);
  if(sizeOfTool < 10)
    lcd.print("0");
  lcd.print(sizeOfTool); 

  if(drawingOption == TOOL){
    lcd.setCursor(12, 1);
    lcd.print(" ");
    lcd.setCursor(15, 1);
    lcd.print(" ");

    lcd.setCursor(0, 1);
    drawBlink('>');
    
    lcd.setCursor(7, 1);
    drawBlink('<');
    
  } else if(drawingOption == SIZE){
    lcd.setCursor(0, 1);
    lcd.print(" ");
    lcd.setCursor(7, 1);
    lcd.print(" ");

    lcd.setCursor(12, 1);
    drawBlink('>');       

    lcd.setCursor(15, 1);
    drawBlink('<');
  }
}

void setupProgramMode(){
  lcd.setCursor(1, 0);
  lcd.print("settings");

  lcd.setCursor(11, 0);
  lcd.print("draw");
}

void updateProgramMode(){
  lcd.setCursor(0, 1);
  lcd.print(" ");
  lcd.setCursor(7, 1);
  lcd.print(" ");
  lcd.setCursor(12, 1);
  lcd.print(" ");
  lcd.setCursor(15, 1);
  lcd.print(" ");

  lcd.setCursor(10, 00);
  lcd.print(" ");
  lcd.setCursor(15, 0);
  lcd.print(" ");
  lcd.setCursor(0, 0);
  lcd.print(" ");
  lcd.setCursor(9, 0);
  lcd.print(" ");

  if(option == SETTINGS){
    lcd.setCursor(0, 0);
    drawBlink('>');

    lcd.setCursor(9, 0);
    drawBlink('<');
  } else if(option == DRAW){
    lcd.setCursor(10, 00);
    drawBlink('>');

    lcd.setCursor(15, 0);
    drawBlink('<');
  }
}

void drawBlink(char character){
  if(blink){
    lcd.print(character);
  } else {
    lcd.print(" ");
  }
}

void pen(){
  display.fillCircle(cursor.x, cursor.y, sizeOfTool, 1);
}

void spray(){
  display.drawPixel(cursor.x + random(sizeOfTool) - sizeOfTool / 2, cursor.y + random(sizeOfTool) - sizeOfTool / 2, 1);
  display.drawPixel(cursor.x + random(sizeOfTool) - sizeOfTool / 2, cursor.y + random(sizeOfTool) - sizeOfTool / 2, 1);
  display.drawPixel(cursor.x + random(sizeOfTool) - sizeOfTool / 2, cursor.y + random(sizeOfTool) - sizeOfTool / 2, 1);
  display.drawPixel(cursor.x + random(sizeOfTool) - sizeOfTool / 2, cursor.y + random(sizeOfTool) - sizeOfTool / 2, 1);
}

void eraser(){
  display.fillRect(cursor.x - sizeOfTool, cursor.y - sizeOfTool, sizeOfTool * 2, sizeOfTool * 2, 0);
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const pong_game = '''
    /*  TME EDUCATION
 *  Template
 *  v0.0.0
 *  -------------
 *  Description
 */ 
#define PROJECT_NAME "Template"
#define VERSION "v0.0.0"
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4


#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define POTENTIOMETER A1
#define BUZZER 2
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);

int xVel = 1;
int yVel = 1;
int speed = 3;
bool up = true;
bool right = true;

int p1points = 0;
int p2points = 0;

struct vector{
  int x;
  int y;
}ball, p1, p2;

void setup(){
  lcd.begin(16, 2);
//  intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();
  
  pinMode(BUZZER, OUTPUT);
  
  p1.x = 5;
  p1.y = 0;
  
  p2.x = 123;
  p2.y = 0;

  ball.x = 10;
  ball.y = random(20);

  display.setTextColor(1); 
  display.setTextSize(2);
}

void loop(){
  ballPhysics();
  p1Physics();
  p2Physics();
  
  display.clearDisplay();
  drawPlayers();
  drawBall();
  drawPoints();
  display.display();
  
  delay(50);
  speed = p2points + 3;
}


void ballPhysics(){
  if(ball.x <= 0){
    right = true;
    p2points++;
    xVel = -xVel;
  }
  if(ball.x >= 127){
    right = false;
    p1points++;
    xVel = -xVel;
  }
  ///////////
  if(ball.y <= 0){
    yVel = -yVel;
    up = false;    
  }
  if(ball.y >= 63){
    yVel = -yVel;
    up = true;    
  }
////////////

    

//////////////////
  if(ball.x <= 8){
    
    if(ball.y >= p1.y && ball.y < p1.y + 5){
      beep();
      yVel = -1;
      xVel = 1;
    }
    if(ball.y >= p1.y + 5 && ball.y < p1.y + 10){
      beep();
      yVel = 0;
      xVel = 1;
    }
    if(ball.y >= p1.y + 10 && ball.y < p1.y + 15){
      beep();
      yVel = 1;
      xVel = 1;
    }
  }
  if(ball.x >= 120){
    
    if(ball.y >= p2.y && ball.y < p2.y + 5){
      beep();
      yVel = -1;
      xVel = -1;
    }
    if(ball.y >= p2.y + 5 && ball.y < p2.y + 10){
      beep();
      yVel = 0;
      xVel = -1;
    }
    if(ball.y >= p2.y + 10 && ball.y < p2.y + 15){
      beep();
      yVel = 1;
      xVel = -1;
    }
  }

  //////////////
  ball.y += yVel * speed;

    ball.x += xVel * speed;
}

void p1Physics(){
  if(p1.y < ball.y -7){
    p1.y += 2;
  }else{
    p1.y -= 2;
  }
}

void p2Physics(){
  p2.y = map(analogRead(POTENTIOMETER), 0, 1023, 0, 63);
}

void drawPlayers(){
  display.fillRect(p1.x, p1.y, 3, 15, 1);
  display.fillRect(p2.x, p2.y, 3, 15, 1);
}

void drawBall(){
  display.fillCircle(ball.x, ball.y, 3, 1);
}

void drawPoints(){
  display.setCursor(30, 5);
  display.print(p1points);
  display.setCursor(90, 5);
  display.print(p2points);
}

void beep(){
  digitalWrite(BUZZER, HIGH);
  delay(10);
  digitalWrite(BUZZER, LOW);
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const rgb_show = '''
    /*  TME EDUCATION
 *  Rgb Show
 *  v0.1.0
 *  -------------
 *  Rgb Show
 */ 
#define PROJECT_NAME "Rgb Show"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define POTENTIOMETER A1
#define LED_SERIAL 12
#define LED_COUNT 5

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_NeoPixel ledStrip = Adafruit_NeoPixel(LED_COUNT, LED_SERIAL, NEO_GRB + NEO_KHZ800);
Adafruit_MCP23008 seg;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  pinMode(POTENTIOMETER, INPUT);

  lcd.print("       Use");
  lcd.setCursor(0, 1);
  lcd.print("  potentiometer");

  seg.begin(0x4);
  for(int i = 0; i < 8; i++)
    seg.pinMode(i, OUTPUT);

  ledStrip.begin();
  ledStrip.show();
}
int angle = 0;
void loop(){
  angle += 1;
  delay(10);
  if(angle > 360){
    angle = 0;
  }
  setColor(hue(map(analogRead(POTENTIOMETER), 0, 1023, 0, 360)));

  printOnSevenSeg(map(angle, 0, 360, 0, 10));
}

void setColor(uint32_t color){
  
  // for(uint16_t i = 0; i < analogRead(POTENTIOMETER)/256; i++){
  //   if()
  // }
  int pot = (map(analogRead(POTENTIOMETER), 0, 1023, 0, 5));
  ledStrip.setPixelColor(pot, color);
  if(pot == 0){
    setColorForAll(hue(angle));
  }
  ledStrip.show();
}

void setColorForAll(uint32_t color){
  for(uint16_t i = 0; i < ledStrip.numPixels(); i++){
    ledStrip.setPixelColor(i, color);
  }  
  ledStrip.show();
}

uint32_t hue(int angle){
  if(angle > 360)
    angle = 360;
  if(angle < 0)
    angle = 0;

  angle = 360 - angle;

  if(angle <= 60){
    return ledStrip.Color(255, angle * (255.0 / 60.0), 0);
  }else if(angle <= 120){
    return ledStrip.Color(255 - ((angle - 60) * (255.0 / 60.0)), 255, 0);
  }else if(angle <= 180){
    return ledStrip.Color(0, 255, (angle - 120) * (255.0 / 60.0));
  }else if(angle <= 240){
    return ledStrip.Color(0, 255 - ((angle - 180) * (255.0 / 60.0)), 255);
  }else if(angle <= 300){
    return ledStrip.Color((angle - 240) * (255.0 / 60.0), 0, 255);
  }else if(angle <= 360){
    return ledStrip.Color(255, 0, 255 - ((angle - 300) * (255.0 / 60.0)));
  }
}

void printOnSevenSeg(int sign){
  uint8_t data = 0;
  
  switch(sign){
    case 0:
      data = B11111100;
      break;
    case 1:
      data = B01100000;
      break;
    case 2:
      data = B11011010;
      break;
    case 3:
      data = B11110010;
      break;
    case 4:
      data = B01100110;
      break;
    case 5:
      data = B10110110;
      break;
    case 6:
      data = B10111110;
      break;
    case 7:
      data = B11100000;
      break;
    case 8:
      data = B11111110;
      break;
    case 9:
      data = B11110110;
      break;
  }
  for(int i = 0; i < 8; i++)
    seg.digitalWrite(i, bitRead(data, 7 - i));  
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const rand_num = '''
    /*  TME EDUCATION
 *  Random
 *  v0.1.0
 *  -------------
 *  Random numbers
 */ 
#define PROJECT_NAME "Random"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_RIGHT 7
#define KEY_LEFT 4
#define MICROPHONE A0
#define BUZZER 2
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4
////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_MCP23008 seg;
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);


void setup(){
  lcd.begin(16, 2);
  // intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  display.display();

  seg.begin(0x4);
  for(int i = 0; i < 8; i++)
    seg.pinMode(i, OUTPUT);

  pinMode(KEY_RIGHT , INPUT);
  pinMode(KEY_LEFT , INPUT);
  pinMode(MICROPHONE, INPUT);

  randomSeed(analogRead(MICROPHONE));

  lcd.print(" press to rand");
  lcd.setCursor(0, 1);
  lcd.print("<- one or two ->");

  display.setTextColor(1); 
  display.setTextSize(8);
}

void loop(){
  if(digitalRead(KEY_LEFT)){
    while(digitalRead(KEY_LEFT)){
      display.clearDisplay();
      display.setCursor(45, 0);
      display.println(random(0, 9));
      display.display();

      if(millis() % 200 > 100 && millis() % 200 < 150)
        tone(BUZZER, 1000, 100);
    }
    delay(5000);
  }

  if(digitalRead(KEY_RIGHT)){
    while(digitalRead(KEY_RIGHT)){
      display.clearDisplay();
      display.setCursor(45, 0);
      display.println(random(0, 10));
      display.display();

      printOnSevenSeg(random(0, 10));
    
      if(millis() % 200 > 100 && millis() % 200 < 150)
        tone(BUZZER, 1000, 100);
    }
    delay(5000);
  }

  if(millis() % 1000 == 0){
    tone(BUZZER, 1000, 100);

    display.clearDisplay();
    display.setCursor(45, 0);
    display.println(random(0, 10));
    display.display();

    printOnSevenSeg(random(0, 10));
  }
}

void printOnSevenSeg(int sign){
  uint8_t data = 0;
  
  switch(sign){
    case 0:
      data = B11111100;
      break;
    case 1:
      data = B01100000;
      break;
    case 2:
      data = B11011010;
      break;
    case 3:
      data = B11110010;
      break;
    case 4:
      data = B01100110;
      break;
    case 5:
      data = B10110110;
      break;
    case 6:
      data = B10111110;
      break;
    case 7:
      data = B11100000;
      break;
    case 8:
      data = B11111110;
      break;
    case 9:
      data = B11110110;
      break;
  }
  for(int i = 0; i < 8; i++)
    seg.digitalWrite(i, bitRead(data, 7 - i));  
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const snake_game = '''
    /*  TME EDUCATION
 *  Snake
 *  v1.0.0
 *  -------------
 *  A snake game using an display display
 */ 
#define PROJECT_NAME "Snake"
#define VERSION "v1.0.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_LEFT 4
#define KEY_DOWN 5
#define KEY_UP 6
#define KEY_RIGHT 7 
#define KEY_CENTER 8
#define POTENTIOMETER 1
#define BUZZER 2
#define LED 13

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate
#define DISPLAY_HEIGHT 64
#define DISPLAY_WIDTH 128
#define CANVAS_HEIGHT 9
#define CANVAS_WIDTH 18
#define SEGMENT_SIZE 3
#define MARGIN_TOP 11 //max 11
#define MARGIN_LEFT 21 //max 21

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(DISPLAY_WIDTH, DISPLAY_HEIGHT, &Wire, 4);

uint8_t headX = 4;
uint8_t headY = 4;
uint8_t tailX[31] = {};
uint8_t tailY[31] = {};
uint8_t foodX = 1;
uint8_t foodY = 1;
uint8_t snakeSize = 0;
unsigned long lastTime;
enum {
  left,
  right,
  up,
  down,
} direction, lastDirection;

void setup(){
  lcd.begin(16, 2);
 intro(lcd);

  pinMode(KEY_LEFT, INPUT);
  pinMode(KEY_DOWN, INPUT);
  pinMode(KEY_UP, INPUT);
  pinMode(KEY_RIGHT, INPUT);
  pinMode(KEY_CENTER, INPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(LED, OUTPUT);
  
  display.begin(0x2, 0x3C, false);
  display.setTextColor(1);
  display.setTextSize(2);
  display.clearDisplay();
  drawCanvas();
  createFood();
  display.display();

  lastTime = millis();
}

void loop(){
  if(digitalRead(KEY_LEFT) && lastDirection != right){
    direction = left;
  }
  if(digitalRead(KEY_RIGHT) && lastDirection != left){
    direction = right;
  }
  if(digitalRead(KEY_UP) && lastDirection != down){
    direction = up;
  }
  if(digitalRead(KEY_DOWN) && lastDirection != up){
    direction = down;
  }

  int pot = analogRead(POTENTIOMETER);
  int speedUp = 0;
  if(pot > 950){
    if(snakeSize < 7)
      speedUp += snakeSize * 100;
    else
      speedUp += snakeSize * 25 + 600;    
  }
  if(lastTime + pot - speedUp < millis()){
    lastDirection = direction;
    
    if(direction == left){
      if(headX == 0){
        headX = CANVAS_WIDTH;
      }
      headX--;
    }
    if(direction == right){      
      headX++;
      if(headX == CANVAS_WIDTH){
        headX = 0;
      }
    }
    if(direction == up){
      if(headY == 0){
        headY = CANVAS_HEIGHT;
      }
      headY--;
    }
    if(direction == down){
      headY++;
      if(headY == CANVAS_HEIGHT){
        headY = 0;
      }
    }

    drawSnake();
    lastTime = millis();
  }
}

void drawSnake(){
  drawSegment(tailX[snakeSize], tailY[snakeSize], 0);
  
  for(int i = snakeSize; i > 0; i--){
    if(tailX[i] == headX && tailY[i] == headY && i != snakeSize || snakeSize == 30){
      String endingText = snakeSize == 30 ? "YOU WIN" : "GAME OVER";
      snakeSize = 0;
      display.clearDisplay();      
      display.setCursor(10, 30);      
      display.println(endingText);
      display.display();
      play(0, 120);
      play(1175, 120);
      play(1047, 480);
      delay(4000);
      display.clearDisplay();
      drawCanvas();
      createFood();
    }
    tailX[i] = tailX[i - 1];
    tailY[i] = tailY[i - 1];
  }

  tailX[0] = headX;
  tailY[0] = headY;

  if(headX == foodX && headY == foodY){
    createFood();
    snakeSize++;
  }

  clearScore();
  display.setCursor(0, 0);
  display.println(snakeSize);
  
  drawSegment(headX, headY, 1);
  display.display();
}

void createFood(){
  boolean drawAgain = true;

  drawFood(foodX, foodY, 0);
  drawCanvas();
  beep();
  while(drawAgain){
    drawAgain = false;
    foodX = random(0, CANVAS_WIDTH);
    foodY = random(0, CANVAS_HEIGHT);
    
    for(int i = 0; i < snakeSize; i++){
      if(tailX[i] == foodX && tailY[i] == foodY){
        drawAgain = true;
      }
    }
  }

  drawFood(foodX, foodY, 1);
}

void drawFood(uint8_t x, uint8_t y, uint8_t color){
  display.drawRoundRect(MARGIN_LEFT + 0 + x * SEGMENT_SIZE * 2, // x
                     MARGIN_TOP + 0 + y * SEGMENT_SIZE * 2, // y
                     5, // width
                     5, // height
                     0, // radius
                     color); // color
}

void drawSegment(uint8_t x, uint8_t y, uint8_t color){
  display.fillRoundRect(MARGIN_LEFT + 1 + x * SEGMENT_SIZE * 2, // x
                     MARGIN_TOP + 1 + y * SEGMENT_SIZE * 2, // y
                     3, // width
                     3, // height
                     0, // radius
                     color); // color
}

void drawCanvas(){
  display.drawRoundRect(MARGIN_LEFT, // x
                     MARGIN_TOP, // y
                     CANVAS_WIDTH * SEGMENT_SIZE * 2 - SEGMENT_SIZE + 2, // width
                     CANVAS_HEIGHT * SEGMENT_SIZE * 2 - SEGMENT_SIZE + 2, // height
                     0, // radius
                     1); // color
}

void clearScore(){
  display.fillRoundRect(0, // x
                     0, // y
                     22, // width
                     22, // height
                     0, // radius
                     0); // color
  drawCanvas();
}

void beep(){
  digitalWrite(BUZZER, HIGH);
  digitalWrite(LED, HIGH);
  delay(10);
  digitalWrite(BUZZER, LOW);
  digitalWrite(LED, LOW);
}

void play(int freq, int duration){
  tone(BUZZER, freq, duration);
  delay(duration);
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const thermometer_lcd = '''
    /*  TME EDUCATION
 *  Thermometer-Lcd
 *  v0.1.0
 *  -------------
 *  In this program we will use the built-in thermometer to show the ambient temperature.
 */ 
#define PROJECT_NAME "Thermometer-Lcd"
#define VERSION "v0.1.0"

#include "includes.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define THERMOMETER A2

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  //The thermometer as the loudspeaker is an analog device. 
  //The read value should be scaled to the known value given in degrees Celsius or Fahrenheit.
  pinMode(THERMOMETER, INPUT);
}

void loop(){
  lcd.setCursor(0,0);
  lcd.print(analogRead(THERMOMETER) * 0.125 - 22.0);
  delay(500);  
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const tme_demo = '''
    /* Requied libraries:
 *  - hd44780 by Bill Perry
 *  - Adafriut_SSD1306
 *  - Adafriut_GFX
 *  - Adafriut_NEoPixel
 */

 /* 
  *  BUTTONS:
  *  UP:      light RED(RGB) LED 
  *  DOWN:    light BLUE(RGB) LED
  *  LEFT:    light BLUE LED
  *  RIGHT:   make some noise (buzzer)
  *  CENTER:  light GREEN(RGB) LED
  *  
  * ADDRESSABLE LEDs (WS2812):
  *   [0] - random color
  *   [1-4] - PCB backlight (BLUE)
  */
  
#include <SoftwareSerial.h>

#include <Wire.h>
#include <hd44780.h>
#include <hd44780ioClass/hd44780_I2Cexp.h>

#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4

Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);
//#define LOGO16_GLCD_HEIGHT 16 
//#define LOGO16_GLCD_WIDTH  16 

#include <Adafruit_NeoPixel.h>

#include "Adafruit_MCP23008.h"

#define IR_PIN 3
#include <RC5.h>

const int LCD_ROWS = 2;
const int LCD_COLS = 16;

int LED1 = 13;
int LED3_R = 9;
int LED3_G = 10;
int LED3_B = 11;
int LED_SERIAL = 12;

#define NUMPIXELS 5 // number of WS2812 LEDs in string
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, LED_SERIAL, NEO_GRB + NEO_KHZ800);

Adafruit_MCP23008 mcp;

RC5 rc5(IR_PIN); // IR receiver
byte addr; 
byte cmd;
byte tog;

int SW_LEFT = 4;
int SW_RIGHT = 7;
int SW_UP = 6;
int SW_DOWN = 5;
int SW_ENTER = 8;

int BUZZ = 2;
int IRREC = 3;
int LIGHT = A3;
int TEMP = A2; 
int ROT = A1;
int MIC = A0;

int c1, c2, c3;
int cmax = 31;

/* 7-segment digits map */
uint8_t seg7[11] = {
  B11111100, // 0
  B01100000, // 1
  B11011010, // 2
  B11110010, // 3
  B01100110, // 4
  B10110110, // 5
  B10111110, // 6
  B11100000, // 7
  B11111110, // 8
  B11110110, // 9
  B01100001  // 1. (10)
};


hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008,7,6,5,4,3,2,1,HIGH);


void setup() {

  Serial.begin(9600); 

  /* initialize expander for 7-seg display */
  mcp.begin(0x4); // offset above 0x20 (lowest address)
  mcp.pinMode(0, OUTPUT);
  mcp.pinMode(1, OUTPUT);
  mcp.pinMode(2, OUTPUT);
  mcp.pinMode(3, OUTPUT);
  mcp.pinMode(4, OUTPUT);
  mcp.pinMode(5, OUTPUT);
  mcp.pinMode(6, OUTPUT);
  mcp.pinMode(7, OUTPUT);
  
  pinMode(LED1, OUTPUT);
  pinMode(LED3_R, OUTPUT);
  pinMode(LED3_G, OUTPUT);
  pinMode(LED3_B, OUTPUT);
  pinMode(BUZZ, OUTPUT);

  pinMode(SW_LEFT , INPUT);
  pinMode(SW_RIGHT , INPUT);
  pinMode(SW_UP , INPUT);
  pinMode(SW_DOWN , INPUT);

  pinMode(LIGHT, INPUT);
  pinMode(TEMP, INPUT);
  pinMode(ROT, INPUT);
  pinMode(IRREC, OUTPUT);


  digitalWrite(LED1, LOW);
  digitalWrite(LED3_R, LOW);
  digitalWrite(LED3_G, LOW);
  digitalWrite(LED3_B, LOW);

  if( lcd.begin(LCD_COLS, LCD_ROWS)){
  }

  lcd.print(" Welcome to");
  lcd.setCursor(0, 1);
  lcd.print(" TME EDUCATION ");

  /* OLED TEST */
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C, false);
  delay(100);
  display.clearDisplay();
  delay(100);
  
  /* initialize WS2812 LED string*/
  pixels.begin();
  
  for (int k=0; k<250; k++)
  {
    pixels.setPixelColor(1, pixels.Color(0,0,k));
    pixels.setPixelColor(2, pixels.Color(0,0,k));
    pixels.setPixelColor(3, pixels.Color(0,0,k));
    pixels.setPixelColor(4, pixels.Color(0,0,k));
    pixels.show();
    delay(5);
  }
  for (int k=250; k>100; k--)
  {
    pixels.setPixelColor(1, pixels.Color(0,0,k));
    pixels.setPixelColor(2, pixels.Color(0,0,k));
    pixels.setPixelColor(3, pixels.Color(0,0,k));
    pixels.setPixelColor(4, pixels.Color(0,0,k));
    pixels.show();
    delay(5);
  }

  digitalWrite(LED1, HIGH);
  delay(333);
  digitalWrite(LED1, LOW);
  
  digitalWrite(LED3_R, HIGH);
  pixels.setPixelColor(0, pixels.Color(255,0,0));
  pixels.show();
  delay(333);

  digitalWrite(LED3_R, LOW);
  digitalWrite(LED3_G, HIGH);
  pixels.setPixelColor(0, pixels.Color(0,255,0));
  pixels.show();
  delay(333);

  digitalWrite(LED3_G, LOW);
  digitalWrite(LED3_B, HIGH);
  pixels.setPixelColor(0, pixels.Color(0,0,255));
  pixels.show();
  delay(333);
  
  digitalWrite(LED3_B, LOW);
  pixels.setPixelColor(0, pixels.Color(0,0,0));
  pixels.show();  

  /* draw UI on OLED */
  display.setTextColor(WHITE);
  display.clearDisplay();
  display.setCursor(0,1);
  display.println("POTENTIOMETER:");
  display.setCursor(0,16);
  display.println("LIGHT SENSOR:");
  display.setCursor(0,31);
  display.println("MICROPHONE:");
  display.setCursor(0,46);
  display.println("TEMP. SENSOR:");

  display.drawRect(0, 10+15*0-1, 128, 5, 1);
  display.drawRect(0, 10+15*1-1, 128, 5, 1);
  display.drawRect(0, 10+15*2-1, 128, 5, 1);
  display.drawRect(0, 10+15*3-1, 128, 5, 1);
  display.display(); 

  delay(1000);
  lcd.clear();
}



void loop() {

  int ctemp;
  int crot;
  int clight;

  delay(500);

  /* light LED after button press */
  while(1) {
    for (int i=0; i<1; i++) {
      if(digitalRead(SW_LEFT))
        digitalWrite(LED1, HIGH);
      else 
        digitalWrite(LED1, LOW);
  
      if(digitalRead(SW_UP))
        digitalWrite(LED3_R, HIGH);
      else
        digitalWrite(LED3_R, LOW);
  
      if(digitalRead(SW_ENTER))
        digitalWrite(LED3_G, HIGH);
      else 
        digitalWrite(LED3_G, LOW);
  
      if(digitalRead(SW_DOWN))
        digitalWrite(LED3_B, HIGH);
      else 
        digitalWrite(LED3_B, LOW);
  
      if(digitalRead(SW_RIGHT))
        digitalWrite(BUZZ, HIGH);
      else 
        digitalWrite(BUZZ, LOW);
      delay(50);
    }

    crot =   (int)(((float)analogRead(ROT)/1023.0)*100.0);      // read potentiometer value
    clight = (int)(((float)analogRead(LIGHT)/1023.0)*100.0);    // read light sensor value
    ctemp = (int)(analogRead(TEMP)*0.125 - 22.0);               // read temperature sensor value

    Serial.print("R: "); Serial.print(crot);
    Serial.print("%, L: "); Serial.print(clight);
    Serial.print("%, T: "); Serial.print(ctemp);Serial.print("*C\n");

    /* LCD */
 
    lcd.setCursor(0, 0);
    lcd.print("R: "); lcd.print(crot); lcd.print("%  ");
    lcd.setCursor(8, 0);
    lcd.print("L: "); lcd.print(clight); lcd.print("%  ");
    lcd.setCursor(0, 1);
    lcd.print("T: "); lcd.print(ctemp); lcd.print((char)223); lcd.print("C  ");

    /* OLED */
    int proc;    
    proc = (int)(analogRead(ROT)/1024.0*100.0);
    draw_bar(1, proc, 1);
    proc = (int)(analogRead(LIGHT)/1024.0*100.0);
    draw_bar(2, proc, 1);
    proc = (int)(analogRead(MIC)/1024.0*100.0);
    draw_bar(3, proc, 1);
    proc = (int)(analogRead(TEMP)/1024.0*100.0);
    draw_bar(4, proc, 1);
    display.display();

    
    /* show first digit of potentiometer value on 7-segment display */
    int temp = (int)((float)analogRead(ROT)/101);
    for (int j=0; j<8; j++) 
      mcp.digitalWrite(j, (bool)bitRead(seg7[temp], 7-j));
    

    /* WS2812 */
    crot = analogRead(ROT);
 
  if (crot < 341)  // Lowest third of the potentiometer's range (0-340)
  {                  
    crot = (crot * 3) / 4; // Normalize to 0-255
    c1 = 255 - crot;  // Red from full to off
    c2 = crot;        // Green from off to full
    c3 = 1;             // Blue off
  }
  else if (crot < 682) // Middle third of potentiometer's range (341-681)
  {
    crot = ( (crot-341) * 3) / 4; // Normalize to 0-255
    c1 = 1;            // Red off
    c2 = 255 - crot; // Green from full to off
    c3 = crot;       // Blue from off to full
  }
  else  // Upper third of potentiometer"s range (682-1023)
  {
    crot = ( (crot-683) * 3) / 4; // Normalize to 0-255
    c1 = crot;       // Red from off to full
    c2 = 1;            // Green off
    c3 = 255 - crot; // Blue from full to off
  }
    pixels.setPixelColor(0, pixels.Color(c1,c2,c3));
    pixels.show();

    if (rc5.read(&tog, &addr, &cmd))
      {
        Serial.print("A:");
        Serial.print(addr);
        Serial.print(" K:");
        Serial.print(cmd);
        Serial.print(" T:");
        Serial.println(tog);
        Serial.print("\n");
      }

  } 
}

// display bar
void draw_bar(int line, int p, int col) {
  uint8_t color = 1;
  int split = (int)((display.width()-2) * p/100.0);
  display.fillRect(1, 10+15*(line-1), split, 3, 1);
  display.fillRect(split+1, 10+15*(line-1), display.width()-2-split, 3, 0);
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const timer = '''
    /*  TME EDUCATION
 *  Timer
 *  v0.1.0
 *  -------------
 *  Description
 */ 
#define PROJECT_NAME "Timer"
#define VERSION "v0.1.0"

#include "includes.h"
#include "graphics/logoTmeEducation.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_CENTER 8
#define BUZZER 2
#define LED 13
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate


////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);
int min, sec, milis;
unsigned long startTime;
boolean stoper = false, s1 = false, s2 = false;
int sMin1, sSec1, sMilis1, sMin2, sSec2, sMilis2;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);

  display.begin(0x2, 0x3C, false);
  display.setTextColor(1);

  pinMode(KEY_CENTER, INPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(LED, OUTPUT);
  display.clearDisplay();
  display.drawBitmap(0, 0, logoTmeEducation, 128, 64, 1);
  display.display();
  lcd.print("press center");
  lcd.setCursor (0,1);
  lcd.print (" button to start");

}

void loop(){
  if(stoper)
    display.clearDisplay();
    
  calculateTime();

  if(digitalRead(KEY_CENTER)){
    beep();
    if(stoper == false){
      stoper = true;
      s1 = false;
      s2 = false;
      startStoper();
    }else if(s1 == false){
      s1 = true;
      sMin1 = min;
      sSec1 = sec;
      sMilis1 = milis;
    } else if( s2 == false){
      s2 = true;
      sMin2 = min;
      sSec2 = sec;
      sMilis2 = milis;
    } else {
      stoper = false;
      drawTime();
    }
    while(digitalRead(KEY_CENTER))
      delay(100);
  }
  
  if(stoper)
    drawTime();
    
  drawSubtimes();


    
  display.display();
  delay(10);
}

void drawTime(){
  drawMin();
  drawSec();
  drawMilis();
}

void drawMin(){
  display.setCursor(25, 0);
  display.setTextSize(3);
  if(min < 10)
    display.print("0");
  display.print(min);
  if(sec%2 == 0)
    display.print(":");
}

void drawSec(){
  display.setCursor(78, 0);
  display.setTextSize(3);
  if(sec < 10)
    display.print("0");
  display.print(sec);
}

void drawMilis(){
  display.setCursor(116, 7);
  display.setTextSize(2);
  display.print(milis);
}

void calculateTime(){
  milis = (millis() - startTime) % 1000 / 100;
  sec = (millis() - startTime) / 1000 % 60;
  min = (millis() - startTime) / 1000 / 60 % 60;
}

void startStoper(){
  startTime = millis();
}

void drawSubtimes(){
  if(s1)
    drawFirstSubtime();
  if(s2)
    drawSecondSubtime();
}

void drawFirstSubtime(){
  display.setCursor(0, 25);
  display.setTextSize(2);

  display.print("loop-");
  
  if(sMin1 < 10)
    display.print("0");
  display.print(sMin1);
  display.print(":");

  if(sSec1 < 10)
    display.print("0");
  display.print(sSec1);

  display.setCursor(120, 32);
  display.setTextSize(1);
  display.print(sMilis1);
}

void drawSecondSubtime(){
  display.setCursor(0, 45);
  display.setTextSize(2);

  display.print("loop-");
  
  if(sMin2 < 10)
    display.print("0");
  display.print(sMin2);
  display.print(":");

  if(sSec2 < 10)
    display.print("0");
  display.print(sSec2);

  display.setCursor(120, 52);
  display.setTextSize(1);
  display.print(sMilis2);
}

void beep(){
  digitalWrite(BUZZER, HIGH);
  digitalWrite(LED, HIGH);
  delay(10);
  digitalWrite(BUZZER, LOW);
  digitalWrite(LED, LOW);
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  static const weather_station = '''
    /*  TME EDUCATION
 *  WheatherStation
 *  v0.3.0
 *  -------------
 *  It is a program showing the possibilities of using 
 *  a prototype board prepared by TME for the purpose 
 *  of creating a weather station
 */ 
#define PROJECT_NAME "WheatherStation"
#define VERSION "v0.3.0"

#include "includes.h"
#include "graphics/WeatherIcons.h"
////////CONSTANTS////////
//In this section, all constants resulting from the prototype board design are set
#define KEY_RIGHT 7
#define KEY_LEFT 4
#define KEY_UP 6
#define KEY_DOWN 5
#define KEY_CENTER 8
#define POTENTIOMETER A1
#define THERMOMETER A2
#define LIGHT_SENSOR A3
#define LED_SERIAL 12
#define LED_COUNT 5

////////MODIFIERS////////
//In this section there are constants whose modification will affect the operation of our plate
#define DELAY_BETWEEN_FRAMES 0.2
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define RESET_BTN 4

////////DECLARATIONS////////
//This section prepares variables that are responsible for the individual components on the board
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HEIGHT, &Wire, RESET_BTN);
hd44780_I2Cexp lcd(0x20, I2Cexp_MCP23008, 7, 6, 5, 4, 3, 2, 1, HIGH);
Adafruit_MCP23008 seg;
Adafruit_NeoPixel ledStrip = Adafruit_NeoPixel(LED_COUNT, LED_SERIAL, NEO_GRB + NEO_KHZ800);

boolean frame = true;
unsigned long time = 0;
int temp, light;

enum TempScale{
  CELSIUS,
  FAHRENHEIT
} tempScale;

enum Animation{
  CLOUD,
  RAIN,
  STORM,
  SUN
} animation;

void setup(){
  lcd.begin(16, 2);
  intro(lcd);
  
  display.begin(0x2, 0x3C, false);
  display.clearDisplay();
  
  seg.begin(0x4);
  for(int i = 0; i < 8; i++)
    seg.pinMode(i, OUTPUT);

  ledStrip.begin();

  pinMode(THERMOMETER, INPUT);
  pinMode(LIGHT_SENSOR, INPUT);
  pinMode(POTENTIOMETER, INPUT);

  pinMode(KEY_RIGHT , INPUT);
  pinMode(KEY_LEFT , INPUT);
  pinMode(KEY_UP , INPUT);
  pinMode(KEY_DOWN , INPUT);
  pinMode(KEY_CENTER , INPUT);  
}

void loop(){
  for(int led = 1; led < LED_COUNT; led++)
    ledStrip.setPixelColor(led, 50, analogRead(POTENTIOMETER) / 1023.0 * 255, 100);
  ledStrip.show();

  if(digitalRead(KEY_CENTER)){
    delay(500);
    if(tempScale == CELSIUS){
      tempScale = FAHRENHEIT;
    }else{
      tempScale = CELSIUS;
    }
  }
  
  if(tempScale == CELSIUS){
    printOnSevenSeg('c');
    temp = getTemperature(TempScale(CELSIUS));
  }else{
    printOnSevenSeg('f');
    temp = getTemperature(TempScale(FAHRENHEIT));
  }

  light = analogRead(LIGHT_SENSOR) / 1023.0 * 100;  

  animation = readArrowKey();

  if(millis() > time){
    printNextFrame();
    
    time = millis() + (1000 * DELAY_BETWEEN_FRAMES);
    
    lcd.setCursor(0, 0);
    lcd.print("Temperature ");
    lcd.print(temp);
    lcd.print((char)223);
    lcd.print(tempScale == CELSIUS ? "C " : "F ");
    
    lcd.setCursor(0, 1);
    lcd.print("Light       ");
    lcd.print(light);
    lcd.print("% ");
  }
}

void printOnSevenSeg(char sign){
  uint8_t data = 0;
  
  switch(sign){
    case '0':
      data = B11111100;
      break;
    case '1':
      data = B01100000;
      break;
    case '2':
      data = B11011010;
      break;
    case '3':
      data = B11110010;
      break;
    case '4':
      data = B01100110;
      break;
    case '5':
      data = B10110110;
      break;
    case '6':
      data = B10111110;
      break;
    case '7':
      data = B11100000;
      break;
    case '8':
      data = B11111110;
      break;
    case '9':
      data = B11110110;
      break;
    case 'c':
      data = B10011100;
      break;
    case 'f':
      data = B10001110;
      break;
  }
  
  for(int i = 0; i < 8; i++)
    seg.digitalWrite(i, bitRead(data, 7 - i));  
}

void printNextFrame(){  
  display.clearDisplay();

  frame ? display.drawBitmap(32, 0, icons[animation * 2], 64, 64, 1) : display.drawBitmap(32, 0, icons[animation * 2 + 1], 64, 64, 1);

  frame = !frame;  
  display.display();
}

int getTemperature(TempScale tempScale){
  if(tempScale == CELSIUS){
    return analogRead(THERMOMETER) * 0.125 - 22.0;
  }
  if(tempScale == FAHRENHEIT){
    return (analogRead(THERMOMETER) * 0.125 - 22.0) * 9/5 + 32;
  }
}

Animation readArrowKey(){
  if(digitalRead(KEY_RIGHT)){
    return Animation(CLOUD);
  }
  if(digitalRead(KEY_LEFT)){
    return Animation(RAIN);
  }
  if(digitalRead(KEY_UP)){
    return Animation(STORM);
  }
  if(digitalRead(KEY_DOWN)){
    return Animation(SUN);
  }
}
  ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static const dice = '''
    
  // ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static const dice = '''
    
  // ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static const dice = '''
    
  // ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static const dice = '''
    
  // ''';

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static const dice = '''
    
  // ''';
}
