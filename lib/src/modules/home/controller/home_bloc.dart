import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_list_my_bloc/src/repositories/user/user_repository.dart';

import '/src/core/infra/bloc.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  HomeBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(HomeInitial());

  final UserRepository _userRepository;

  User get user => _userRepository.getUser()!;
}
