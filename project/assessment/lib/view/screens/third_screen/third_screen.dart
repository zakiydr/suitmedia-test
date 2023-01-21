import 'package:assessment/service/api_service.dart';
import 'package:assessment/view/styles/styles.dart';
import 'package:assessment/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final scrollController = ScrollController();
  int page = 1;
  int? totalPages;
  bool isLoading = false;

  @override
  void initState() {
    scrollController.addListener(
      () {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          if (page < totalPages!) {
            page++;
            ReqresAPI().fetchData(page);
          }
        }
      },
    );
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      page++;
      ReqresAPI().fetchData(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    int? perPage = userViewModel.data?.perPage;
    int? totalPages = userViewModel.data?.totalPages;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: FutureBuilder(
          future: ReqresAPI().fetchData(page),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  shrinkWrap: false,
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        int id = snapshot.data!.data![index].id ?? 6;
                        userViewModel.getDataById(id);
                        Navigator.pop(context);
                      },
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(
                            '${snapshot.data!.data![index].avatar}'),
                        radius: 25,
                        backgroundColor: Colors.blue,
                      ),
                      title: Text(
                          '${snapshot.data!.data![index].firstName} ${snapshot.data!.data![index].lastName}'),
                      subtitle: Text('${snapshot.data!.data![index].email}'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 5,
                      color: Colors.grey,
                    );
                  },
                  itemCount: snapshot.data!.data!.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
