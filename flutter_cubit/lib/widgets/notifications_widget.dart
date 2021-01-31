import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/constants/colors.dart';
import 'package:flutter_cubit/constants/edges.dart';
import 'package:flutter_cubit/constants/text_styles.dart';
import 'package:flutter_cubit/cubits/notifications/notifications_cubit.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(),
      child: Container(
        child: Padding(
          padding: Edges.small,
          child: BlocConsumer<NotificationsCubit, int>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              return Badge(
                badgeColor: kAccentColor,
                position: BadgePosition.topEnd(top: -2, end: 2),
                animationDuration: Duration(milliseconds: 200),
                animationType: BadgeAnimationType.scale,
                padding: const EdgeInsets.all(5),
                elevation: 5,
                badgeContent: Text(
                  state.toString(),
                  style: TextStyles.small.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () => print('notifications'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
