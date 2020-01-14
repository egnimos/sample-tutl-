import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import './providers/joined_courses.dart';
import './screens/joined_courses_list_screen.dart';
import './screens/subject_info_screen.dart';
import './screens/home.dart';
import './providers/subject_topics_units_provider.dart';
import './screens/subject_topic_content_screen.dart';
import './providers/subject_topics_provider.dart';
import './providers/subject_provider.dart';
import './screens/subject_topics_screen.dart';

void main() => runApp(MyApp());
   


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiProvider(
      providers: [

         ChangeNotifierProvider.value(
           value: SubjectProvider(),
         ),

         ChangeNotifierProvider.value(
           value: SubjectTopicsProvider(),
         ),

         ChangeNotifierProvider.value(
           value: SubjectTopicsUnitsProvider(),
         ),

         ChangeNotifierProvider.value(
           value: Courses(),
         )

      ],

          child: MaterialApp(
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child,
            );
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: white,
            accentColor: Colors.teal,
            fontFamily: 'lato'
            // textTheme: 
          ),
          home: HomeScreen(),
          routes: {
            SubjectInfoScreen.routeName: (ctx) => SubjectInfoScreen(),
            SubjectTopicsScreen.routeName : (ctx) => SubjectTopicsScreen(),
            SubjectTopicContentScreen.routeName: (ctx) => SubjectTopicContentScreen(),
            JoinedCoursesListScreen.routeName: (ctx) => JoinedCoursesListScreen(),
          },
      ),
    );
  }
}

//Disable scrollable Behaviour.....

class MyBehavior extends ScrollBehavior {

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
  
}

//Developing the Wghite color for default....

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

