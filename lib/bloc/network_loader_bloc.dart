import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/Models/first_aid_data_model.dart';
import 'package:help_me/Models/precautions_data_model.dart';
import 'package:help_me/services/network_loader.dart';

part 'network_loader_event.dart';
part 'network_loader_state.dart';

class NetworkLoaderBloc extends Bloc<NetworkLoaderEvent, NetworkLoaderState> {
  NetworkLoaderBloc() : super(NetworkLoaderInitial());

  NetworkLoader api = NetworkLoader();

  @override
  Stream<NetworkLoaderState> mapEventToState(
    NetworkLoaderEvent event,
  ) async* {
    yield NetworkLoaderInitial();
    if (event is GetPrecautions) {
      try {
        final PrecautionsDataRepository precautions =
            await api.getPrecautionsData();
        yield NetworkLoaderLoaded(precautions, null);
      } catch (error) {
        yield NetworkLoaderError(error.toString());
      }
    }
    if (event is GetFirstAid) {
      try {
        final FirstAidDataRepository firstAid = await api.getFirstAidData();
        yield NetworkLoaderLoaded(null, firstAid);
      } catch (error) {
        yield NetworkLoaderError(error.toString());
      }
    }
  }
}
