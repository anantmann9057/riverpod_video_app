import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:video_application/modal_classes/user_videos_model.dart';

class UserVideosState extends PagedState<int,Datum>{
  // We can extends [PagedState] to add custom parameters to our state

  const  UserVideosState({
    List<Datum>? records,
    String? error,
    int? nextPageKey,
    List<int>? previousPageKeys }):
        super(records: records, error: error, nextPageKey: nextPageKey);

  // We can customize our .copyWith for example
  @override
  UserVideosState  copyWith({
    bool? filterByCity,
    List<Datum>? records,
    dynamic  error,
    dynamic  nextPageKey,
    List<int>? previousPageKeys
  }){
    final  sup = super.copyWith(
        records: records,
        error: error,
        nextPageKey: nextPageKey,
        previousPageKeys: previousPageKeys);

    return  UserVideosState(
    records: sup.records,
    error: sup.error,
    nextPageKey: sup.nextPageKey,
    previousPageKeys: sup.previousPageKeys);
    }
}