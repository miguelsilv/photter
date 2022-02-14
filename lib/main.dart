import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
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
    return ScaffoldPage.scrollable(
      children: [
        GaleryRow(const [
          "https://picsum.photos/id/236/200/300",
          "https://picsum.photos/id/237/200/300",
          "https://picsum.photos/id/238/200/300",
          "https://picsum.photos/id/239/200/300",
        ]),
        GaleryRow(const [
          "https://picsum.photos/id/29/200/300",
          "https://picsum.photos/id/241/200/300",
        ]),
        GaleryRow(const [
          "https://picsum.photos/id/1/200/300",
          "https://picsum.photos/id/2/200/300",
          "https://picsum.photos/id/3/200/300",
          "https://picsum.photos/id/4/200/300",
          "https://picsum.photos/id/5/200/300",
        ]),
        GaleryRow(const [
          "https://picsum.photos/id/1/200/300",
          "https://picsum.photos/id/2/200/300",
          "https://picsum.photos/id/3/200/300",
        ]),
        GaleryRow(const [
          "https://picsum.photos/id/77/200/300",
        ]),
      ],
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
  final String url;

  ImageRounded(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class GaleryRow extends StatelessWidget {
  final List<String> urls;

  GaleryRow(this.urls);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(
        bottom: 50,
      ),
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
                if (urls.length != 3) ...[
                  if (urls.length == 1) Spacer(flex: 7),
                  Expanded(
                    flex: 9,
                    child: ImageRounded(
                      urls[0],
                    ),
                  ),
                ],
                if (urls.length == 2 || urls.length == 4) ...[
                  Spacer(),
                  Expanded(
                    flex: 6,
                    child: ImageRounded(
                      urls[1],
                    ),
                  ),
                ],
                if (urls.length == 3)
                  for (var i = 0; i < 3; i++) ...[
                    if (i != 0) Spacer(),
                    Expanded(
                      flex: 6,
                      child: ImageRounded(
                        urls[i],
                      ),
                    ),
                  ],
                if (urls.length == 4) ..._buildImageRange(2, 4),
                if (urls.length > 4) ..._buildImageRange(1, 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildImageRange(int start, int end) {
    List<String> images = urls.getRange(start, end).toList();
    List<Widget> response = [];

    for (var i = 0; i < images.length; i += 2) {
      response.addAll([
        Spacer(),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: ImageRounded(
                  images[i],
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: ImageRounded(
                  images[i + 1],
                ),
              ),
            ],
          ),
        ),
      ]);
    }

    return response;
  }
}
