import 'package:flutter/material.dart';



class FilteredTextStyle extends StatelessWidget {
  final  String messageText;
  final  String messageSender;
  final bool isMe;

  const FilteredTextStyle({
    @required this.messageText,
    @required this.messageSender,
    @required this.isMe,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            children: [
              InkWell(
                onLongPress: (){
                  print('pressed');
                },
                child: Material(
                    borderRadius: isMe ? BorderRadius.only(
                      topLeft: Radius.circular(13.0),
                      bottomLeft: Radius.circular(13.0),
                      topRight: Radius.circular(13.0),
                    ) : BorderRadius.only(
                      topRight: Radius.circular(13.0),
                      bottomLeft: Radius.circular(13.0),
                      bottomRight: Radius.circular(13.0),
                    ),
                    color: isMe ? Colors.lightBlueAccent : Colors.tealAccent,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text('$messageText',
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                            fontSize: 18.0
                        ) ,),
                    )),
              ),
              Text('$messageSender',
                style: TextStyle(
                    color: Colors.grey
                ),),
            ],
          )
        ],
      ),
    );
  }
}