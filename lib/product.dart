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
    return this.price * this.quantity;
  }

  showTotal() {
    var tong = this.calulateTotal();
    //print("Tổng số tiền là: $tong");

    return tong;
  }
}
