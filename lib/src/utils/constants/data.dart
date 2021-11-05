// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/enums.dart';

final Persona myPersona = Persona(
    age: 18,
    fullname: 'ahmed el otmani',
    hobies: ["Reading", "Playing chess", "Jogging"],
    yearsOfExperience: 2,
    civilStatus: 'Single',
    address: "Tangier, Morocco",
    country: "Morocco",
    picture: kMeUnderSky,
    biography:
        "A Passionate Flutter apps developer and a Pythonista with 2+ years of experience in the field building and creating apps, Good at Coding; Quick at learning.\nadd more more more more more more more more stuff");

final List<Map<String, dynamic>> skillData = [
  {
    'type': 'Programming languages',
    'skills': [
      Skill(name: "Python", icon: 'assets/icons/python.png', masteryLevel: 79),
      Skill(name: "Dart", icon: 'assets/icons/dart.png', masteryLevel: 88)
    ]
  },
  {
    'type': 'Frameworks',
    'skills': [
      Skill(name: "Flutter", icon: 'assets/icons/flutter.png', masteryLevel: 65)
    ]
  },
  {
    'type': 'Other technologies',
    'skills': [
      Skill(
          name: "Firebase", icon: 'assets/icons/firebase.png', masteryLevel: 55)
    ]
  },
];

final List<Project> myProjects = [
  Project(
      projectType: ProjectType.mobileApp,
      projectName: 'Anas Cars',
      projecGitHubUrl: kAppOne,
      brandColors: [Colors.purple, Colors.white],
      projectImages: [
        'spark/spark_01.png',
        'spark/spark_02.png',
        'spark/spark_03.png',
        'spark/spark_04.png',
        'spark/spark_05.png'
      ],
      projectDescription:
          '''UberStrike is a cross-platform FPS that captured over 30 million users organically. With classic ‘Arena’ style gameplay and highly customisable characters and weapons, UberStrike championed accessibility in an age of bulky downloads and demanding hardware.''',
      projectIconImage: 'spark/logo.png'),
  Project(
      projectType: ProjectType.mobileApp,
      projectName: 'GooLoads',
      projecGitHubUrl: kAppOne,
      brandColors: [Colors.black, Colors.white],
      projectImages: [
        '/spark/spark_01.png',
        '/spark/spark_02.png',
        '/spark/spark_03.png',
        '/spark/spark_04.png',
        '/spark/spark_05.png'
      ],
      projectDescription:
          '''UberStrike is a cross-platform FPS that captured over 30 million users organically. With classic ‘Arena’ style gameplay and highly customisable characters and weapons, UberStrike championed accessibility in an age of bulky downloads and demanding hardware.''',
      projectIconImage: 'spark/logo.png'),
  Project(
      projectType: ProjectType.mobileApp,
      brandColors: [Colors.white, Colors.brown],
      projectName: 'TOGYMDO',
      projectImages: [
        '/spark/spark_01.png',
        '/spark/spark_02.png',
        '/spark/spark_03.png',
        '/spark/spark_04.png',
        '/spark/spark_05.png'
      ],
      projectDescription:
          '''UberStrike is a cross-platform FPS that captured over 30 million users organically. With classic ‘Arena’ style gameplay and highly customisable characters and weapons, UberStrike championed accessibility in an age of bulky downloads and demanding hardware.''',
      projectIconImage: 'spark/logo.png'),
];

final List<Service> myServices = <Service>[
  Service(
      name: 'Mobile Development',
      description:
          'Well honed experience of cross-platform mobile development.',
      illustration: 'mobile.png'),
  Service(
      name: 'Web Development',
      description: 'Responsive and interactive websites for your idea.',
      illustration: 'web.png'),
  Service(
      name: 'UI Design',
      description:
          'Professional designs of user interfaces for your mobile or web application.',
      illustration: 'design.png'),
];

final List<Map> socialMediaData = [
  {
    'icon': 'assets/icons/github.png',
    'link': kGithubLink,
  },
  {
    'icon': 'assets/icons/linkedin.png',
    'link': kLinkedenLink,
  },
  {
    'icon': 'assets/icons/twitter.png',
    'link': kTwitterLink,
  },
  {
    'icon': 'assets/icons/instagram.png',
    'link': kInstaLink,
  }
];
