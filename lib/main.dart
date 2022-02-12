import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: NavigatorPage(),
    );
  }
}

class NavigatorPage extends StatefulWidget {
  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        displayMode: PaneDisplayMode.open,
        selected: index,
        onChanged: (int currentIndex) {
          setState(() {
            index = currentIndex;
          });
        },
        items: [
          PaneItem(
            icon: Icon(
              FluentIcons.home,
            ),
            title: Text("Pagina 1"),
          ),
          PaneItem(
            icon: Icon(
              FluentIcons.accounts,
            ),
            title: Text("Pagina 2"),
          ),
          PaneItem(
            icon: Icon(
              FluentIcons.accounts,
            ),
            title: Text("Pagina 3"),
          ),
        ],
      ),
      content: NavigationBody(
        index: index,
        children: [
          FirstPage(),
          SecondPage(),
          FirstPage(),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Flexible(flex: 6, child: ImageRounded()),
                      Spacer(),
                      Flexible(flex: 3, child: ImageRounded()),
                      Spacer(),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Flexible(child: ImageRounded()),
                            Spacer(),
                            Flexible(child: ImageRounded()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class ImageRounded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        "https://picsum.photos/id/237/200/300",
        fit: BoxFit.cover,
      ),
    );
  }
}
