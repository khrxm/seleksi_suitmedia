import 'package:flutter/material.dart';
import 'package:seleksi_suitmedia/models/my_model.dart';
import 'package:seleksi_suitmedia/utils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seleksi_suitmedia/view_models/bloc/user_bloc.dart';

import 'package:seleksi_suitmedia/view_models/user_view_model.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    int page = 1;
    bool refresh = false;

    fecthUsers(int page) {
      BlocProvider.of<UserBloc>(context).add(GetUser(page: page));
    }

    void initState() {
      super.initState();
      fecthUsers(page);
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Constant.darkColor,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Third Screen',
            style: TextStyle(
                color: Constant.darkColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  refresh = !refresh;
                });
              },
            ),
          ],
          backgroundColor: Constant.whiteColor,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoaded) {
              List<MyModel> users = state.users;
              return RefreshIndicator(
                onRefresh: () async {
                  fecthUsers(page);
                },
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Constant.darkColor,
                            ),
                          ),
                          const Text(
                            'nama',
                            style: TextStyle(
                              fontSize: 18,
                              color: Constant.darkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          users[index].avatar.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        users[index].firstName.toString() +
                                            " " +
                                            users[index].lastName.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Constant.darkColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        users[index].email.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Constant.darkColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is UserError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ));
  }
}
