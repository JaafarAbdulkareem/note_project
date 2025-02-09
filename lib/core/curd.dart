import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:path/path.dart';

mixin class Curd {
  getRequest({required String url}) async {
    // try {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == ConstantSize.statusCode) {
      return jsonDecode(response.body);
    } else {
      debugPrint("${LanguageKeys.errorStatus} ${response.statusCode}");
    }
    // } catch (e) {
    // debugPrint("${LanguageKeys.errorCatch} Initial GET : $e");
    // }
  }

  postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == ConstantSize.statusCode) {
        return jsonDecode(response.body);
      } else {
        debugPrint("${LanguageKeys.errorStatus} ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("${LanguageKeys.errorCatch} : Initial POST : $e");
    }
  }

  postRequestWithFile({
    required String url,
    required Map<String, dynamic> body,
    required File file,
  }) async {
    try {
      http.MultipartRequest multipartRequest =
          http.MultipartRequest("POST", Uri.parse(url));

      http.ByteStream stream = http.ByteStream(file.openRead());
      int length = await file.length();
      var multifile = http.MultipartFile(
        ConstantNoteApi.image,
        stream,
        length,
        filename: basename(file.path),
      );
      multipartRequest.files.add(multifile);

      body.forEach((key, value) {
        multipartRequest.fields[key] = value;
      });

      http.StreamedResponse streamedResponse = await multipartRequest.send();

      http.Response response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == ConstantSize.statusCode) {
        // var pdfText= await json.decode(json.encode(response.body));
        // return pdfText;
        return await jsonDecode(response.body);
      } else {
        debugPrint("${LanguageKeys.errorStatus} ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("${LanguageKeys.errorCatch} : Initial POST FILE : $e");
    }
  }
}
