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
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context).data;
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
            future: ReqresAPI().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          int? id = snapshot.data?.data?[index].id;
                          Navigator.pop(
                              context, id);
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
          )
          // ListView.separated(
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: CircleAvatar(
          //           radius: 25,
          //           backgroundColor: Colors.blue,
          //           child: Text('A'),
          //         ),
          //         title: Text(
          //             '${userViewModel!.data![index].firstName + userViewModel!.data[index].lastName!}'),
          //         subtitle: Text('Email'),
          //       );
          //     },
          //     separatorBuilder: (context, index) {
          //       return Divider(
          //         height: 5,
          //         color: Colors.grey,
          //       );
          //     },
          //     itemCount: userViewModel.data!.tot al!),
          ),
    );
  }
}
