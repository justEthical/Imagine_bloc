import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:lottie/lottie.dart';
import 'package:imagine_bloc/Constants/app_assets.dart';
import 'package:imagine_bloc/Constants/app_colors.dart';
import 'package:imagine_bloc/Screens/HomeScreen/Widgets/category_section.dart';
import 'package:imagine_bloc/Screens/HomeScreen/bloc/home_screen_bloc.dart';

import 'Widgets/staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoaded) {
              return SingleChildScrollView(
                controller: state.scrollController,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Featured",
                          style: TextStyle(
                              fontSize: 26,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Figtree'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: state.featuredImage.url.regular,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                  BlurHash(hash: state.featuredImage.blurHash),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CategorySection(),
                        SizedBox(
                          height: 20,
                        ),
                        StaggeredGridView(
                          listOfImages: state.images,
                        )
                      ]),
                ),
              );
            } else if (state is HomeScreenImageLoadError) {
              return Center(
                child: Text("Something went wrong, pls try again later"),
              );
            } else {
              return Center(
                  child: LottieBuilder.asset(AppAssets.loaderAnimation));
            }
          },
        ),
      ),
    );
  }
}
