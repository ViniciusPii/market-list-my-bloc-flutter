import 'package:flutter/material.dart';
import 'package:market_list_my_bloc/src/core/infra/bloc.dart';

class BlocBuilder<B extends Bloc, S extends Object> extends StatelessWidget {
  const BlocBuilder({
    Key? key,
    required this.bloc,
    required this.builder,
  }) : super(key: key);

  final B bloc;
  final Widget Function(BuildContext contex, S state) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      stream: bloc.stream as Stream<S>,
      initialData: bloc.initialValue as S,
      builder: (context, snapshot) {
        return builder(context, snapshot.data!);
      },
    );
  }
}
