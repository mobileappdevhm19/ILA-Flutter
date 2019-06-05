import 'package:flutter/material.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ila_swagger/api.dart';

class NewsDetailsView extends StatefulWidget {
  CourseNews news;

  NewsDetailsView({this.news});

  @override
  _NewsDetailsViewState createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  Widget build(BuildContext context) {
    final authmodel = ScopedModel.of<AuthModel>(context);
    var account = authmodel.getAccountInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title),
      ),
      body: Padding(
        padding: EdgeInsets.all( 0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(widget.news.body),
            )
          ],
        ),
      )
    );
  }
}
