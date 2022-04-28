// import 'package:get/get.dart';
//
// class UserProvider extends GetConnect {
//   // Get request
//   Future<Response> getUser(String url) => get(url);
//   // Post request
//   // Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
//   // Post request with File
//   Future<Response<String>> postCases(List<int> image) {
//     final form = FormData({
//       'file': MultipartFile(image, filename: 'avatar.png'),
//       'otherFile': MultipartFile(image, filename: 'cover.png'),
//     });
//     return post('http://youapi/users/upload', form);
//   }
//
//   GetSocket userMessages() {
//     return socket('https://yourapi/users/socket');
//   }
// }