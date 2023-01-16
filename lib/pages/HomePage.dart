// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Services/Data_Services.dart';

import 'package:travel/Widgets/app_large_text.dart';
import 'package:travel/Widgets/app_text.dart';
import 'package:travel/cubit/app_states_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var Images = {
    "img/hiking.png": "Hiking",
    "img/balloning.png": "Balloning",
    "img/kayaking.png": "Kayaking",
    "img/snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    final navBloc = AppStatesCubit(data: DataServices());
    TabController tabcontroller = TabController(length: 6, vsync: this);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: BlocBuilder<AppStatesCubit, AppStatesState>(
            builder: (context, state) {
              if (state is LoadedState) {
                var place = state.places;
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(text: 'Discover'),
                      TabBar(
                        controller: tabcontroller,
                        labelColor: Colors.black,
                        padding: const EdgeInsets.only(top: 12),
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Inspiration",
                          ),
                          Tab(
                            text: "Emotions",
                          ),
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Places",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: TabBarView(
                          controller: tabcontroller,
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 15,
                              ),
                              padding: const EdgeInsets.only(top: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: place.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AppStatesCubit>(context)
                                        .detailPage(place[index]);
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "http://mark.bslmeiyu.com/uploads/${place[index].img}"),
                                        )),
                                  ),
                                );
                              },
                            ),
                            const Text('Hello'),
                            const Text(
                              'Hola',
                            ),
                            const Text('Hi'),
                            const Text('Hello'),
                            const Text(
                              'Hola',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeText(
                            text: 'Explore More',
                            size: 22,
                          ),
                          AppText(text: "See all")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            Images.keys.elementAt(index)),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  AppText(text: Images.values.elementAt(index))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              } // var info = child.places;
            },
          )),
    );
  }
}
