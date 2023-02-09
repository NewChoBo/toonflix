class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(
      Map<String, dynamic> json) //title, thumb, id 등을 초기화하는 편리한 구문일 뿐
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
  //WebtoonModel title은 JSON의 title로 초기화되고...
}
