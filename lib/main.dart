import 'package:flutter/material.dart';
//main(){runApp(MyApp)}・メイン関数
void main() => runApp(MyApp());
//StatelessWidgetを継承したクラス
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override//WidgetのbuildメゾットでMaterialApp返している
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ホームページデモ'),
    );
  }
}
//Stateful(状態を持っていて動的)なWidget(UIコンポーネント)
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//MyHomePageクラスがcreateStateで返すクラス
//StatefulWidgetはそれ自体はほとんどスカスカで、実体はcreateStateで返すStateにほぼ集約されていて
//Stateは次の機能を持ちます。
//①状態を保持・更新する
//②StatelessWidgetと同様にbuildメソッドでWidgetツリーを返す
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1234;

  void _incrementCounter() {
    //次の画面更新タイミングで今のStateの状態を元にUI更新して」という命令
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'アイウエオ:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      //タップされた時の挙動と
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
