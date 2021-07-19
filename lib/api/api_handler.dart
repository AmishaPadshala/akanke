import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../components/app_func.dart';

enum APIType { aGet, aPost, aMultipart }

class API {
  static http.Response response;

  static Future apiHandler(
      {@required String url,
      @required APIType apiType,
      Map<String, dynamic> body,
      Map<String, dynamic> header}) async {
    print("*************************************");
    print(url);

    try {
      if (apiType == APIType.aGet) {
        response = await http.get(Uri.parse(url));
      } else if (apiType == APIType.aPost) {
        response = await http.post(Uri.parse(url), body: body);
      } else {
        MultipartRequest request = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );
        request.fields.addAll({"data": json.encode(body)});
        request.files.add(http.MultipartFile.fromBytes(
            'images', File(body["filepath"]).readAsBytesSync(),
            filename: body["filepath"].split("/").last));
        response = await http.Response.fromStream(await request.send());
      }
      print("RESPONSE ${response.body} ");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        if (response.body != null) {
          showMessage(response.body);
        }
      }
    } on SocketException catch (_) {
      showMessage("Please check your network connection.");
    } catch (e) {
      showMessage("ERROR ${e}");
      print("ERROR ${e}");
    }
    return null;
  }
}
