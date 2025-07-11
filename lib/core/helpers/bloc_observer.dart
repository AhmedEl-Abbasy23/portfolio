import 'package:portfolio/exports.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'onCreate Cubit-- ${bloc.runtimeType}'.logIfDebug();
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'onChange States-- ${bloc.runtimeType}, $change'.logIfDebug();
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    'onError Cubit-- ${bloc.runtimeType}, $error'.logIfDebug();
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    'onClose Cubit-- ${bloc.runtimeType}'.logIfDebug();
  }
}