import 'package:portfolio/src/utils/constants/enums.dart';

class Project {
  final ProjectType projectType;
  final String projectName;
  final List<String> projectImages;
  final String projectDescription;
  final String? projectUrl;
  final String projectIconImage;

  Project(
      {required this.projectType,
      required this.projectName,
      required this.projectImages,
      required this.projectDescription,
      required this.projectIconImage,
      this.projectUrl});
}
