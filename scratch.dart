void main() {
  void sayHello({age = 2, required String name}) {
    print("Hello to $name");
  }

  sayHello(age: 12, name: "Yash");
}
