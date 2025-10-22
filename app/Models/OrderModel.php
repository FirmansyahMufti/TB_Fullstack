<?php namespace App\Models;

use CodeIgniter\Model;

class OrderModel extends Model
{
    protected $table         = 'orders';
    protected $primaryKey    = 'id';
    protected $allowedFields = ['code','order_date','customer_name','status'];

    public function findHeader($id)
    {
        return $this->select('id, code, order_date, customer_name, status')->find($id);
    }
}
