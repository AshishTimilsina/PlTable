import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pltable/api_integration/api_service.dart';
import 'package:pltable/api_integration/api_state.dart';

final dataprovider = StateNotifierProvider<PlProvider, PremierLeagueState>(
    (ref) =>
        PlProvider(PremierLeagueState.empty(), ref.watch(plserviceprovider)));

class PlProvider extends StateNotifier<PremierLeagueState> {
  final PlService service;
  PlProvider(super.state, this.service) {
    getdata();
  }
  Future<void> getdata() async {
    state = state.copyWith(
        errMessage: '', isError: false, isLoad: true, isSuccess: false, pl: []);
    final response = await service.getdata();
    response.fold((l) {
      state = state.copyWith(
          errMessage: l,
          isError: true,
          isLoad: false,
          isSuccess: false,
          pl: []);
    }, (r) {
      state = state.copyWith(
          errMessage: '',
          isError: false,
          isLoad: false,
          isSuccess: true,
          pl: r);
    });
  }
}
