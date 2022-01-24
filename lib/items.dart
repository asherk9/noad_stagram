import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import './profile.dart' as prof;



class Items extends StatefulWidget {
  Items({Key? key, this.data, this.get1Data, this.setShowFlag}) : super(key: key);
  final data, get1Data, setShowFlag;


  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  var scroll = ScrollController();
  bool bRenewal = true;
  bool isMenuHide = false;

  @override
  void initState() {
    super.initState();

    scroll.addListener(() {
      // print(scroll.position.userScrollDirection);
      if(scroll.position.userScrollDirection == ScrollDirection.reverse){
        if(!isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = true;
        }
      }
      if(scroll.position.userScrollDirection == ScrollDirection.forward){
        if(isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = false;
        }
      }
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
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
                (widget.data[i]['image'].runtimeType == String)
                  ? Image.network(widget.data[i]['image'])
                  : Image.file(widget.data[i]['image']),
                Text(widget.data[i]['content']),

                GestureDetector(
                  child: Text('작성자:${widget.data[i]['user']}'),
                  onTap: (){
                    Navigator.push(context, 
                      CupertinoPageRoute(builder: (c) => prof.Profile(userName: widget.data[i]['user']))
                        // cuper는 옆으로
                    );
                  },
                  
                ),
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
