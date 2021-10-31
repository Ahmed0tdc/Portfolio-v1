import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/enums.dart';

class Project {
  final ProjectType projectType;
  final String projectName;
  final List<String> projectImages;
  final String projectDescription;
  final String? projecGitHubUrl;
  final String? projecPlayUrl;
  final String projectIconImage;
  final List<Color>? brandColors;

  Project({
    required this.projectType,
    required this.projectName,
    required this.projectImages,
    required this.projectDescription,
    required this.projectIconImage,
    this.brandColors,
    this.projecGitHubUrl,
    this.projecPlayUrl
  });
}
