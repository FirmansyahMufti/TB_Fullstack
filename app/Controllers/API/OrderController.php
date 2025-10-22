<?php namespace App\Controllers\Api;

use CodeIgniter\RESTful\ResourceController;
use App\Models\OrderModel;
use App\Models\OrderItemModel;

class OrderController extends ResourceController
{
    protected $format = 'json';

    public function show($id = null)
    {
        $orderM = new OrderModel();
        $itemM  = new OrderItemModel();

        $header = $orderM->findHeader($id);
        if (!$header) {
            return $this->failNotFound('Order tidak ditemukan');
        }

        $items = $itemM->itemsWithProductByOrder($id);

        // Hitung total
        $total = array_reduce($items, fn($c,$r)=> $c + ($r['qty'] * $r['price']), 0);

        return $this->respond([
            'order' => $header,
            'items' => $items,
            'summary' => [
                'item_count' => count($items),
                'grand_total'=> (float) $total
            ]
        ]);
    }
}
