import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:imagine_bloc/Constants/key_and_screate.dart';
import 'package:imagine_bloc/Models/image_model.dart';
import 'package:http/http.dart' as http;
import 'package:imagine_bloc/Services/api_service.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    final homeScreenScrollController = ScrollController();
    on<FetchImages>((event, emit) async {
      emit(HomeScreenLoading());
      // TODO: implement event handler
      var res = await ApiService.getHomeScreenImages();
      var featuredImageRes = await ApiService.getFeaturedImages();
      if (res != null && featuredImageRes != null) {
        List<ImageModel> images =
            res.map<ImageModel>((e) => ImageModel.fromJson(e)).toList();
        var featuredImage = ImageModel.fromJson(featuredImageRes);
        emit(HomeScreenLoaded(images: images, featuredImage: featuredImage, scrollController: homeScreenScrollController));
      } else {
        emit(HomeScreenImageLoadError());
      }
    });
  }
}
