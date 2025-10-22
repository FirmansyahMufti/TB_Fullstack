<?php namespace App\Controllers\Api;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\ResponseInterface;

class SalesController extends Controller
{
    public function summary()
    {
        $start = $this->request->getGet('start');
        $end   = $this->request->getGet('end');

        if (!$start || !$end) {
            return $this->response->setStatusCode(ResponseInterface::HTTP_BAD_REQUEST)
                                  ->setJSON(['error'=>'Param start & end wajib']);
        }

        $db = \Config\Database::connect();
        $builder = $db->table('order_items oi')
            ->select('p.id as product_id, p.sku, p.name as product_name,
                      SUM(oi.qty) as total_qty,
                      SUM(oi.qty * oi.price) as total_amount')
            ->join('orders o', 'o.id = oi.order_id')
            ->join('products p', 'p.id = oi.product_id')
            ->where('o.order_date >=', $start)
            ->where('o.order_date <=', $end)
            ->groupBy('p.id, p.sku, p.name')
            ->orderBy('total_amount', 'DESC');

        // Optional filter status
        if ($status = $this->request->getGet('status')) {
            $builder->where('o.status', $status);
        }

        $rows = $builder->get()->getResultArray();

        return $this->response->setJSON([
            'period' => ['start'=>$start,'end'=>$end],
            'count'  => count($rows),
            'data'   => $rows
        ]);
    }
}
