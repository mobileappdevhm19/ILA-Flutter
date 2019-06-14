import 'package:flutter/material.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final authmodel = ScopedModel.of<AuthModel>(context);
    var account = authmodel.getAccountInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 50.0,
              ),
              title: Text(account['username']),
              trailing: IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () async {
                    await authmodel.logout();

                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacementNamed('/login');
                  }),
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                size: 50.0,
              ),
              title: Text('Data Policy'),
              onTap: () =>
                  Navigator.of(context).pushNamed('/settings/dataPolicy'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
