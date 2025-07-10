library;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/presentation/admin/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'bloc/age_selection_cubit.dart';
//bloc
part 'bloc/email_cubit.dart';
part 'bloc/email_state.dart';
part 'bloc/gender_selection_cubit.dart';
part 'bloc/get_ages_cubit.dart';
part 'bloc/get_ages_state.dart';
part 'bloc/password_cubit.dart';
part 'bloc/password_state.dart';
/// pages
part 'pages/enter_email_view.dart';
part 'pages/enter_password_view.dart';
part 'pages/forget_password_view.dart';
part 'pages/gender_and_age_selection_view.dart';
part 'pages/reset_password_view.dart';
part 'pages/signin_view.dart';
part 'pages/signup_view.dart';
part 'widgets/age_selection.dart';
part 'widgets/ages.dart';
/// widgets
part 'widgets/auth_prompt.dart';
part 'widgets/custom_text_field.dart';
part 'widgets/enter_password_view_content.dart';
part 'widgets/gender_tile.dart';
part 'widgets/password_strength_indicator.dart';
part 'widgets/title_screen.dart';
