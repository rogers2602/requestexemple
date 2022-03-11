import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'EndPoint.dart';
import 'ReqTypes.dart';

class Api {
  // @GET
  static Future<http.Response> get({required String endPoint, Map<String, String> headers = const {}}) async {
    return await _requisitionHandling(endPoint: endPoint, typeRequest: ReqTypes.post, headers: headers);
  }

  // @POST
  static Future<http.Response> post({
    required String endPoint,
    dynamic body,
    Map<String, String> headers = const {},
    Encoding encoding = utf8,
  }) async {
    return await _requisitionHandling(endPoint: endPoint, typeRequest: ReqTypes.post, body: body, encoding: encoding, headers: headers);
  }

  // @PUT
  static Future<http.Response> put({
    required String endPoint,
    dynamic body,
    Map<String, String> headers = const {},
    Encoding encoding = utf8,
  }) async {
    return await _requisitionHandling(endPoint: endPoint, typeRequest: ReqTypes.post, body: body, encoding: encoding, headers: headers);
  }

  // @DELETE
  static Future<http.Response> delete({
    required String endPoint,
    dynamic body,
    Map<String, String> headers = const {},
    Encoding encoding = utf8,
  }) async {
    return await _requisitionHandling(endPoint: endPoint, typeRequest: ReqTypes.post, body: body, encoding: encoding, headers: headers);
  }

  ////////////////////////////////////////////////////////
  // FUNÇÕES PRIVADAS - ESTRUTURA API
  ////////////////////////////////////////////////////////

  static _requisitionHandling(
      {required String endPoint,
      required ReqTypes typeRequest,
      dynamic body,
      Map<String, String> headers = const {},
      Encoding encoding = utf8}) async {
    var url = "${EndPoint.DOMAIN}$endPoint";

    // Código comentado para futuras implementações
    Map<String, String> headersAdd = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // HttpHeaders.authorizationHeader: Header.getBasicAuth(),
      //"Authorization": "Bearer " + token,
      // HttpHeaders.acceptEncodingHeader: "gzip"
    };

    if (headers.isNotEmpty) {
      headersAdd.addAll(headers);
    }

    var _responseDefault = http.Response(jsonEncode({"Resposta": "Não encontrado"}), 404);

    try {
      switch (typeRequest) {
        case ReqTypes.get:
          _responseDefault = await http.get(Uri.parse(url), headers: headersAdd);
          break;
        case ReqTypes.post:
          _responseDefault = await http.post(Uri.parse(url), headers: headersAdd, body: body, encoding: encoding);
          break;
        case ReqTypes.put:
          _responseDefault = await http.put(Uri.parse(url), headers: headersAdd, body: body, encoding: encoding);
          break;
        case ReqTypes.delete:
          _responseDefault = await http.delete(Uri.parse(url), headers: headersAdd, body: body, encoding: encoding);
          break;
      }
    } on SocketException catch (e) {
      if (!kReleaseMode) debugPrint("SocketException" + e.toString());
      _responseDefault = http.Response(jsonEncode({"Resposta": "Verifique sua conexão com a internet!"}), 408);
    } on FormatException catch (e) {
      if (!kReleaseMode) debugPrint("FormatException" + e.toString());
      _responseDefault = http.Response(jsonEncode({"Resposta": "Ocorreu algum erro ao obter dados do servidor!"}), 404);
    } on Exception catch (e) {
      if (!kReleaseMode) debugPrint('ERROR: Exception: ' + e.toString());
      _responseDefault = http.Response(jsonEncode({"Resposta": 'Ocorreu um erro: ' + e.toString()}), 500);
    }
    return _responseDefault;
  }
}
