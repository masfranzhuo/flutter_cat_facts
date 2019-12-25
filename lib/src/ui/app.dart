import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact-list/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/random-image/bloc/bloc.dart';

import 'views/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<FactListBloc>(
            create: (context) => FactListBloc()..add(GetFactListEvent())),
        BlocProvider<FactBloc>(
            create: (context) =>
                FactBloc(factListBloc: BlocProvider.of<FactListBloc>(context))),
        BlocProvider<RandomImageBloc>(
          create: (context) => RandomImageBloc()..add(GetRandomImageEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.amber,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
