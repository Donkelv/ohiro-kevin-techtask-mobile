

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

String errResponse(Object err) {
  if (err is dio.DioException) {
    if (err.type == dio.DioExceptionType.connectionTimeout) {
      return "Connection timed out\nplease try again"; //Left(Failure(message: ""));
    } else {
      if (err.response == null) {
        debugPrint(err.error.toString());
        return "Problem encountered, kindly try again"; //Left(Failure(message: ""));
      } else {
        if (err.response!.data is Map<String, dynamic>) {
          Map<String, dynamic> content = err.response!.data;
          debugPrint(err.response.toString());
          return content[
              'message']; //Left(Failure(message: content['message']));
        } else {
          debugPrint(err.response.toString());
          return "Problem encountered, kindly try again later"; //Left(Failure(message: ""));
        }
      }
    }
  } else {
    return err.toString(); //Left(Failure(message: ));
  }
}
