import 'package:baitap08/config/size_config.dart';
import 'package:baitap08/model/movie.dart';
import 'package:baitap08/provider/movie_provider.dart';
import 'package:baitap08/screen/detail/widget/category_widget.dart';
import 'package:baitap08/screen/tab_screen/tab_screen.dart';
import 'package:baitap08/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.id, super.key});
  int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeApp.themeApp.textTheme;
    int currentIndex = 0;
    List type = [
      "About Movie",
    ];
    return Scaffold(
      body: FutureBuilder(
          future: context.read<MovieProvider>().getMovieDetail(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("No data"),
              );
            } else {
              Movie? data = snapshot.data;
              List<IconData> icon = [
                FontAwesomeIcons.calendar,
                FontAwesomeIcons.clock,
                FontAwesomeIcons.ticket,
              ];
              List<String> info = [
                data!.releaseDate,
                "${data.runTime.toString()} Minutes",
                data.genres,
              ];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    spaceHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_return,
                            size: 20,
                          ),
                          color: Colors.white,
                        ),
                        Text(
                          "Search",
                          style: textTheme.titleLarge,
                        ),
                        const Icon(
                          Icons.info_rounded,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                    spaceHeight(context),
                    SizedBox(
                      height: getHeight(context, height: 0.45),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: getHeight(context, height: 0.3),
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                            child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              placeholder: kTransparentImage,
                              image:
                                  "https://image.tmdb.org/t/p/w500/${data.backdrop}",
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.network(
                                      "https://static.thenounproject.com/png/504708-200.png"),
                            ),
                          ),
                          Positioned(
                            left: getWidth(context),
                            bottom: getHeight(context),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: getHeight(context, height: 0.25),
                              width: getWidth(context, width: 0.3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow),
                              child: FadeInImage.memoryNetwork(
                                fit: BoxFit.cover,
                                placeholder: kTransparentImage,
                                image:
                                    "https://image.tmdb.org/t/p/w500/${data.posterPath}",
                                imageErrorBuilder: (context, error,
                                        stackTrace) =>
                                    Image.network(
                                        "https://static.thenounproject.com/png/504708-200.png"),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 15,
                              child: SizedBox(
                                height: getHeight(context, height: 0.1),
                                width: getWidth(context, width: 0.6),
                                child: Text(
                                  data.title,
                                  style: textTheme.titleLarge,
                                ),
                              )),
                          Positioned(
                              right: getWidth(context),
                              bottom: getHeight(context, height: 0.17),
                              child: Container(
                                height: getHeight(context, height: 0.05),
                                width: getWidth(context, width: 0.2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff252836)
                                        .withOpacity(0.8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/img/detail/Star.png")),
                                    Text(
                                      data.voteRate.toString(),
                                      style: const TextStyle(
                                          color: Color(0xffFF8700)),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          height: getHeight(context),
                          width: getWidth(context, width: 0.8),
                          child: ListView.separated(
                            itemBuilder: (context, index) => SizedBox(
                              width: getWidth(context, width: 0.25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    icon[index],
                                    color: const Color(0xff92929D),
                                  ),
                                  Text(
                                    info[index],
                                    style: const TextStyle(
                                        color: Color(0xff92929D)),
                                  )
                                ],
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const VerticalDivider(
                              color: Color(0xff92929D),
                            ),
                            itemCount: 3,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          )),
                    ),
                    spaceHeight(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: getHeight(context, height: 0.75),
                        child: DefaultTabController(
                            initialIndex: 0,
                            length: type.length, // Number of tabs
                            child: Scaffold(
                              body: Column(
                                children: [
                                  TabBar(
                                    indicatorColor: const Color(0xff3A3F47),
                                    indicatorWeight: 4.0,
                                    unselectedLabelStyle: textTheme.titleMedium,
                                    labelStyle: textTheme.titleSmall,
                                    isScrollable: true,
                                    tabs: type
                                        .map((tab) => Tab(text: tab))
                                        .toList(),
                                    onTap: (index) {
                                      setState(() {
                                        currentIndex =
                                            index; // Update the current tab index
                                      });
                                    },
                                  ),
                                  spaceHeight(context),
                                  DetailTab(
                                    movie: data,
                                  )
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
