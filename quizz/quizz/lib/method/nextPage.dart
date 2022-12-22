import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future NextPage(context, page) async =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
