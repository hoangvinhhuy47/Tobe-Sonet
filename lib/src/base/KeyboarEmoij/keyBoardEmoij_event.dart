import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class KeyBoardEmoij extends StatefulWidget {
  const KeyBoardEmoij({Key? key, required this.controller}) : super(key: key);

  State<KeyBoardEmoij> createState() => _KeyBoardEmoij();
  final TextEditingController controller;
}

class _KeyBoardEmoij extends State<KeyBoardEmoij> {
  bool emojiShowing = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _onEmojiSelected(Emoji emoji) {
      widget.controller
        ..text += emoji.emoji
        ..selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length));
    }

    _onBackspacePressed() {
      widget.controller
        ..text = widget.controller.text.characters.skipLast(1).toString()
        ..selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length));
    }

    return SizedBox(
      height: 250,
      child: EmojiPicker(
          onEmojiSelected: (Category category, Emoji emoji) {
            _onEmojiSelected(emoji);
          },
          onBackspacePressed: _onBackspacePressed,
          config: Config(
              columns: 7,
              // Issue: https://github.com/flutter/flutter/issues/28894
              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              initCategory: Category.RECENT,
              bgColor: const Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              progressIndicatorColor: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              showRecentsTab: true,
              recentsLimit: 28,
              noRecentsText: 'No Recents',
              noRecentsStyle:
                  const TextStyle(fontSize: 20, color: Colors.black26),
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL)),
    );
  }
}
