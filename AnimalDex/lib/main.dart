import 'package:animaldex/domain/entities/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animaldex/app.dart';
import 'package:animaldex/core/network.dart';
import 'package:animaldex/data/repositories/animal_repository.dart';
import 'package:animaldex/data/source/github/github_datasource.dart';
import 'package:animaldex/data/source/local/local_datasource.dart';
import 'package:animaldex/states/animal/animal_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Services
        ///
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),

        ///
        /// Repositories
        ///
        RepositoryProvider<AnimalRepository>(
          create: (context) => AnimalDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ///
          /// BLoCs
          ///
          BlocProvider<AnimalBloc>(
            create: (context) => AnimalBloc(context.read<AnimalRepository>()),
          ),
        ],
        child: AnimalDexApp(),
      ),
    ),
  );
}
