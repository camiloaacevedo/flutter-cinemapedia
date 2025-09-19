import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({ super.key });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if ( initialLoading ) return const FullScreenLoader();

    final slideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),


        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
                children: [

                  // const CustomAppbar(),

                  MoviesSlideshow(movies: slideShowMovies ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'In theaters',
                    subTitle: 'Monday 20',
                    loadNextPage: () =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),

                  ),

                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Soon',
                    subTitle: 'This month',
                    loadNextPage: () =>ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Popular',
                    // subTitle: '',
                    loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),

                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Best rated',
                    subTitle: 'Since always',
                    loadNextPage: () =>ref.read(topRatedMoviesProvider.notifier).loadNextPage(), 
                  ),

                  const SizedBox( height: 10 ),


              ],
            );
          },
          childCount: 1
        )),

      ]
    );
  }
}