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
  final List<Map<String, String>> timelineData = [
    {
      'title': 'Başlık 1',
      'date': 'Tarih 1',
      'image1': 'https://picsum.photos/536/354',
      'image2': 'https://picsum.photos/536/354',
      'isRightAligned': 'true', // İlk öğe sağda
    },
    {
      'title': 'Başlık 2',
      'date': 'Tarih 2',
      'image1': 'https://picsum.photos/536/354',
      'image2': 'https://picsum.photos/536/354',
      'isRightAligned': 'false',   // ikinci solda
    },
    // Diğer zaman çizelgesi verileri eklemek isterseniz
    {
      'title': 'Başlık n',
      'date': 'Tarih n',
      'image1': 'https://picsum.photos/536/354',
      'image2': 'https://picsum.photos/536/354',
      'isRightAligned': 'true', // Son öğe solda
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Timeline'),
      ),
      body: ListView.builder(
        itemCount: timelineData.length,
        itemBuilder: (context, index) {
          final isRightAligned =
              timelineData[index]['isRightAligned'] == 'true';

          return buildTimelineItem(
            timelineData[index]['title']!,
            timelineData[index]['date']!,
            timelineData[index]['image1']!,
            timelineData[index]['image2']!,
            isRightAligned,
            isFirst: index == 0,
            isLast: index == timelineData.length - 1,
          );
        },
      ),
    );
  }

  Widget buildTimelineItem(
      String title,
      String date,
      String image1,
      String image2,
      bool isRightAligned,
      {bool isFirst = false, bool isLast = false}
      ) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      lineXY: isRightAligned ? 0.1 : 0.9,
      indicatorStyle: const IndicatorStyle(
        width: 20,
        color: Colors.amber,
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.purple,
        thickness: 6,
      ),
      startChild: isRightAligned ? null : buildContent(title, image1, image2),
      endChild: isRightAligned ? buildContent(title, image1, image2) : null,
      isFirst: isFirst,
      isLast: isLast,
    );
  }

  Widget buildContent(String title, String image1, String image2) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints(
        minHeight: 120,
      ),
      color: Colors.amberAccent,
      child: Column(
        children: [
          Text(title),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Image.network(image1, fit: BoxFit.fill),
                height: 200,
                width: 200,
              ),
              SizedBox(width: 20),
              Container(
                child: Image.network(image2, fit: BoxFit.fill),
                height: 200,
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
