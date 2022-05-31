import 'package:flutter/material.dart';
import 'package:draggable/main.dart';

class home_main extends StatefulWidget {
  const home_main({ Key? key }) : super(key: key);

  @override
  State<home_main> createState() => _home_mainState();
}

class _home_mainState extends State<home_main> {
  String title = 'Draggable / DataTarget';
  int _counter =0;
  List<Color> _colors =[
    Color(0xFFC41A3B),
    Color(0xFF181F32),
    Color(0xFFBE0E0),
  ];
  Color _currentColor =Color(0xFF181F32);
  Color _newColor = Color(0xFF181F32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),
      centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Draggable<String>(
                data: _newColor.toString(),
                child: Container(height: 150,width: 150,color: _newColor,),
                feedback: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _newColor,
                    boxShadow: [
                      BoxShadow(
                    blurRadius: 16.0,
                    offset: Offset(0.0,4.0),
                    color: Colors.black.withOpacity(0.28)
                  ),
                    ]
                  ),
                  
                ),
                childWhenDragging: Container(height: 150,width: 150,color: Colors.grey),
                onDragCompleted: (){
                  if(_counter > 3){
                    _counter++;
                  }
                  else{
                    _counter=0;
                  }
                  setState(() {
                    _newColor = _colors[_counter];
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: DragTarget<String>(builder: (context, candidateData, rejectedData) {
              return Container(
                color: _currentColor,
              );
            },
            onWillAccept: (data){
              if(data==Color(0xFFC41A3B).toString()){
                return true;
              }
                return true;
            },
            onAccept: (data){
              setState(() {
                _currentColor = _newColor;
              });
            },
            ),
          )
        ],
      ),
      
    );
  }
}