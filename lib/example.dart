import 'package:flutter/material.dart';

class ExampleStatelessWidget extends StatelessWidget {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
              visible: _isVisible,
              child: Text('Flutter is awesome !', style: TextStyle(fontSize: 20),)),
          Divider(color: Colors.transparent,),

          Switch(value: _isVisible, onChanged: (value){
            _isVisible = value;
          }),

          Divider(color: Colors.transparent,),
          Visibility(
              visible: _isVisible,
              child: Text('It\'s all widgets !', style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}



class ExampleStatefulWidget extends StatefulWidget {
  @override
  _ExampleStatefulWidgetState createState() => _ExampleStatefulWidgetState();
}
class _ExampleStatefulWidgetState extends State<ExampleStatefulWidget> {
  bool _isVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: _isVisible,
              child: Text('Flutter is awesome !', style: TextStyle(fontSize: 20),)),
          Divider(color: Colors.transparent,),

          Switch(value: _isVisible, onChanged: (value){
            setState(() => _isVisible = value);
          }),

          Divider(color: Colors.transparent,),
          Visibility(
            visible: _isVisible,
              child: Text('It\'s all widgets !', style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(ExampleStatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
