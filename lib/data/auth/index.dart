library;

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part './datasource/auth_firebase_service.dart';
part './datasource/auth_local_service.dart';
part './models/user_model.dart';
part './repositories/auth_repository_impl.dart';
part 'request/create_user_request.dart';
part 'request/login_user_request.dart';
