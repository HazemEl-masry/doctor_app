import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const DocApp());
}
