import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'store/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ApiStore>(
      create: (context) => ApiStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroductionaryScreen(),
      ),
    );
  }
}

class IntroductionaryScreen extends StatelessWidget {
  const IntroductionaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("NEXT"),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => MyHomePage())),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = ScrollController();
  ApiStore _apiStore = ApiStore();

  @override
  void initState() {
    initData();
    setScrollController();
  }

  initData() async {
    // _apiStore = await Provider.of<ApiStore>(context);
    _apiStore.fetchData();
  }

  setScrollController() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          _apiStore.fetchMoreData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx"),
      ),
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              return _apiStore.isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : ListView.builder(
                      controller: _controller,
                      itemCount: (_apiStore.list.length + 1),
                      itemBuilder: (_, index) {
                        print(
                            "_apiStore.loadingMoreData : ${_apiStore.loadingMoreData}");
                        return (_apiStore.list.length == index)
                            ? _apiStore.loadingMoreData
                                ? Container(
                                    height: 100.0,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : SizedBox()
                            : Card(
                                child: ListTile(
                                  title: Text(_apiStore.list[index].title),
                                  subtitle:
                                      Text(_apiStore.list[index].id.toString()),
                                ),
                              );
                      });
            },
          ),
        ],
      ),
    );
  }
}
