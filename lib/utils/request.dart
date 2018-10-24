import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

enum RequestMethods { get, put, post, delete }

Future<Map> request (RequestMethods method, url, { Map<String, String> headers, body, Encoding encoding}) async {
  http.Response r;
  switch (method) {
    case RequestMethods.get:
      r = await http.get(url, headers: headers);
      break;
    case RequestMethods.put:
      r = await http.put(url, headers: headers, body: body);
      break;
    case RequestMethods.post:
      r = await http.post(url, headers: headers, body: body);
      break;
    case RequestMethods.delete:
      r = await http.delete(url);
      break;
    default:
  }
  try {
      Map m = json.decode(r.body);
      if (m['code'] == 0) {
        return m['data'];
      } else {
        throw m['msg'];
      }
    } catch(e) {
      throw e;
    }
}