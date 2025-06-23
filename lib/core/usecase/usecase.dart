part of '../index.dart';

abstract class UseCase<Type, Param> {
  Future<Type> call({Param params});
}
