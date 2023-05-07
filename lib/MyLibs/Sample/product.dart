class Product {
  //Khai báo các thuộc tính
  late String manufacture = '';
  late String name = '';
  late int price;
  late int quantity;

  //Khai báo hàm khởi tạo
  Product(var this.price, {this.quantity = 0});

  //Khai báo các phương thức
  calulateTotal() {
    return price * quantity;
  }

  showTotal() {
    var tong = calulateTotal();
    //print("Tổng số tiền là: $tong");

    return tong;
  }
}
