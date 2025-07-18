import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/domain/category/index.dart';

part 'datasource/category_firebase_service.dart';
part 'models/category_model.dart';
part 'repositories/category_data_repository.dart';
part 'repositories/category_repository_impl.dart';
part 'request/store_category_request.dart';