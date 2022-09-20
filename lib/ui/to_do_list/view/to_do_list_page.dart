import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedita_learning2/app_settings/app_colors.dart';
import 'package:vedita_learning2/ui/to_do_list/bloc/to_do_list_bloc.dart';
import 'package:vedita_learning2/ui/to_do_list/view/to_do_list_header.dart';

class ToDoListPage extends StatelessWidget implements AutoRouteWrapper {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _BuildHeader(),
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ToDoListBloc>(
      create: (ctx) => ToDoListBloc(),
      child: this,
    );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      elevation: 15,
      shadowColor: AppColors.shadowColor,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AppColors.textAndIconColor,
          ),
          onPressed: () {},
        )
      ],
      flexibleSpace: const FlexibleSpaceBar(background: ToDoListHeader()),
    );
  }
}
