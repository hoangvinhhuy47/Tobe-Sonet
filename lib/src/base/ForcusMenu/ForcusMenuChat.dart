library focused_menu;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:hexcolor/hexcolor.dart';

class FocusedMenuHolder extends StatefulWidget {
  final Widget child;
  final double? menuItemExtent;
  final double? menuWidth;
  final List<FocusedMenuItem> menuItems;
  final bool? animateMenuItems;
  final BoxDecoration? menuBoxDecoration;
  final Function onPressed;
  final Function onPressedLove;
  final Function onPressedLike;
  final Function onPressedSad;
  final Function onPressedSmile;
  final Function onPressedWOW;
  final Function onPressedAngry;
  final Function onPressedReply;
  final Function onPressedForward;
  final Function onPressedCoppy;
  final Function onPressedDelete;
  final Duration? duration;
  final double? blurSize;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;

  /// Open with tap insted of long press.
  final bool openWithTap;

  const FocusedMenuHolder(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.menuItems,
      this.duration,
      this.menuBoxDecoration,
      this.menuItemExtent,
      this.animateMenuItems,
      this.blurSize,
      this.blurBackgroundColor,
      this.menuWidth,
      this.bottomOffsetHeight,
      this.menuOffset,
      this.openWithTap = false,
      required this.onPressedLove,
      required this.onPressedLike,
      required this.onPressedSad,
      required this.onPressedSmile,
      required this.onPressedWOW,
      required this.onPressedAngry,
      required this.onPressedReply,
      required this.onPressedForward,
      required this.onPressedCoppy,
      required this.onPressedDelete})
      : super(key: key);

  @override
  _FocusedMenuHolderState createState() => _FocusedMenuHolderState();
}

class _FocusedMenuHolderState extends State<FocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = Offset(0, 0);
  Size? childSize;
  bool seen = false;

  getOffset() {
    RenderBox renderBox =
        containerKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      this.childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: containerKey,
        onLongPress: () async {
          widget.onPressed();
          if (widget.openWithTap) {
            await openMenu(context);
          }
        },
        onDoubleTap: () async {
          widget.onPressed();
          if (widget.openWithTap) {
            await openMenu(context);
          }
        },
        child: widget.child);
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: widget.duration ?? Duration(milliseconds: 50),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                  opacity: animation,
                  child: FocusedMenuDetails(
                    onPressedAngry: widget.onPressedAngry,
                    onPressedLove: widget.onPressedLove,
                    onPressedLike: widget.onPressedLike,
                    onPressedSmile: widget.onPressedSmile,
                    onPressedSad: widget.onPressedSad,
                    onPressedWOW: widget.onPressedWOW,
                    onPressedReply: widget.onPressedReply,
                    onPressedForward: widget.onPressedForward,
                    onPressedCoppy: widget.onPressedCoppy,
                    onPressedDelete: widget.onPressedDelete,
                    itemExtent: widget.menuItemExtent,
                    menuBoxDecoration: widget.menuBoxDecoration,
                    child: widget.child,
                    childOffset: childOffset,
                    childSize: childSize,
                    menuItems: widget.menuItems,
                    blurSize: widget.blurSize,
                    menuWidth: widget.menuWidth,
                    blurBackgroundColor: widget.blurBackgroundColor,
                    animateMenu: widget.animateMenuItems ?? true,
                    bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
                    menuOffset: widget.menuOffset ?? 0,
                  ));
            },
            fullscreenDialog: true,
            opaque: false));
  }
}

