part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ApartmentLoading extends HomeState {}
class ApartmentSuccess extends HomeState {}
class ApartmentFailure extends HomeState {}


class RoomIsSuccess extends HomeState {}
class TotalEmpty extends HomeState {}

  class ProfileLoding extends HomeState {}
  class ProfileSuccess extends HomeState {}
  class ProfileFailure extends HomeState {}
  class ProfileIsUpdate extends HomeState {}
  class ProfileReadOrNotRead extends HomeState {}



  class ChangeBottomNavIndexState extends HomeState {}



  class RequestLoding extends HomeState {}
  class RequestSuccess extends HomeState {}
  class RequestFailure extends HomeState {}
  class RequestNotEmpty extends HomeState {}






  class MoodState extends HomeState {}
  class Update extends HomeState {}


  class UpdateRoomDetailsIsFailure extends HomeState {}
  class UpdateRoomDetailsIsSuccess extends HomeState {}
  class UpdateRoomDetailsIsLoading extends HomeState {}
  class UpdateRoomDetailsIsNotEmpty extends HomeState {}







 //room
  class RoomDetailsIsSuccess extends HomeState {}
  class RoomDetailsIsLoading extends HomeState {}
  class RoomDetailsIsFailure extends HomeState {}
  class RoomDetailsIsNotEmpty extends HomeState {}


 //favourites
  class FavouritesSuccess extends HomeState {}
  class FavouritesLoading extends HomeState {}
  class FavouritesFailure extends HomeState {}

  class AddorRemoveFavourites extends HomeState {}
  class FailedToAddorRemoveFavourites extends HomeState {}


  class GetRequestApprovedDataSuccess extends HomeState {}
  class FailedToGetRequestApprovedData extends HomeState {}

  class GetRequestUnacceptableDataSuccess extends HomeState {}
  class FailedToGetRequestUnacceptedData extends HomeState {}


  class GetRequestUnconfirmedDataSuccess extends HomeState {}
  class FailedToGetRequestUnconfirmedData extends HomeState {}


  class GetRequestDetailsSuccess extends HomeState {}
  class FailedToGetRequestDetails extends HomeState {}


  class UpdateRequestSuccess extends HomeState {}
  class FailedToUpdateRequest extends HomeState {}


  class AddOrUpdateRatingSuccess extends HomeState {}
  class FailedToAddOrUpdateRating extends HomeState {}