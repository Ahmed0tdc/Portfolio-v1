import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/utils/theme.dart';
import 'package:portfolio/src/view/parts/project_info/project_info_screen.dart';
import 'package:portfolio/src/view/portfolio_wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig(
                    designHeight: kIsWeb ? 1080 : 640,
                    designWidth: kIsWeb ? 1913 : 360)
                .init(constraints, orientation);
            return ChangeNotifierProvider<ProviderClass>(
              create: (context) => ProviderClass(),
              child: MaterialApp(
                // showPerformanceOverlay: true,
                debugShowCheckedModeBanner: false,
                title: kProjectTitle,
                theme: AppTheme().getAppTheme(),
                initialRoute: '/portfolio',
                routes: {
                  '/portfolio': (context) => const PortfolioWrapper(),
                  '/more_info': (context) => const ProjectInfo(),
                },
              ),
            );
          },
        );
      },
    );
  }
}
