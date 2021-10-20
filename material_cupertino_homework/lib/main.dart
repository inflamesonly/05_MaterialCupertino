import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    PersistentBottomSheetController _botoomSheetController;

    void openBottomSheet () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.white,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: [
                      ListTile(
                      title: Text("Сумма"),
                      leading: Icon(Icons.card_giftcard),
                      trailing: Text("200 руб"),
                ),
                      ElevatedButton(
                          onPressed: () { },
                          child: Text('Выход'), 
                          style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], 
                          onPrimary: Colors.black,
                    ),
                  ),
                    ],)
                  ],
                ),
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                ),
                SizedBox(height: 10),
              Text('Username'),
            ],
          ),
        ),
      ),
      drawer: Drawer(
            elevation: 1.5,
            child: Column(children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                ),
              ), 
              Expanded(
                  child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward_ios),
                ),            
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.portrait),
                trailing: Icon(Icons.arrow_forward_ios),
                ),           
              ListTile(
                title: Text("Images"),
                leading: Icon(Icons.image),
                trailing: Icon(Icons.arrow_forward_ios),
                ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[ 
                  ElevatedButton(
                  onPressed: () { },
                  child: Text('Выход'), 
                  style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], 
                          onPrimary: Colors.black,
                    ),
                  ),
                ElevatedButton(
                  onPressed: () { },
                  child: Text('Регистрация'), 
                  style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300], 
                          onPrimary: Colors.black,
                    ),
                  ),
                ]),
              ),
            ])),
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
          actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.portrait_sharp),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
          ],
      ),
      body: Scaffold( 
        floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet, 
        child: Icon(Icons.add),
        ),
      bottomNavigationBar : BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Photo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: "Albums",
          )
        ],
      ),
      ),
    );
  }
}
