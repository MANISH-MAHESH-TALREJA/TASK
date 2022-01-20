import 'package:flutter/material.dart';
import 'package:task/resources/app_context.dart';
import 'package:task/view/widget/loading_widget.dart';
import 'package:task/view/widget/custom_error_widget.dart';
import 'package:task/view/widget/custom_text_view.dart';
import 'package:provider/provider.dart';
import 'package:task/view_model/users_view_model.dart';
import '../../data/response/api_response.dart';
import '../../models/users_model.dart';
import '../app_config.dart';
import 'user_detail_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  final UsersViewModel viewModel = UsersViewModel();

  @override
  void initState()
  {
    viewModel.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    var config = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: CustomTextView(config?.appDisplayName/*context.resources.strings.homeScreen*/, context.resources.color.colorWhite, context.resources.dimension.bigText)),
        backgroundColor: config?.appColor,
      ),
      body: ChangeNotifierProvider<UsersViewModel>(
        create: (BuildContext context) => viewModel,
        child: Consumer<UsersViewModel>(builder: (context, viewModel, _)
        {
          switch (viewModel.users.status)
          {
            case Status.LOADING:
              return const LoadingWidget();
            case Status.ERROR:
              return CustomErrorWidget(viewModel.users.message ?? "NA");
            case Status.COMPLETED:
              return _getUsersListView(viewModel.users.data);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getUsersListView(List<UserModel>? usersList)
  {
    final _inputController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 12.0),
          child: TextFormField(
            controller: _inputController,
            decoration: InputDecoration(
                hintText: 'ENTER USER NAME...',
                border: const OutlineInputBorder(),
                labelText: 'SEARCH',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(Icons.search, size: 25),
                      onPressed: ()
                      {
                        _inputController.clear();
                      }),
                ),
                contentPadding: const EdgeInsets.only(right: 0, left: 10),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                        icon: const Icon(Icons.close, size: 15),
                        onPressed: () {
                          _inputController.clear();
                        }),
                  ),
                )
            ),
            onEditingComplete: ()
            {

            },
            onFieldSubmitted: (String value)
            {

            },
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: usersList?.length,
              itemBuilder: (context, position)
              {
                return _getUserListItem(usersList![position]);
              }),
        )
      ],
    );
  }

  Widget _getUserListItem(UserModel item)
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: ClipRRect(
            child: Image.asset(
              'assets/emoji.png',
              fit: BoxFit.fill,
              width: context.resources.dimension.listImageSize,
              height: context.resources.dimension.listImageSize,
            ),
            borderRadius: BorderRadius.circular(context.resources.dimension.imageBorderRadius),
          ),
          title: CustomTextView(item.name ?? "NA",context.resources.color.colorBlack,context.resources.dimension.bigText),
          subtitle: CustomTextView(item.email??"NA",context.resources.color.colorBlack,context.resources.dimension.mediumText),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children:
            [
              SizedBox(width: context.resources.dimension.verySmallMargin,),
              Icon(Icons.email,color: context.resources.color.colorAccent,),
            ],
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetailsScreen(item))),
        ),
        elevation: context.resources.dimension.lightElevation,
      ),
    );
  }
}
