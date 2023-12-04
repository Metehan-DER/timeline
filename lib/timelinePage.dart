import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zaman Çizelgesi'),
      ),
      body: Center(
        child: TimelineTile(
          alignment: TimelineAlign.center,
          startChild: Container(
            color: Colors.amberAccent,
            child: Center(child: Text('Başlangıç')),
          ),
          endChild: Container(
            color: Colors.lightGreenAccent,
            child: Center(child: Text('Bitiş')),
          ),
          isFirst: true, // İlk öğe
          isLast: true, // Son öğe
          indicatorStyle: IndicatorStyle(
            width: 50, // Gösterge genişliği
            color: Colors.red, // Gösterge rengi
          ),
          beforeLineStyle: LineStyle(
            color: Colors.blueGrey, // Öncesindeki çizgi rengi
            thickness: 4, // Öncesindeki çizgi kalınlığı
          ),
          afterLineStyle: LineStyle(
            color: Colors.blueGrey, // Sonrasındaki çizgi rengi
            thickness: 4, // Sonrasındaki çizgi kalınlığı
          ),
        ),
      ),
    );
  }
}