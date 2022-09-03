import 'package:carousel_slider/carousel_slider.dart';
import 'package:events_app/app/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: customBar(context),
        body: Consumer<EventProvider>(
          builder: (context, eventProvider, child) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                advert(context: context, eventProvider: eventProvider),
                package(context: context, eventProvider: eventProvider),
                section(context: context, eventProvider: eventProvider),
              ],
            );
          },
        ),
        bottomNavigationBar: customBottomBar(EventProvider()),
      ),

      // ),
    );
  }

// Custom AppBar
  PreferredSizeWidget customBar(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: Colors.black,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/img_events_logo.png",
              width: 85,
              height: 95,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 240,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "What are you looking for?",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  "assets/search.png",
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // borderSide:
                              //     const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // borderSide:
                              //     const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/more_menu.png",
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/smile.png",
                        width: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Hello Rebutia!",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/track.svg"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Cart",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Image.asset(
                              "assets/cart.png",
                              height: 20,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                          fixedSize: const Size(80, 35),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      preferredSize: const Size.fromHeight(120),
    );
  }

// Advertisement Banners
  advert(
      {required BuildContext context, required EventProvider eventProvider}) {
    return eventProvider.loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : eventProvider.advert.isNotEmpty
            ? CarouselSlider.builder(
                itemCount: eventProvider.advert.length,
                itemBuilder: (context, index, rIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: eventProvider.advert[index].imageUrl.isNotEmpty
                        ? Stack(
                            children: [
                              Image.network(
                                index == 3
                                    ? eventProvider.advert[index].thumbnailUrl
                                    : eventProvider.advert[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                        ),
                                        Text(
                                          eventProvider.advert[index].rating
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text(
                              "No Image Found",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 2 / 1,
                  viewportFraction: 0.8,
                ),
              )
            : const Center(
                child: Text(
                  "No data",
                  style: TextStyle(color: Colors.white),
                ),
              );
  }

//Love Package
  package(
      {required BuildContext context, required EventProvider eventProvider}) {
    return eventProvider.loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : eventProvider.package.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width - 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: eventProvider.package.length,
                  itemBuilder: (context, listIndex) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width: 350,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Love Package",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.2,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: GridView.builder(
                                            // padding: const EdgeInsets.all(10),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 0,
                                              mainAxisSpacing: 0,
                                            ),
                                            itemCount: eventProvider
                                                .package[listIndex]
                                                .products
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: Image.network(
                                                    eventProvider
                                                        .package[listIndex]
                                                        .products[index]
                                                        .product
                                                        .bannerImageUrl,
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.height / 5,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[400]!,
                                    blurRadius: 1.5,
                                    spreadRadius: 1.0,
                                    offset: const Offset(-2, 2),
                                  ),
                                ],
                              ),
                              child: GridView.builder(
                                primary: false,
                                padding: const EdgeInsets.all(5.0),
                                physics: const BouncingScrollPhysics(),
                                itemCount: eventProvider.package.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 5,
                                  // mainAxisExtent: 5,
                                  childAspectRatio: 2 / 1.6,
                                ),
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    eventProvider.package[index].headerImageUrl,
                                    // height: 50,
                                    // width: 50,
                                    fit: BoxFit.contain,
                                  );
                                },
                              ),
                            ),
                            const Spacer(),
                            Text(
                              eventProvider.package[listIndex].name,
                              style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: Text(
                  "No data",
                  style: TextStyle(color: Colors.white),
                ),
              );
  }

// Catogory section
  section(
      {required BuildContext context, required EventProvider eventProvider}) {
    return eventProvider.loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : eventProvider.section.isNotEmpty
            ? Container(
                // padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width - 5,
                child: GridView.builder(
                  itemCount: eventProvider.section.length,
                  padding: const EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      // height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            blurRadius: 1.5,
                            spreadRadius: 1.0,
                            offset: const Offset(-2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            eventProvider.section[index].imageUrl,
                            width: index == 9 ? 50 : 95,
                            fit: BoxFit.contain,
                            // loadingBuilder:
                            //     (context, child, image) =>
                            //         const Center(
                            //   child: CircularProgressIndicator(),
                            // ),
                          ),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  eventProvider.section[index].title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: Text(
                  "No data",
                  style: TextStyle(color: Colors.white),
                ),
              );
  }

// Custom Bottom Navigation Bar
  customBottomBar(EventProvider eventProvider) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        // currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: eventProvider.onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
