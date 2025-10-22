<?php namespace App\Models;

use CodeIgniter\Model;

class OrderItemModel extends Model
{
    protected $table         = 'order_items';
    protected $primaryKey    = 'id';
    protected $allowedFields = ['order_id', 'product_id', 'qty', 'price'];

    // Ambil item sebuah order lengkap dengan info produk
    public function itemsWithProductByOrder($orderId)
    {
        return $this->select('order_items.id, order_items.order_id, order_items.product_id, order_items.qty, order_items.price,
                              products.sku, products.name as product_name')
                    ->join('products', 'products.id = order_items.product_id')
                    ->where('order_items.order_id', $orderId)
                    ->findAll();
    }
}
