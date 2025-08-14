import 'package:nectar_ui/features/home/models/product_model.dart';

class ProductService {
  static void addToCart(
    Product addedProduct,
    List<Product> list,
    List<int> itemcount,
  ) {
    int pos = -1;
    for (int i = 0; i < list.length; i++) {
      if (addedProduct == list[i]) {
        pos = i;
        break;
      }
    }
    if (pos == -1) {
      list.add(addedProduct);
      itemcount.add(1);
    } else {
      itemcount[pos] += 1;
    }
  }

  static void minusProduct(
    Product addedProduct,
    List<Product> list,
    List<int> itemcount,
  ) {
    int pos = -1;
    for (int i = 0; i < list.length; i++) {
      if (addedProduct == list[i]) {
        pos = i;
        break;
      }
    }
    if (itemcount[pos] > 1) {
      itemcount[pos] -= 1;
    }
  }

  static double totalPrice(List<Product> list, List<int> itemcount) {
    double sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += (double.parse(list[i].price.replaceAll('\$', '')) * itemcount[i]);
    }
    return sum;
  }
}
