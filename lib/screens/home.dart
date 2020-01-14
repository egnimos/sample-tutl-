import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import '../screens/subjects_screen.dart';
import '../screens/bookmark.dart';
import '../screens/joined_courses_list_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  

  List<Widget> _widgetOption;

  @override
  void initState() { 
    super.initState();

    _widgetOption = [

      SubjectsScreen(),

      Center(
        child: Text('Add the post'),
      ),

      Bookmark(),

    ];
  }
  var _page = 0;

  void _changeIndex(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                'assets/images/tutlify.png',
                fit: BoxFit.scaleDown,
                width: 50,
                height: 50,
                filterQuality: FilterQuality.high,
                ),
            ),

            Text(
              'Tutlify',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).accentColor
              ),
              textScaleFactor: 1.7,
              )
          ],
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
         
        ),

        actions: <Widget>[

          Icon(Icons.search),

          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: () => Navigator.of(context).pushNamed(
              JoinedCoursesListScreen.routeName,
            ),
          ),
        ],
      
      ),

      drawer: Drawer(),

      body: Container(
        child: _widgetOption[_page],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.purple,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        items: [
           Icon(Icons.home, size: 30,),
       

   
           Icon(Icons.add, size: 30, color: Colors.red,),
        

           Icon(Icons.collections_bookmark, size: 30,),

        ],
        onTap: _changeIndex,
        index: _page,

      ),
    );
  }
}