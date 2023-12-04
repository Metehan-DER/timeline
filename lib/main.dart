import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimelineScreen(),
    );
  }
}

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timeline'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimelineItem("content1", "date1"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineItem(String content1, String date1) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.center,
          isFirst: true,
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.amber,
          ),
          beforeLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
          startChild: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                constraints: BoxConstraints(
                  minHeight: 120,
                ),
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    Text("BAŞLIK"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.network("https://picsum.photos/536/354",fit: BoxFit.fill,),
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: Image.network("https://picsum.photos/536/354",fit: BoxFit.fill,),
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ) // İlk tarih burada
                    // İlk içerik burada
                  ],
                ),
              ),
              Text("  tarih "),
            ],
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.center,
          beforeLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
          afterLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.amber,
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.center,
          isLast: true,
          beforeLineStyle: const LineStyle(
            color: Colors.purple,
            thickness: 6,
          ),
          indicatorStyle: const IndicatorStyle(
            width: 20,
            color: Colors.amber,
          ),
          endChild: Row(
            children: [
              Text("  data  "),
              Container(
                padding: EdgeInsets.all(16),
                constraints: const BoxConstraints(
                  minHeight: 80,
                ),
                color: Colors.lightGreenAccent,
                child:Column(
                  children: [
                    Text("BAŞLIK"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.network("https://picsum.photos/536/354",fit: BoxFit.fill,),
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: Image.network("https://picsum.photos/536/354",fit: BoxFit.fill,),
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ) // İlk tarih burada
                    // İlk içerik burada
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
