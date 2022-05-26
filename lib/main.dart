import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_provider/api_services.dart';
import 'model/user_data/users_data_response.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Contacts()),
      ],
      child: MaterialApp(
        title: "User List",
        home: UsersDetails(title:"User List"),
      ),
    );
  }
}

class UsersDetails extends StatefulWidget {
  const UsersDetails({Key? key,this.title}) : super(key: key);
  final String? title;

  @override
  _UsersDetailsState createState() => _UsersDetailsState();
}

class _UsersDetailsState extends State<UsersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<Contacts>(context,listen: false).fetchUsersData(),
        child: FutureBuilder(
          future: Provider.of<Contacts>(context,listen: false).fetchUsersData(),
          builder: (BuildContext context, snapshot){
            /*if(snapshot.hasData){
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (BuildContext context,int index ){
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(snapshot.data!.results![index].picture!.large!)),
                              title: Text((snapshot.data!.results![index].name!.first!)),
                              subtitle: Text((snapshot.data!.results![index].location!.city!)),
                              trailing: Text((snapshot.data!.results![index].dob!.age!.toString())),
                            ),
                        ],
                      ),
                    );
                  }
              );
            }
            else if (snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
             else{
              return Center(child: CircularProgressIndicator());
            }*/
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if(snapshot.error != null) {
                return Center(child: Text('Error: ${snapshot.error}'),);
              } else {
                return Consumer<Contacts>(
                  builder: (context, data, child) => ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: data.loadedData.results!.length,
                      itemBuilder: (BuildContext context,int index ){
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(data.loadedData.results![index].picture!.large!)),
                                title: Text((data.loadedData.results![index].name!.first!)),
                                subtitle: Text((data.loadedData.results![index].location!.city!)),
                                trailing: Text((data.loadedData.results![index].dob!.age!.toString())),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                );
              }
            }
          }
        ),
      ),
    );
  }
}

