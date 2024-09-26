import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_task/features/display_animals/presentation/cubit/fetch_breeds_cubit.dart';

import '../../data/models/breeds.dart';
import '../widgets/preview_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<FetchBreedsCubit>().fetchInitialResults();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<FetchBreedsCubit>().fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<FetchBreedsCubit, FetchBreedsState>(
          builder: (context, state) {
            if (state is FetchBreedsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchBreedsFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is FetchBreedsSuccess) {
              final animals = state.animals;
              return _buildListPreview(context, animals, state);
            } else if (state is FetchBreedsLoadingMore) {
              final animals = state.animals;
              return _buildListPreview(context, animals, state);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildListPreview(BuildContext context, List<AnimalBreeds> animals,
      FetchBreedsState state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      itemCount: animals.length + (state is FetchBreedsLoadingMore ? 1 : 0),
      shrinkWrap: false,
      itemBuilder: (context, index) {
        if (index == animals.length && state is FetchBreedsLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final breed = animals[index];
          return PreviewViewListWidget(animalBreeds: breed);
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