class FocusedMenuDetails extends StatelessWidget {
  final List<FocusedMenuItem> menuItems;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final bool animateMenu;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  final Function onPressedLove;
  final Function onPressedLike;
  final Function onPressedSad;
  final Function onPressedSmile;
  final Function onPressedWOW;
  final Function onPressedAngry;
  final Function onPressedReply;
  final Function onPressedForward;
  final Function onPressedCoppy;
  final Function onPressedDelete;
  const FocusedMenuDetails(
      {Key? key,
      required this.menuItems,
      required this.child,
      required this.childOffset,
      required this.childSize,
      required this.menuBoxDecoration,
      required this.itemExtent,
      required this.animateMenu,
      required this.blurSize,
      required this.blurBackgroundColor,
      required this.menuWidth,
      this.bottomOffsetHeight,
      this.menuOffset,
      required this.onPressedLove,
      required this.onPressedLike,
      required this.onPressedSad,
      required this.onPressedSmile,
      required this.onPressedWOW,
      required this.onPressedAngry,
      required this.onPressedReply,
      required this.onPressedForward,
      required this.onPressedCoppy,
      required this.onPressedDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.45;
    final listHeight = menuItems.length * (itemExtent ?? 50.0);
    final maxMenuWidth = menuWidth ?? (size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx + maxMenuWidth) < size.width
        ? childOffset.dx
        : (childOffset.dx - maxMenuWidth + childSize!.width);
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) <
            size.height - bottomOffsetHeight!
        ? childOffset.dy + childSize!.height + menuOffset!
        : childOffset.dy - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: blurSize ?? 4, sigmaY: blurSize ?? 4),
                  child: Container(
                    color:
                        (blurBackgroundColor ?? Colors.black).withOpacity(0.7),
                  ),
                )),
            Positioned(
              top: topOffset,
              left: leftOffset,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 200),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Row(
                  children: [
                    Container(
                      height: 147,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          TweenAnimationBuilder(
                              builder: (context, dynamic value, child) {
                                return Transform(
                                  transform: Matrix4.rotationX(1.5708 * value),
                                  alignment: Alignment.bottomCenter,
                                  child: child,
                                );
                              },
                              tween: Tween(begin: 1.0, end: 0.0),
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                height: 50,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: HexColor('#FFFFFF'),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedLove(
                                          'lib/src/assets/images/mess_love.png',
                                        );
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_love.png',
                                          fit: BoxFit.contain,
                                          height: 25,
                                          width: 30,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedLike(
                                          'lib/src/assets/images/mess_like.png',
                                        );
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_like.png',
                                          fit: BoxFit.contain,
                                          height: 26,
                                          width: 27,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        onPressedSmile(
                                          'lib/src/assets/images/mess_smile.png',
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_smile.png',
                                          fit: BoxFit.contain,
                                          height: 27,
                                          width: 28,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedWOW(
                                            'lib/src/assets/images/mess_wow.png');
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_wow.png',
                                          fit: BoxFit.contain,
                                          height: 35,
                                          width: 35,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedSad(
                                            'lib/src/assets/images/mess_sad.png');
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_sad.png',
                                          fit: BoxFit.contain,
                                          height: 27,
                                          width: 28,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedAngry(
                                          'lib/src/assets/images/mess_angry.png',
                                        );
                                      },
                                      child: CircleAvatar(
                                        child: Image.asset(
                                          'lib/src/assets/images/mess_angry.png',
                                          fit: BoxFit.contain,
                                          height: 28,
                                          width: 27,
                                        ),
                                        backgroundColor: HexColor('#FFFFFF'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          TweenAnimationBuilder(
                              builder: (context, dynamic value, child) {
                                return Transform(
                                  transform: Matrix4.rotationX(1.5708 * value),
                                  alignment: Alignment.bottomCenter,
                                  child: child,
                                );
                              },
                              tween: Tween(begin: 1.0, end: 0.0),
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                width: size.width * 0.8,
                                height: 90,
                                margin: const EdgeInsets.only(top: 7),
                                decoration: BoxDecoration(
                                    color: HexColor('#FFFFFF'),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedReply();
                                      },
                                      child: Container(
                                        height: 90,
                                        width: size.width * 0.8 / 4,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: Image.asset(
                                                'lib/src/assets/images/mess_reply.png',
                                                fit: BoxFit.contain,
                                                height: 32,
                                                width: 28,
                                              ),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                            ),
                                            Text(
                                              'Reply',
                                              style: TextStyle(
                                                  color: HexColor('#38D9A4'),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'IBMPlex',
                                                  fontStyle: FontStyle.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedForward();
                                      },
                                      child: Container(
                                        height: 90,
                                        width: size.width * 0.8 / 4,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: Image.asset(
                                                'lib/src/assets/images/forward.png',
                                                fit: BoxFit.contain,
                                                height: 32,
                                                width: 28,
                                              ),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                            ),
                                            Text(
                                              'Forward',
                                              style: TextStyle(
                                                  color: HexColor('#38D9A4'),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'IBMPlex',
                                                  fontStyle: FontStyle.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedCoppy();
                                      },
                                      child: Container(
                                        height: 90,
                                        width: size.width * 0.8 / 4,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: Image.asset(
                                                'lib/src/assets/images/mess_coppy.png',
                                                fit: BoxFit.contain,
                                                height: 32,
                                                width: 22,
                                              ),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                            ),
                                            Text(
                                              'Coppy',
                                              style: TextStyle(
                                                  color: HexColor('#38D9A4'),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'IBMPlex',
                                                  fontStyle: FontStyle.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onPressedDelete();
                                      },
                                      child: Container(
                                        height: 90,
                                        width: size.width * 0.8 / 4,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: Image.asset(
                                                'lib/src/assets/images/mess_delete.png',
                                                fit: BoxFit.contain,
                                                height: 32,
                                                width: 22,
                                              ),
                                              backgroundColor:
                                                  HexColor('#FFFFFF'),
                                            ),
                                            Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: HexColor('#38D9A4'),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'IBMPlex',
                                                  fontStyle: FontStyle.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: childOffset.dy,
                left: childOffset.dx,
                child: AbsorbPointer(
                    absorbing: true,
                    child: Container(
                        width: childSize!.width,
                        height: childSize!.height,
                        child: child))),
          ],
        ),
      ),
    );
  }
}
