import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:seleksi_suitmedia/models/my_model.dart';
import 'package:seleksi_suitmedia/services/my_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MyService _myService;

  UserBloc(this._myService) : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<GetUser>((event, emit) async {
      try {
        emit(UserLoading());
        final Map<String, dynamic> result =
            await _myService.getUsers(page: event.page);

        if (event.page > 1) {
          emit(UserLoaded(users: [...result['users']]));
        } else {
          emit(UserLoaded(users: result['users']));
        }
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}



// class UserViewModel with ChangeNotifier{
//   List<MyModel> _users = [];
//   int _totalPage = 0;
//   bool _loading = true;

//   List<MyModel> get users => _users;
//   int get totalPage => _totalPage;
//   bool get loading => _loading;

//   set users(List<MyModel> users){
//     _users = users;
//     notifyListeners();
//   }

//   set totalPage(int totalPage){
//     _totalPage = totalPage;
//     notifyListeners();
//   }

//   set loading(bool loading){
//     _loading = loading;
//     notifyListeners();
//   }

//   Future<void> getUsers({int page = 1}) async {
//     try {
//       loading = false;
//       final Map<String, dynamic> result = await MyService().getUsers(page: page);

//       if (page > 1) {
//         users = [...users, ...result['users']];
//       } else {
//         users = result['users'];
//       }
//       totalPage = result['total_pages'];
   
//     } catch (e) {
//       loading = false;
//       print(e);
//     }
//   }
// }
