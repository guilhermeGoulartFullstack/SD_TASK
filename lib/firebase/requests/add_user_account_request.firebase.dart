class AddUserAccountRequest {
  String id;
  String nickname;

  AddUserAccountRequest({
    required this.id,
    required this.nickname,
  });
}

Map<String, dynamic> addUserAccountRequestToMap(AddUserAccountRequest request) {
  return {
    "id": request.id,
    "nickname": request.nickname,
  };
}
