import 'package:dio/dio.dart';
//import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  const url = 'http://www.poyntsource.com/New/Global.htm';
  final response = await Dio().get(url);
  RegExp exp =
      //   new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+HTM');
      //   r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+20200921_([0-9]{5}).HTM');
      new RegExp(
          r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+20201013_([0-9]{5}).HTM');
  Iterable<RegExpMatch> matches = exp.allMatches(response.data);
  //Iterable<RegExpMatch> matches = exp.allMatches("/20200914");
  matches.forEach((match) {
    // print(response.data.substring(match.start, match.end));
    String url1 = response.data.substring(match.start, match.end);
    // String url2 = url1;

    downloadTextFileAndPrint2(url1);
    // _deleteCacheDir();
    // _deleteAppDir();
    // downloadTextFileAndPrint1(url2);
  });
}

void downloadTextFileAndPrint2(url1) async {
  try {
    final response = await Dio().get(url1);

    //RegExp exp2 = RegExp(r'^[\d\(\)\-+]');
    //RegExp exp2 = RegExp(r'[^0-9]*([0-9]*).*');
    //RegExp exp = RegExp(r'[h  m  s+ ()\d-]+');
    // RegExp exp = RegExp(r'[+()\d-]+');
    RegExp exp = RegExp(r'.');
    //RegExp exp = RegExp(r'[+()\d-]+new google.maps.LatLng');
    String matches = exp
        // .allMatches(response.body.substring(60))
        //.allMatches(response.body.substring(6000))
        .allMatches(response.data)
        .map((m) => m.group(0))
        .join('');

    //  exp.allMatches(response.body);
    //exp.allMatches(response.body) as String;
    var str = matches;
    const start = "var polypts = [";
    const end = "var polyline";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    String match1 = str.substring(startIndex + start.length, endIndex);

    print(match1.substring(23, 38));
  } catch (e) {
    print(e);
  }

  print(url1);
  /*var channel;
  channel.sink.close();*/
  // print('top');

  //.substring(164, 175));

  //debugPrint(matches);

  //print(match1);
}
