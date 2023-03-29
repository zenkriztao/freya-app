import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImF6aWVtcDY2QGdtYWlsLmNvbSIsIm5hbWUiOiJBemllIE1lbHphIFByYXRhbWEiLCJyb2xlIjoiIiwiZXhwIjoxNjgwMTEwMDkzfQ.rRuRD2vP6vRL8IF2mGTGpX0nVj4ZEufKZ5cUMkXyg04";

Map<String, dynamic> payload = Jwt.parseJwt(token);

void main() {
print(payload);
}