import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Widgets/Responsive_Button.dart';
import 'package:travel/Widgets/app_large_text.dart';
import 'package:travel/Widgets/app_text.dart';
import 'package:travel/misc/colors.dart';

import '../Widgets/Rate_Container.dart';
import '../cubit/app_states_cubit.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppStatesCubit, AppStatesState>(
        builder: (context, state) {
          if (state is DetailState) {
            var detail = state.place;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: double.maxFinite,
                          height: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${detail.img}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<AppStatesCubit>(context)
                                    .goHome();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LargeText(
                                text: detail.name,
                                size: 32,
                                color: Colors.black54,
                              ),
                              AppText(
                                text: "\$ ${detail.price.toString()}",
                                color: Colors.black45,
                                size: 22,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              AppText(
                                text: detail.location,
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  ((index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColors.starColor,
                                    );
                                  }),
                                ),
                              ),
                              AppText(
                                text: "(${detail.stars.toDouble()})",
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          LargeText(text: 'People'),
                          const SizedBox(
                            height: 8,
                          ),
                          AppText(
                            text: detail.people.toString(),
                            size: 14,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const RateStars(),
                          const SizedBox(
                            height: 10,
                          ),
                          LargeText(
                            text: 'Description',
                            size: 27,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(text: detail.description),
                          const SizedBox(height: 25),
                          const ResponsiveButton(
                            width: double.maxFinite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
