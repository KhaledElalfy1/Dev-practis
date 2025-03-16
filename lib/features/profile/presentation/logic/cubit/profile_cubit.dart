import 'package:dev_practice/features/profile/data/repository/profile_repo.dart';
import 'package:dev_practice/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());
  final ProfileRepo _profileRepo;
  void profileEmitter() async {
    emit(const ProfileState.profileLoading());
    final result = await _profileRepo.getUserProfile();
    result.when(
      success: (data) {
        emit(ProfileState.profileLoaded(data));
      },
      failure: (error) {
        emit(ProfileState.profileFailure(error));
      },
    );
  }
}
