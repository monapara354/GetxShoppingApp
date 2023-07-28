import 'package:get/get.dart';
import 'package:shopping_getx/model/product.dart';

class ProductItems extends GetxController {
  List<Product> items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 1000,
      imageUrl:
          'https://1.bp.blogspot.com/-YSAgWpOn1IA/U6FVuFCCGzI/AAAAAAAAA4g/ftSTdvtJS_Q/s1600/71KAJ6D8DyL._UL1500_.jpg',
      isfav: false,
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 2000,
      imageUrl:
          'https://th.bing.com/th/id/OIP.fyRnCGX91VmBqff5sG--7gHaHa?pid=ImgDet&rs=1',
      isfav: false,
    ),
    Product(
      id: 'p3',
      title: 'Men shirt',
      description: 'Men Camisa MAasculina Long',
      price: 1500,
      imageUrl:
          'https://th.bing.com/th/id/OIP.uc1A2zHyPaSqsb-u0Dl58gHaHa?pid=ImgDet&rs=1',
      isfav: false,
    ),
    Product(
      id: 'p4',
      title: 'Casual',
      description:
          'new fashion Casual Men Shirts Long Sleeve Autumn great Brand Cotton Slim High Quality shirt for men',
      price: 3000,
      imageUrl:
          'https://th.bing.com/th/id/R.4c0f0a88cc7f23a69e124f3b23dcbcd4?rik=HOPxtLy4uRrL4Q&riu=http%3a%2f%2fg01.a.alicdn.com%2fkf%2fHTB1I.zyIVXXXXXWXpXXq6xXFXXXs%2f2015-new-fashion-Casual-Men-Shirts-Long-Sleeve-Autumn-great-Brand-Cotton-Slim-High-Quality-shirt.jpg&ehk=RuAJcllW49xTju3JN%2b%2fyn9wGR9bHGMSRQ7Vc2JmAnzs%3d&risl=&pid=ImgRaw&r=0',
      isfav: false,
    ),
    Product(
      id: 'p5',
      title: 'Black shirt',
      description:
          'Get maximum comfort with the Emporio Armani Short Sleeved T-Shirt in Black.',
      price: 2000,
      imageUrl:
          'https://www.bigw.com.au/medias/sys_master/images/images/hbe/hd3/12939079221278.jpg',
      isfav: false,
    ),
    Product(
      id: 'p6',
      title: 'Men shirt',
      description: 'Men Regular Fit Polka Print Spread Collar Casual Shirt',
      price: 3000,
      imageUrl:
          'https://www.hirawatsonline.com/wp-content/uploads/2020/10/Shirts-2-1.jpg',
      isfav: false,
    ),
    Product(
      id: 'p7',
      title: 'cotton',
      description: 'Cottom Shirt High Quality Mens Casual',
      price: 2000,
      imageUrl:
          'https://th.bing.com/th/id/OIP.GNGsP6IPn7dM0KhMRQDVcwHaHa?pid=ImgDet&rs=1',
      isfav: false,
    ),
    Product(
      id: 'p8',
      title: 'Shirt',
      description: 'Mens Pink Long Sleeve Linen Shirt',
      price: 2500,
      imageUrl:
          'https://th.bing.com/th/id/OIP.OHWQr9NinmEAxUdBjt3aQQHaHq?pid=ImgDet&w=618&h=640&rs=1',
      isfav: false,
    )
  ];

  List<Product> get item {
    return [...items];
  }

  List<Product> fav = [];
  void aaa(String ids) {
    var ass = item.firstWhere((element) => element.id == ids);
    if (fav.contains(ass)) {
      fav.remove(ass);
    } else {
      fav.add(ass);
    }
    update();
    print(fav);
  }
}
