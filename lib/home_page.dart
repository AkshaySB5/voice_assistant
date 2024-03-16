import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_assistant/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State <HomePage> createState() =>  _HomePageState();
}

class  _HomePageState extends State <HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Voice Assistant'),
        leading: const Icon(Icons.menu),
        centerTitle: true,

      ),
      body:Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                height:120,
                width:120,
                margin:const EdgeInsets.only(top: 4),
                decoration:const BoxDecoration(
                  color: Pallete.assistantCircleColor,
                  shape: BoxShape.circle,
                )),
              ),
              Container(
                height:125,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image:DecorationImage(image: AssetImage('assets/images/virtualAssistant.png')),

                ),
              )


            ],
          ),
          Container(
            padding:const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),

            margin:const EdgeInsets.symmetric(
              horizontal: 40).copyWith(
                top: 30
              ),
              decoration: BoxDecoration(
               border: Border.all(),
               color: Pallete.whiteColor,


              ),
              child: const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: Text('Good Morning,What task can i do for you?',
                style: TextStyle(
                  fontSize: 25,
                  color: Pallete.mainFontColor,
                  fontFamily:'Cera Pro'
                ),),
              ),
          )

        ],

      ) ,
    );
  }
}