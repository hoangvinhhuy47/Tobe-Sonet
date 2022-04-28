import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:video_player/video_player.dart';


class Item_ChatLinkVideo extends StatefulWidget {
  State<Item_ChatLinkVideo> createState() => _Item_ChatLinkVideo();
}

class _Item_ChatLinkVideo extends State<Item_ChatLinkVideo> {
  bool like = false;
  late VideoPlayerController _videoPlayerController1;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=ljfxIlT_T_4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,

    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 250,
      padding: const EdgeInsets.only(left: 2, right: 20, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Stack(alignment: Alignment.center, children: [
              CircleAvatar(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
                radius: 50,
                backgroundColor: HexColor('#FFFFFF'),
              ),
              Positioned(
                  top: 21,
                  left: 21,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#FFFFFF'), width: 2),
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: <Color>[
                          HexColor('#22F3AE'),
                          HexColor('#4EBE99'),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
          Container(
            width: size.width * 0.6,
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          like
              ? Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: Colors.white,
            //   border: Border.all(color: HexColor('#ECEBEB'), width: 2),
            // ),
            child: Image.asset(
              'assets/images/like_cmt.png',
              fit: BoxFit.contain,
              width: 12,
              height: 12,
            ),
          )
              : Container()
        ],
      ),
    );
  }
}
