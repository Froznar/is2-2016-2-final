import 'dart:async';
import 'package:postgresql/postgresql.dart' as pg;
import '../config/db_connection.dart';
import '../model/sale_product.dart';

class SaleProductRepository{
    DbConnection connection;
    SaleProductRepository(this.connection);
    Future<SaleProduct> find(int id) async {
        return (await connection.query('select * from sale_product where id_sale_product = @id;', {'id': id})).map(mapRowToSaleProduct).first;
    }

    Future<List<SaleProduct>> findAll () async {
        return (await connection.query('select * from sale_product;')).map(mapRowToSaleProduct).toList();
    }

    Future<List<SaleProduct>> findByIdSale (int id_sale) async {//obtener todas las sales_product de una venta
        List<SaleProduct> list = (await connection.query('select * from sale_product where id_sale = @id_sale;', {'id_sale': id_sale})).map(mapRowToSaleProduct).toList();
        return list;
    }

    Future<List<SaleProduct>> findByIdProduct (int id_product) async {//obtener todas las sales_product de una venta
        List<SaleProduct> list = (await connection.query('select * from sale_product where id_product = @id_product;', {'id_product': id_product})).map(mapRowToSaleProduct).toList();
        return list;
    }

    Future<SaleProduct> findByIdSaleAndIdProduct (int id_sale, int id_product) async {//buscar unregistro por id_ sale e id_product
        return (await connection.query('select * from sale_product where id_sale = @id_sale and id_product = @id_product;', {'id_sale': id_sale, 'id_product': id_product})).map(mapRowToSaleProduct).first;
    }

    Future<SaleProduct> registerSaleProduct(String id_sale, String id_product, String cantidadS, String price_unitS) async{
        int cantidad=int.parse(cantidadS);
        double price_unit = double.parse(price_unitS);
        await connection.query('insert into sale_product (id_sale, id_product, cantidad, precio_unidad) values (@id_sale, @id_product, @cantidad, @precio_unidad)', {'id_sale':id_sale,'id_product':id_product ,'cantidad':cantidad, 'precio_unidad':price_unit});
        return findByIdSaleAndIdProduct(int.parse(id_sale), int.parse(id_product));
    }

    SaleProduct mapRowToSaleProduct(pg.Row row){
        return new SaleProduct()
            ..id_sale_product = row.id_sale_product
            ..id_sale = row.id_sale
            ..id_product = row.id_product
            ..cantidad = row.cantidad
            ..priceUnit = double.parse(row.precio_unidad);
    }
}
