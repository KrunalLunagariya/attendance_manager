// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls
class DetailModel {
  String name;
  int age;
  String status;
  DetailModel({required this.name, required this.status, required this.age});

  @override
  String toString() {
    return '{name: ${name}, status:${status}, age: ${age}}';
  }
}
void main() {
  var listDetail = [
    DetailModel(
        name: "Krunal",
        status: "Flutter",
        age: 18),
    DetailModel(
        name: "Dharmik",
        status: "React",
        age: 19),
    DetailModel(
        name: "sahil",
        status: "node",
        age: 20),
    DetailModel(
        name: "SAhiL",
        status: "node",
        age: 20),
    DetailModel(
        name: "Bhavil",
        status: "React",
        age: 21)
  ];
  //**listDetail.reversed;
  //**listDetail.removeAt(2);
  //**final int index1 = listDetail.indexWhere(((DetailModel) =>  DetailModel.age== 21));
  //   print('$index1');
  //   print('Name: ${listDetail[index1].name}');
  //**listDetail.removeLast();
  //**listDetail.removeWhere((item) => item.name == 'sahil');
  //** all sahil are deleted ** listDetail.removeWhere((item) => item.name.toLowerCase() == 'sahil');
  //**listDetail.add(DetailModel(name: "Chirag", status: "Ui & Ux", age: 22));
  //**listDetail.insert(2,(DetailModel(name: "Chirag", status: "Ui & Ux", age: 22)));
  //**print(listDetail.getRange(0,3));
  listDetail.forEach((detailmodel) => print(detailmodel));
  //var contain = listDetail.where((element) =>element.name == "sahil");
  // var map = listDetail.map((e){
  //   return {
  //     "name": e.name,
  //     "status": e.status,
  //     "age": e.age,
  //   };
  // }).toList();
  // print(map.reversed);
}




































//print(Details.contains(4)); //*** check this element is in the array or not (ans:bool)
//var map=numbers.map((numbers) => 'This is $numbers'); //*** This is 1, This is 2, This is 3, This is 5, This is 6, This is 7
//var map1=numbers.map((numbers) => 2*numbers); //*** multiplication with 2 all array value
//print(map);
// numbers.sort(); //*** ascending order print
//print(listDetail.map((ele)=> print(ele)));
