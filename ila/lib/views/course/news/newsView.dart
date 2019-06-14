import 'package:flutter/material.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ila_swagger/api.dart';

class NewsView extends StatefulWidget {
  List<CourseNews> news;

  NewsView(this.news);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.news.length,
            itemBuilder: (context, index) {
              CourseNews newsItem = widget.news[index];
              var subtitle = newsItem.body.substring(
                  0,
                  newsItem.body.length > 30
                      ? 30
                      : newsItem.body.length) +
                  "...";

              return ListTile(
                title: Text(newsItem.title),
                subtitle: Text(subtitle),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).pushNamed(
                  '/newsDetails',
                  arguments: newsItem,
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0),
                child: Divider(
                  height: 1,
                )))
    );
  }
}
