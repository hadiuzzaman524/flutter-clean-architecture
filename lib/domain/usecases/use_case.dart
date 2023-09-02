// ignore: one_member_abstracts
abstract class UseCase<Type, Param> {
  Future<Type> run({Param param});
}
