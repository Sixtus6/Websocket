import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Wsocket extends StatefulWidget {
  const Wsocket({super.key});

  @override
  State<Wsocket> createState() => _WsocketState();
}

class _WsocketState extends State<Wsocket> {
  late WebSocketChannel mychannel;
  @override
  void initState() {
    mychannel = IOWebSocketChannel.connect("wss://stream.binance.com:9443/ws/etheur@trade");
    // TODO: implement initState
    super.initState();
  }
  Map newdata = {};

  @override
  Widget build(BuildContext context) {
    print("jjdfdjfdf");
    return   SafeArea
(
      child: Scaffold(
    body: Center(
      child: Container(
      child:   StreamBuilder(builder: ((BuildContext context, AsyncSnapshot snapshot) {
                newdata = snapshot.hasData? jsonDecode(snapshot.data):{};
              // print(newdata[""]);
               return Padding(
                 padding: const EdgeInsets.all(15),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                    
                    // Container(child: Text(snapshot.hasData ?"${snapshot.data}":"Loading"),),
                   
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Event Type:"+"  "+ newdata["e"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                    
                     Row(children: [                      
                        Text("Event time:"+"  "+ newdata["E"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                      SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Symbols:"+"  "+ newdata["s"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Trade ID:"+"  "+ newdata["t"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Price:"+"  "+ newdata["p"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Quantity:"+"  "+ newdata["q"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Buy Order ID:"+"  "+ newdata["b"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Sell Order ID:"+"  "+ newdata["a"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Trade Time:"+"  "+ newdata["T"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Is The Buyer The Market Maker ?:"+"  "+ newdata["m"].toString(), style: TextStyle(fontSize: 16),)
                     ],),
                     SizedBox(height: 6,),
                     Row(children: [                      
                        Text("Ignore:"+"  "+ newdata["M"].toString(), style: TextStyle(fontSize: 16),)
                     ],)
                     
                   ],
                 ),
               );
             }), stream: mychannel.stream,),
      ),
    ),
      ),
    );
  }
}