import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';



class TopicContentWidget extends StatelessWidget {

  final String id;
  final String title;
  final String content;

  //construct
  TopicContentWidget({
    @required this.id,
    @required this.title,
    @required this.content,
    Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _onTapLink(href) async{
      if (await canLaunch(href)) {
        launch(href);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Wrong address: $href'
            ),
          ),
        );
      }
    }



    return  Scrollbar(
                  child: Markdown(
                  data: content,
                  onTapLink: _onTapLink,
                ),

    );
        

  }
}