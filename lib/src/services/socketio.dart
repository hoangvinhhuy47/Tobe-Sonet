
import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ScoketIo {
  void ConnectSever (String url,dynamic Data){
    var socket = io.io(url, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'}
    });
    socket.on('connect', (_) {
      print('connect');
      socket.emit('msg', 'init');
      var count = 0;
      Timer.periodic(const Duration(seconds: 1), (Timer countDownTimer) {
        socket.emit('msg', count++);
      });
    });
    socket.on('event', (data) => print(data));
  }
}
void Connect() {
  var socket = io.io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'extraHeaders': {'foo': 'bar'}
  });
  socket.on('connect', (_) {
    print('connect');
    socket.emit('msg', 'init');
    var count = 0;
    Timer.periodic(const Duration(seconds: 1), (Timer countDownTimer) {
      socket.emit('msg', count++);
    });
  });
  socket.on('event', (data) => print(data));
  socket.on('disconnect', (_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));
}