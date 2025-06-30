library;

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

//datasource
part './datasource/auth_firebase_service.dart';
part './datasource/auth_local_service.dart';
// models
part './models/create_user_request.dart';
part './models/login_user_request.dart';
part './models/user_model.dart';
//repositories
part './repositories/auth_repository_impl.dart';
