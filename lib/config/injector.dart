import 'package:di/di.dart';

import 'db_connection.dart';
import '../repository/user_repository.dart';
import '../repository/user_product_register_repository.dart';
import '../repository/user_ventas_repository.dart';
import '../repository/user_administrator_repository.dart';
import '../repository/product_repository.dart';
import '../repository/sale_repository.dart';
import '../repository/sale_product_repository.dart';
import '../repository/order_repository.dart';
import '../repository/client_repository.dart';
import '../repository/provider_repository.dart';


import '../service/user_service.dart';
import '../service/order_service.dart';
import '../service/user_product_register_service.dart';
import '../service/user_ventas_service.dart';
import '../service/user_administrator_service.dart';
import '../service/product_service.dart';
import '../service/sale_service.dart';
import '../service/sale_product_service.dart';
import '../service/client_service.dart';
import '../service/provider_service.dart';

import '../rest/user_rest.dart';
import '../rest/order_rest.dart';
import '../rest/user_product_register_rest.dart';
import '../rest/user_administrator_rest.dart';
import '../rest/hello_rest.dart';
import '../rest/user_ventas_rest.dart';
import '../rest/product_rest.dart';
import '../rest/sale_rest.dart';
import '../rest/sale_product_rest.dart';
import '../rest/client_rest.dart';
import '../rest/provider_rest.dart';
var injector = new ModuleInjector([new Module()

  ..bind(DbConnection)

// repositories
  ..bind(UserRepository)
  ..bind(User_Product_Register_Repository)
  ..bind(UserVentasRepository)
  ..bind(User_Administrator_Repository)
  ..bind(ProductRepository)
  ..bind(SaleRepository)
  ..bind(SaleProductRepository)
  ..bind(OrderRepository)
  ..bind(ProviderRepository)
  ..bind(ClientRepository)


// services
  ..bind(UserService)
  ..bind(User_Product_Register_Service)
  ..bind(UserVentasService)
  ..bind(User_Administrator_Service)
  ..bind(ProductService)
  ..bind(SaleService)
  ..bind(SaleProductService)
  ..bind(OrderService)
  ..bind(ProviderService)
  ..bind(ClientService)

// REST controllers
  ..bind(HelloRest)
  ..bind(UserRest)
  ..bind(User_Product_Register_Rest)
  ..bind(UserVentasRest)
  ..bind(User_Administrator_Rest)
  ..bind(ProductRest)
  ..bind(SaleRest)
  ..bind(SaleProductRest)
  ..bind(OrderRest)
  ..bind(ClientRest)
  ..bind(ProviderRest)
   
]);