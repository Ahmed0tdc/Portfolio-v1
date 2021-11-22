// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    picture: kMeWithGlasses,
    biography: "A Passionate Flutter apps developer and a Pythonista with 2+ years of experience in the field of software development building and creating apps, Good at Coding and Quick at learning.\nMy goal is to provide digital solutions for your given problem and take part in growing your business by taking care of the digital aspect of it.");

final List<Map<String, dynamic>> skillData = [
  {
    'type': 'Programming languages',
    'skills': [
      Skill(name: "Python", icon: 'assets/icons/python.png', masteryLevel: 85),
      Skill(name: "Dart", icon: 'assets/icons/dart.png', masteryLevel: 80)
    ]
  },
  {
    'type': 'Frameworks',
    'skills': [
      Skill(name: "Flutter", icon: 'assets/icons/flutter.png', masteryLevel: 75)
    ]
  },
  {
    'type': 'Other technologies',
    'skills': [
      Skill(name: "Firebase", icon: 'assets/icons/firebase.png', masteryLevel: 60),
      Skill(name: "Html", icon: 'assets/icons/html.png', masteryLevel: 74),
      Skill(name: "CSS", icon: 'assets/icons/css.png', masteryLevel: 50)
    ]
  },
];

final List<Project> myProjects = [
  Project(
      projectType: ProjectType.mobileApp,
      projectName: 'Spark',
      projectIconImage: 'spark/logo.png',
      projecGitHubUrl: 'https://github.com/Ahmed0tdc/Spark-App',
      brandColors: [const Color(0xFFFFFFFF), const Color(0xFF8300FF)],
      projectImages: [
        'spark/spark_01.png',
        'spark/spark_02.png',
        'spark/spark_03.png',
        'spark/spark_04.png',
        'spark/spark_05.png'
      ],
      projectDescription: "Spark is a car parts trading app made by the cross-platform framework Flutter, the idea is that you as a user who owns some car parts (brand new or reused), want to sell these parts for a reasonable price.\nSpark helps you do just that by offering a market for this problem where people can contact you and make a deal with you to buy the car part(s) you want to sell off.",
      ),
  Project(
      projectType: ProjectType.mobileApp,
      projectName: 'GooLoads',
      projectIconImage: 'gooloads/logo.png',
      brandColors: [const Color(0xFF3F3F3F), const Color(0xFFFFFFFF)],
      projectImages: [
        '/gooloads/gooloads_01.png',
        '/gooloads/gooloads_02.png',
        '/gooloads/gooloads_03.png',
        '/gooloads/gooloads_04.png',
        '/gooloads/gooloads_05.png',
        '/gooloads/gooloads_06.png',
        '/gooloads/gooloads_07.png',
        '/gooloads/gooloads_08.png',
      ],
      projectDescription: "GooLoads is a personal project of an E-Commerce mobile app that gives access to a vast shop of different products from canned food to electronic devices, it implements the usage of Rest APIs and networking to retrieve the products of desire and interacts with a cloud storage (Firebase) for data saving.",
  ),
  // Project(
  //     projectType: ProjectType.mobileApp,
  //     projectIconImage: 'togymdo/logo.png',
  //     brandColors: [const Color(0xFF403B3B), const Color(0xFF373333)],
  //     projectName: 'TOGYMDO',
  //     projectImages: [
  //       '/spark/spark_01.png',
  //       '/spark/spark_02.png',
  //       '/spark/spark_03.png',
  //       '/spark/spark_04.png',
  //       '/spark/spark_05.png'
  //     ],
  //     projectDescription: "more info is coming soon...",
  //   ),
];

final List<Service> myServices = <Service>[
  Service(
      name: 'Mobile Development',
      description: 'Well honed experience of cross-platform mobile development with Flutter.',
      illustration: 'mobile.png'),
  Service(
      name: 'Web Development',
      description: 'Responsive website development for your Flutter project idea.',
      illustration: 'web.png'),
  Service(
      name: 'UI Design',
      description: 'Professional designs of user interfaces for your mobile or web application.',
      illustration: 'design.png'),
];

final List<Map> socialMediaData = [
  {
    'icon':  FontAwesomeIcons.github, //'assets/icons/github.png',
    'link': kGithubLink,
  },
  {
    'icon': FontAwesomeIcons.linkedin, //'assets/icons/linkedin.png',
    'link': kLinkedenLink,
  },
  {
    'icon': FontAwesomeIcons.twitter, //'assets/icons/twitter.png',
    'link': kTwitterLink,
  },
  {
    'icon': FontAwesomeIcons.instagram,  //'assets/icons/instagram.png',
    'link': kInstaLink,
  }
];
