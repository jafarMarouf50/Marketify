library;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/presentation/home/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

//bloc

part './bloc/age_selection_cubit.dart';
part './bloc/gender_selection_cubit.dart';
part './bloc/get_ages_cubit.dart';
part './bloc/get_ages_state.dart';
/// pages
part './pages/enter_password_view.dart';
part './pages/forget_password_view.dart';
part './pages/gender_and_age_selection_view.dart';
part './pages/reset_password_view.dart';
part './pages/signin_view.dart';
part './pages/signup_view.dart';
part './widgets/age_selection.dart';
part './widgets/ages.dart';
/// widgets
part './widgets/auth_prompt.dart';
part './widgets/custom_text_field.dart';
part './widgets/gender_tile.dart';
part './widgets/title_screen.dart';
