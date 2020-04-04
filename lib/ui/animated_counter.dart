import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  int count = 0;

  bool _reverse = false;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInToLinear);
    _animation.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.remove), onPressed: () {
            _reverse = false;
            setState(() {
              _animationController.forward().then((value) => _animationController.reset()).then((value) => count--);
            });
          }),
          Stack(
            children: <Widget>[
              Text(count.toString(), style: TextStyle(fontSize: 25.0, color: Colors.transparent)),
              Positioned(top: (_reverse?0.0+25.0:0.0-25.0)*_animation.value, child: Text(count.toString(), style: TextStyle(fontSize: 25.0))),
            ],
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {
            _reverse = true;
            setState(() {
              _animationController.forward().then((value) => _animationController.reset()).then((value) => count++);
            });
          })
        ],
      ),
    );
  }
}
