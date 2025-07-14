part of '../index.dart';

class RecentOrdersList {
  static List<RecentOrder> recentOrders() {
    return [
      RecentOrder(
        id: '#1001',
        customer: 'John Doe',
        product: 'iPhone 15 Pro',
        amount: '\$999',
        status: 'completed',
        time: '2 min ago',
        avatar: 'JD',
      ),
      RecentOrder(
        id: '#1002',
        customer: 'Sarah Smith',
        product: 'Samsung Galaxy',
        amount: '\$799',
        status: 'pending',
        time: '5 min ago',
        avatar: 'SS',
      ),
      RecentOrder(
        id: '#1003',
        customer: 'Mike Johnson',
        product: 'MacBook Pro',
        amount: '\$1,299',
        status: 'processing',
        time: '10 min ago',
        avatar: 'MJ',
      ),
      RecentOrder(
        id: '#1004',
        customer: 'Emily Brown',
        product: 'AirPods Pro',
        amount: '\$249',
        status: 'completed',
        time: '15 min ago',
        avatar: 'EB',
      ),
      RecentOrder(
        id: '#1005',
        customer: 'David Wilson',
        product: 'iPad Air',
        amount: '\$599',
        status: 'pending',
        time: '20 min ago',
        avatar: 'DW',
      ),
    ];
  }
}
