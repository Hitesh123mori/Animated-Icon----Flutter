

import 'package:flutter/material.dart';

class animatedicon extends StatefulWidget {
  const animatedicon({Key? key}) : super(key: key);

  @override
  State<animatedicon> createState() => _animatediconState();
}

class _animatediconState extends State<animatedicon> with TickerProviderStateMixin {
  bool isactive = false ;
  late AnimationController _controller ;
  @override
  void initState() {
    _controller  = AnimationController(

      duration: Duration(milliseconds: 300)
        ,vsync: this) ;
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text("Animated Icon"),
        ),

        body: GestureDetector(
          onTap: (){
            if(isactive == false)
              {
                 _controller.forward() ;
                 print("Play") ;
                 isactive = true ;
                 
              } 
            else
              {
                _controller.reverse() ;
                print("Pause") ;
                isactive = false ;
              }
          },
          child: Center(
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, progress: _controller,
              size: 56,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
