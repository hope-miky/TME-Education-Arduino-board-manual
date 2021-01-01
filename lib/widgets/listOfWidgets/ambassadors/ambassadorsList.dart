import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ambassador.dart';

class AmbassadorsListView extends StatefulWidget {
  AmbassadorsListView({Key key}) : super(key: key);

  @override
  _AmbassadorsListViewState createState() => _AmbassadorsListViewState();
}

class _AmbassadorsListViewState extends State<AmbassadorsListView> {
  final ambassadors = [
    {
      "name": "Ndembo jafari",
      "desc":
          "Ndembo is TME Education Ambassador in Tanzania. This young electronics enthusiast has been conducting TME Education workshops in his country since 2017. His passion for technology, educational background and skills like constructing and programming electronic circuits enable him to conduct interesting training for various institutions. He likes travelling, comedies, listening to music and his ideas with others.",
      "country": "Tanzania",
      "flag": "",
      "avatar": "assets/images/ambassadors/ndembo_jafari.jpg"
    },
    {
      "name": "Moussa Tamba",
      "desc":
          "His passion for technology started at a very young age as he was always curious to discover new things. Moussa became an electrical technician and obtained a license in software engineering. He was also frequenting the first fab lab in Senegal, which later allowed him to create a space alike on his own. Moussa is also a founder of a startup developing home automation solutions and IoT. His passion is to participate in meetups to share information and novelties about new technologies.",
      "country": "Tanzania",
      "flag": "",
      "avatar": "assets/images/ambassadors/moussa_pin.jpg"
    },
    {
      "name": "Nestor Nshimiyimana",
      "desc":
          "Nestor is an engineer with a bachelor's degree in Electronics and telecommunication, he graduated in 2015 and he has 4 years of experience in teaching mathematics, physics and electronics. During the last year, Nestor started working with a company that provides Coding and Robotics (STEM) and currently he is TME Education Ambassador in Rwanda. Nestor likes electronics and he is very happy when he can transfer and share his knowledge with other people.",
      "country": "Rwanda",
      "flag": "",
      "avatar": "assets/images/ambassadors/Nestor_pin.jpg"
    },
    {
      "name": "Wilferd Mulenga",
      "desc":
          "Wilferd is a Software Developer and Mechatronics Engineer. Having obtained a Bachelor’s Degree in Mechanical and Electronics Engineering in China in 2015, he worked in a Steel Plant in Zambia before switching career paths into Software Development. He is a maker and loves tinkering with Electronics. Wilfred has conducted STEM lessons teaching children about Basic Electronics and Programming at Zambia’s Technology and Innovation hub, BongoHive. His aim is to help bring together the Maker community within his country and help the youth make their ideas come to life. He is also a community leader for a Developer community called Forloop Zambia which aims to help grow and bring together local developers.",
      "country": "Zambia",
      "flag": "",
      "avatar": "assets/images/ambassadors/Wilfred.jpg"
    },
    {
      "name": "Amine Saffar",
      "desc":
          "Amine is a college student that has teaching in his blood. He had his first experience with Arduino at the age of 15 and he has been improving his skill ever since. At the age of 19, he started teaching others, both children and adults, leading them through their first steps in the world of microcontrollers, which gives him joy and fulfilment. Amine is a changemaker deeply engaged in promoting electronics in Africa.",
      "country": "Tunisia",
      "flag": "",
      "avatar": "assets/images/ambassadors/amine_pin.jpg"
    },
    {
      "name": "Eya al Habib",
      "desc":
          "Eya is a Tunisian engineering student, an ambassador of TME Education and a member of Aerobotix INSAT.",
      "country": "Tunisia",
      "flag": "",
      "avatar": "assets/images/ambassadors/eya_pin.jpg"
    },
    {
      "name": "Hani Sisimile Mndzebele",
      "desc":
          "He is a creative one, Hani likes creating stuff from messing, fiddling around with electronics to Android applications and game development. And this list doesn't stop there! He enjoys making music too. Hani gets his inspiration from self-motivational books and Eastern philosophy.He is driven by the ambition to make a difference in his country by encouraging the youth to go for their dreams because anything is possible. The mind that thinks for itself can feed its own but the mind that thinks for others feeds the world!",
      "country": "Eswatini",
      "flag": "",
      "avatar": "assets/images/ambassadors/Hani.jpg"
    },
    {
      "name": "Mohamed Diagana",
      "desc":
          "He developed his passion for technology when he was five years old, after seeing an astronaut floating in space. He still remembers when he said to his father: in the future, I want to be like this man. At the university, Mohamed discovered programming and was passionate about it. Three years later he mastered almost all the common languages C, C++, Java, Python, PHP, HTML, JavaScript etc.… In the fourth year of his formation, he discovered Arduino and robotics. After this experience, Mohamed joined the robotics and aviation club of his school where he and his fellow students built robots and quadcopters. A few months later, he founded Rim Robotics in order to introduce robotics in his country. With his brother, they participated in an won the first place of the Marathon De Entrepreneur in Mauritania by designing and building smart trash. Actually, Mohamed is a Mechatronics engineer, the CEO of smart systems, services and also a teacher at the Institute of Technology of Rosso.",
      "country": "Mauritania",
      "flag": "",
      "avatar": "assets/images/ambassadors/Mohamed_pin.jpg"
    },
    {
      "name": "Frederico Zile",
      "desc":
          "Frederico graduated from Foreign Commerce as one of the best students of his grade. He was working in this area for one year when he realised his true vocation for another matter. He quit his job and followed his dreams of becoming an engineer. He is currently studying Electronics Engineering at Universidade Eduardo Mondlane. Frederico founded an Electronics Club in Maputo and became a member of a commission responsible for organising Engineering Fares in Mozambique. He is passionate about embedded systems and automation. Frederico also teaches mathematics and physics. In his free time, like watching football and TV series.",
      "country": "Mozambique",
      "flag": "",
      "avatar": "assets/images/ambassadors/Frederico.jpg"
    },
    {
      "name": "Nantonisoa Rabearivonona",
      "desc":
          "He has a master degree in telecommunication but the list of his qualifications is much, much longer. Nantan’s skills go far beyond electronics and technology as he is a gifted coach that teaches with passion, adding some business twist to the discipline.",
      "country": "Madagascar",
      "flag": "",
      "avatar": "assets/images/ambassadors/nantan_pin.jpg"
    },
    {
      "name": "Holitiana Rafidison",
      "desc":
          "A student in the department of telecommunication at the Polytechnic school of Antananarivo , she is passionate about technologies, how it can bring evolution into everyone's everyday life. Holitiana really likes making projects which solve the little problems people face every day. In her free time, she enjoys watching movies and exploring the outside world.",
      "country": "Madagascar",
      "flag": "",
      "avatar": "assets/images/ambassadors/Holitiana.jpg"
    },
    {
      "name": "Kolawole Oluwasegun",
      "desc":
          "Kolawole is currently a 4th-year student of Computer Science at the Federal University of Technology in Akure Ondo State, Nigeria. He operates a Melancholic Temperament also, he is also a desktop applications and Website App developer, frontend and backend, in which he as three years of experience. Kolawole is also keen on Arduino development, which he has been exploring for the past year. He teaches at Greenlab micro-factory and Tech Motivator at Developers Student Club FUTA Chapter.",
      "country": "Nigeria",
      "flag": "",
      "avatar": "assets/images/ambassadors/Kola.jpg"
    },
    {
      "name": "Ogunranti Moses",
      "desc":
          "Ogunranti is presently studying Physics Electronics at the Federal University of Technology, Akure. Tutored Arduino development and 3D fabrication with Greenlab Microfactory. He developed Arduino Clinical device that won 1st Position at the Emerge Ondo Technology Hackathon. Won best project exhibitor at the Vale College project exhibition tournament. Currently a member of the Greenlab Microfactory tech development team. Ogunranti also developed the FOHW Machine, an anti-Ebola contraction device. Loves to read during leisure. He is also interested in A.I Fourth industrial revolution technology.",
      "country": "Nigeria",
      "flag": "",
      "avatar": "assets/images/ambassadors/Ogun.jpg"
    },
    {
      "name": "Riclin Sasman",
      "desc":
          "Riclin Sasman, a guy hungry for technology, having more than 15 years experience in research and development. He eats, sleeps and breaths electronics, he has a passion to help educate those, who have limited access to electronics education by granting them an opportunity to learn about technology. Riclin obtained a national certificate in electrical/electronics engineering and mechatronics at the College of Cape Town. He spends his free time with his wife and kid, flying, fishing or looking for new ways to implement technology.",
      "country": "South Africa",
      "flag": "",
      "avatar": "assets/images/ambassadors/Riclin_Pin.jpg"
    },
    {
      "name": "Patrick Ssonko",
      "desc":
          "Patrick is TME Education Ambassador in Uganda. He has vast knowledge and considerable experience in electronics, embedded systems design and embedded software development. In 2014 he served as a teaching assistant in the department of computer engineering at Mbarara University of Science and Technology, an institution where he studied himself before. Patrick is passionate about reverse engineering for resource-constrained applications. He likes watching football matches, especially Barcelona and Arsenal. In his free time he enjoys reading and making new friends.",
      "country": "Uganda",
      "flag": "",
      "avatar": "assets/images/ambassadors/patrick.jpg"
    },
    {
      "name": "Chisangalalo Kanthema",
      "desc":
          "Chisangalalo is TME Education Ambassador in Malawi. Having obtained Malawi School Certificate Of Education at Njamba Secondary School, Sanga started his diploma in Electrical and Telecommunication Engineering at Malawi University, The Polytechnic. He is currently working with students and designers through the academic Design Studio. His proactivity and social awareness inspired him to found Dolphin Innovation, a Tech Startup in Healthcare. Moreover, he shares his motivational spirit by brainstorming with his friends about innovation, science and technology and other engaging topics. In his free time, Sanga likes to play and watch football. What’s more, he also has his artistic site – he is an active musician, songwriter and poet.",
      "country": "Malawi",
      "flag": "",
      "avatar": "assets/images/ambassadors/Sanga_Kanthema.png"
    },
    {
      "name": "Kelvin Kangethe Gitau",
      "desc":
          "Kelvin is TME Education Ambassador in Kenya. From the earliest childhood, Kelvin was always fascinated by electronics, often breaking apart many electronic devices curious to learn how they operated. His love and passion for science and technology inspired him to study electrical and electronics engineering at a university. His experience in building electronics and robotic projects combined with a developed interest in teaching got him actively involved in conducting technical training sessions for youth in his country. His aim is to empower them to be innovators and community changemakers. He spends his free time doing music production, making short films or hiking with his friends.",
      "country": "Kenya",
      "flag": "",
      "avatar": "assets/images/ambassadors/Klevin.jpg"
    },
    {
      "name": "Patrick Effraim",
      "desc":
          "Patrick graduated from pilot training institute with a certificate in electronics and obtained his degree in electrical and electronics engineering, where his final year project was selected as one of the best of the year. He is passionate about electronics engineering and this is the career path he chose for himself. Patrick enjoys teaching electronic circuit interpretation, programming and building electronic systems. He also likes working with student's final year projects. In his free time, he watches movies, makes circuit simulation and does research for new inventions.",
      "country": "Ghana",
      "flag": "",
      "avatar": "assets/images/ambassadors/Patrick_ghana.jpg"
    },
    {
      "name": "Tesfamichael Molla Ali",
      "desc":
          "Tesfa has developed his strong passion for technology at a very early age. As a high-school student, he co-founded a science and technology team. Back then he built a steam-based house cleaning machine and together with his friends participated in a national innovation competition, in which he won a gold. His adventure with programming also started at that time as he learnt how to use HTML and CSS. Some years later, he switched to PIC and C languages and learnt how to program microcontrollers and, finally, Arduino. In 2016 he forged his skills into a project and his Smart Home Automation using Arduino and Android application was selected as one of the top 5 innovative projects during the Education Innovation Competition. Tesfa is currently an Electrical and Computer Engineering graduate student with a major in Computer Engineering and a president of Electrical and Computer Engineering Students Association at Wolkite University.",
      "country": "Ethiopia",
      "flag": "",
      "avatar": "assets/images/ambassadors/Tesfa.jpg"
    },
    {
      "name": "Robe Getachew Birhanemeskel",
      "desc":
          "Robe Getachew is a university student based in Adama, Ethiopia. She used to be a leader of the Science and Technology Club at her school. She took some lessons in robotics at Atlas Technology Institute and was a member of the First Global Team Ethiopia in competition in Mexico City. Robe likes swimming and playing soccer. She also enjoys spending her free time at a technology lab. Her personal hero is Davin Hanson. She strongly believes that girls have the power to change the world of science an technology sector as she herself experienced their creative attitude.",
      "country": "Ethiopia",
      "flag": "",
      "avatar": "assets/images/ambassadors/Robe.jpg"
    },
    {
      "name": "Yannick Rodrigue",
      "desc":
          "He is a programmer and electrotechnician. His aim is to promote innovative projects in order to make everyone’s life better. Yannick is a fan of basketball and enjoys spending time in nature.",
      "country": "Cameroon",
      "flag": "",
      "avatar": "assets/images/ambassadors/yannick_pin.jpg"
    },
    {
      "name": "Loic Dessap",
      "desc":
          "Loic is TME Education Ambassador in Cameroon. he moment he graduated from National Advanced School of Posts, Telecommunications and Information and Communications Technologies and obtained his bachelor’s degree, he had already gained international experience in various competitions and received several awards outside Cameroon. He is passionate about technology, electronics and education. Loic enjoys constructing and programming electronic circuits, building robots and working with IoT projects. In his free time, he listens to music, does sports and plays video games. Loic likes travelling, sharing his knowledge and ideas with others.",
      "country": "Cameroon",
      "flag": "",
      "avatar": "assets/images/ambassadors/loic_pin_2.jpg"
    },
    {
      "name": "Sachin Rana",
      "desc":
          "Sachin, originating from a small farming village in India, decided to get a degree in electrical and electronics engineering. He also has more than three years in project development, currently, he is working for a corporate company as R&D engineer. He also gained some experience with IOT-related applications. Sachin loves playing with electronics. He always tries to help others in their work with technology and is a skilled teacher. In his free time, he plays video games, watches movies, surfs the Internet.",
      "country": "India",
      "flag": "",
      "avatar": "assets/images/ambassadors/sachin.jpg"
    },
    {
      "name": "Hager Okasha",
      "desc":
          "Hager is an embedded software engineer. She obtained a bachelor's degree in communication and electronics engineering in Egypt in 2015. Because of her passion for programming and electronics, she decided to learn embedded software as it is a discipline in between. She has strong knowledge on microcontrollers and kits like AVR, PIC and Arduino, c programming language, embedded c, RTOS. Hager wants to become a software engineer and there is nothing that could stop her from achieving her dream in this field because she believes that nothing is impossible when one wants to fulfil a dream.",
      "country": "Egypt",
      "flag": "",
      "avatar": "assets/images/ambassadors/hager_pin.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.keyboard_return_rounded, color: Colors.teal,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        height: screen.height,
        width: screen.width,
        child: SingleChildScrollView(
          child: Column(
            children: ambassadors.map((element) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => SingleAMbassadorView(ambassador: element,)));
                },
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        child: Hero(
                          tag: element["name"],
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(2000),
                            child: Image.asset(element["avatar"]),
                          ),
                        ),
                      ),
                      title: Text(element["name"]),
                      subtitle: Text(element["country"]),
                    ),
                  ),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Instagram',
                      color: Colors.blue,
                      icon: FontAwesomeIcons.instagram,
                    ),
                    IconSlideAction(
                      caption: 'Facebook',
                      color: Colors.indigo,
                      icon: FontAwesomeIcons.facebook,
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Call',
                      color: Colors.black45,
                      icon: FontAwesomeIcons.phone,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
