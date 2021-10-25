import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/utils/theme.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/parts/about_me/about_me.dart';
import 'package:portfolio/src/view/parts/my_skills/my_skills.dart';
import 'package:portfolio/src/view/parts/my_work/my_work.dart';
import 'package:portfolio/src/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
    

  @override
  Widget build(BuildContext context) {
  final Persona _myPersona = Persona(
        fullname: 'ahmed el otmani',
        age: 18,
        hobies: ["Reading", "Playing chess", "Jogging"],
        yearsOfExperience: 2,
        civilStatus: 'Single',
        adress: "Tangier, Morocco",
        country: "Morocco",
        picture: kMeUnderSky,
        biography: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig(designHeight: kIsWeb ? 1080 : 640, designWidth: kIsWeb ? 1913 : 360).init(constraints, orientation);
            return ChangeNotifierProvider(
                create: (context) => ProviderClass(),
                child: MaterialApp(
                  // showPerformanceOverlay: true,
                  debugShowCheckedModeBanner: false,
                  title: kProjectTitle,
                  theme: AppTheme().getAppTheme(),
                  initialRoute: '/home',
                  routes: {
                  //   '/about' : (context) =>  AboutMeSection(myPersona: _myPersona),
                    '/home' : (context) => const HomeSection(),
                  //   '/skills' : (context) => const SkillsSection(),
                  //   '/work' : (context) => const WorksSection(),
                  },
                ));
          },
        );
      },
    );
  }
}

