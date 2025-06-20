import 'package:fake_instagram/features/profile/domain/entities/profile_user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUser profile;

  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}
