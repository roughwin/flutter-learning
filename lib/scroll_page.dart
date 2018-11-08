import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ScrollPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollPage();
  }
}

class _ScrollPage extends State<ScrollPages> {
  Widget itemBuilder(context, index) {
    List a = [P1(), P2(), P1()];
    return a[index];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('scroll pages')),
        body: Swiper(
          loop: false,
          itemBuilder: this.itemBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(),
          viewportFraction: 0.8,
          // scale: 0.9,
          // control: new SwiperControl(),
        ));
  }
}

class P1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        decoration:
            new BoxDecoration(border: new Border.all(color: Colors.blueAccent)),
        child: Column(
          children: <Widget>[
            Container(
                height: 300.0,
                // width: 800.0,
                child: Center(
                  child: Icon(Icons.ac_unit),
                )),
            Container(
                height: 300.0,
                child: Center(
                  child: Icon(Icons.ac_unit),
                )),
            Container(
                height: 300.0,
                child: Center(
                  child: Icon(Icons.ac_unit),
                ))
          ],
        ),
      ),
    );
  }
}

class P2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        decoration:
            new BoxDecoration(border: new Border.all(color: Colors.blueAccent)),
        child: Column(
          children: <Widget>[
            Container(
                height: 300.0,
                child: Center(
                  child: Icon(Icons.access_alarms),
                )),
            Container(
                height: 300.0,
                child: Center(
                  child: Icon(Icons.access_alarms),
                )),
            Container(
                height: 300.0,
                child: Center(
                  child: Icon(Icons.access_alarms),
                ))
          ],
        ),
      ),
    );
  }
}
