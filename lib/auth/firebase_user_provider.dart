import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FirstAppFirebaseUser {
  FirstAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FirstAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FirstAppFirebaseUser> firstAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FirstAppFirebaseUser>(
            (user) => currentUser = FirstAppFirebaseUser(user));
