import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimelineScreen(),
    );
  }
}

class TimelineScreen extends StatelessWidget {
  final List<Map<String, dynamic>> timelineData = [
    {
      'title': 'A DERGİSİ',
      'date': '16.10.2021',
      'image1': 'https://images.pexels.com/photos/6226956/pexels-photo-6226956.jpeg?auto=compress&cs=tinysrgb&w=600',
      'image2': 'https://images.pexels.com/photos/18512832/pexels-photo-18512832/free-photo-of-the-word-talk-is-spelled-out-with-scrabble-tiles.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'C DERGİSİ',
      'date': '10.01.2020',
      'image1': 'https://images.pexels.com/photos/207983/pexels-photo-207983.jpeg?auto=compress&cs=tinysrgb&w=600',
      'image2': 'https://images.pexels.com/photos/7524996/pexels-photo-7524996.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'title': 'B DERGİSİ',
      'date': '05.02.2023',
      'image1': 'https://images.pexels.com/photos/3769167/pexels-photo-3769167.jpeg?auto=compress&cs=tinysrgb&w=600',
      'image2': 'https://picsum.photos/536/354',
    },
    {
      'title': 'D DERGİSİ',
      'date': '05.02.2022',
      'image1': 'https://images.pexels.com/photos/4041272/pexels-photo-4041272.jpeg?auto=compress&cs=tinysrgb&w=600',
      'image2': 'https://images.pexels.com/photos/160846/french-bulldog-summer-smile-joy-160846.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Tarihe göre sıralama yap
    timelineData.sort((a, b) => DateFormat('dd.MM.yyyy')
        .parse(b['date'])
        .compareTo(DateFormat('dd.MM.yyyy').parse(a['date'])));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: timelineData.length,
          itemBuilder: (context, index) {
            final isRightAligned =
                index % 2 != 0; // Her ikinci eleman sağda olacak

            return buildTimelineItem(
              timelineData[index]['title'],
              timelineData[index]['date'],
              timelineData[index]['image1'],
              timelineData[index]['image2'],
              isRightAligned,
              isFirst: index == 0,
              isLast: index == timelineData.length - 1,
              context: context,
              index: index, // Tıklanan resmin indeksi
            );
          },
        ),
      ),
    );
  }

  Widget buildTimelineItem(
    String title,
    String date,
    String image1,
    String image2,
    bool isRightAligned, {
    bool isFirst = false,
    bool isLast = false,
    required BuildContext context,
    required int index, // Tıklanan resmin indeksi
  }) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      lineXY: isRightAligned ? 0.1 : 0.9,
      indicatorStyle: const IndicatorStyle(
        width: 20,
        color: Colors.greenAccent,
        // buraya icon da eklenebilir haberiniz olsun...
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.pinkAccent,
        thickness: 6,
      ),
      startChild: isRightAligned
          ? null
          : buildContent(
              title, image1, image2, date, isRightAligned, context, index),
      endChild: isRightAligned
          ? buildContent(
              title, image1, image2, date, isRightAligned, context, index)
          : null,
      isFirst: isFirst,
      isLast: isLast,
    );
  }

  Widget buildContent(
    String title,
    String image1,
    String image2,
    String date,
    bool isRightAligned,
    BuildContext context,
    int index,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isRightAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        SizedBox(width: 16,),
        if (isRightAligned)
          Text(
            date,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(width: 16,),
        Container(
          padding: EdgeInsets.all(16),
          constraints: BoxConstraints(
            minHeight: 120,
          ),
          decoration: BoxDecoration(
            borderRadius: (BorderRadius.circular(16)),
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Text(title,style: TextStyle(color: Colors.white),),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showImageDialog([image1, image2], 0, context);
                    },
                    child: Container(
                      child: Image.network(image1, fit: BoxFit.fill),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _showImageDialog([image1, image2], 1, context);
                    },
                    child: Container(
                      child: Image.network(image2, fit: BoxFit.fill),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 16,),
        if (!isRightAligned)
          Text(
            date,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(width: 16,),
      ],
    );
  }

  void _showImageDialog(
      List<String> imageUrls, int initialIndex, BuildContext context) {
    int currentIndex = initialIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.network(
                      imageUrls[currentIndex],
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.navigate_before),
                        onPressed: () {
                          if (currentIndex > 0) {
                            setState(() {
                              currentIndex--;
                            });
                          }
                        },
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          if (currentIndex < imageUrls.length - 1) {
                            setState(() {
                              currentIndex++;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
