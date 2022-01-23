import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class myHome extends StatefulWidget {
  myHome({Key? key, this.data, this.get1Data, this.setShowFlag}) : super(key: key);
  final data, get1Data, setShowFlag;


  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  var scroll = ScrollController();
  bool bRenewal = true;
  bool isMenuHide = false;

  @override
  void initState() {
    super.initState();
    print('_myHomeState load');
    scroll.addListener(() {
      // print(scroll.position.userScrollDirection);
      if(scroll.position.userScrollDirection == ScrollDirection.reverse){
        print('아래로 reverse이면 하단바 숨기자');
        if(!isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = true;
        }
      }
      if(scroll.position.userScrollDirection == ScrollDirection.forward){
        print('위로 reverse이면 하단바 보이기');
        if(isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = false;
        }
      }
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        print('끝부근. renewal 필요');
        if(bRenewal) {
          widget.get1Data();
          bRenewal = false;
        }
      }
    });
  }

  @override
  void dispose() {
    scroll.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.data.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.data.length,
          padding: EdgeInsets.all(8),
          controller: scroll,
          itemBuilder: (BuildContext c, int i){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (widget.data[i]['user'] == 'ash')
                  ? Image.file(widget.data[i]['image'])
                  : Image.network(widget.data[i]['image']),
                Text(widget.data[i]['content']),
                Text('작성자:${widget.data[i]['user']}'),
                Text(widget.data[i]['date']),
              ],
            );
          }
      );
    } else {
      return Text('loading');
    }
  }
}