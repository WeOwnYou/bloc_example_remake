import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vedita_learning2/app_settings/app_colors.dart';
import 'package:vedita_learning2/navigation/router.dart';
import 'package:vedita_learning2/ui/to_do_list/bloc/to_do_list_bloc.dart';

class ToDoListHeader extends StatelessWidget {
  const ToDoListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Spacer(),
        _BuildHeader(),
      ],
    );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final month = context.read<ToDoListBloc>().state.month;
    final year = context.read<ToDoListBloc>().state.year;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.072, vertical: 20),
      child: SizedBox(
        height: height * 0.052,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                '$month, $year',
                style:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 100),
              ),
            ),
            AspectRatio(
              aspectRatio: 171 / 70,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75),),
                  gradient: AppColors.gradient,
                ),
                child: MaterialButton(
                  height: double.infinity,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),
                  child: FittedBox(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add task',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: (){
                    AppRouter.instance().push(const AddTaskRoute());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

