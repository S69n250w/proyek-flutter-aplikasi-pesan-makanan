import 'package:aplikasi_sederhana/utils/int_to_rupiah.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/model/food.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Food> cartItems;

  const CheckoutScreen({super.key, required this.cartItems});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPayment;

  double get subtotal =>
      widget.cartItems.fold(0, (sum, item) => sum + item.price * item.qty);
  double get tax => subtotal * 0.11; // 11%
  double get adminFee => subtotal * 0.05; // 5%
  double get shipmentFee => 5000.0;
  double get total => subtotal + tax + adminFee + shipmentFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Keranjang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle("Ringkasan Pesanan"),
            const Divider(thickness: 1.5),
            _buildCartList(),
            const Divider(thickness: 1.5),
            _buildPriceRow("Total keseluruhan", subtotal.toInt()),
            _buildPriceRow("Pajak (11%)", tax.toInt()),
            _buildPriceRow("Biaya pemesanan (5%)", adminFee.toInt()),
            _buildPriceRow("Biaya pengiriman", shipmentFee.toInt()),
            const SizedBox(height: 16),
            _buildNotice(
                "Pastikan untuk memeriksa ulang pesanan Anda sebelum mengonfirmasi!"),
            const Divider(thickness: 1.5),
            _buildLocationRow(),
            const Divider(thickness: 1.5),
            _buildPaymentRow(),
            const Divider(thickness: 1.5),
            _buildCouponRow(),
            const Divider(thickness: 1.5),
            _buildPriceRow("Total", total.toInt(), isBold: true),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  // Handle order confirmation here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pesanan akan diproses..."))
                  );
                },
                child: const Text(
                  "Pesan Sekarang",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        final item = widget.cartItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  item.imageUrl,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(formatToRupiah(item.price)),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(99.0),
                        border: Border.all(color: Colors.orange, width: 1.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3))
                        ]),
                    width: 36,
                    height: 36,
                    child: Text("${item.qty}"),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildPriceRow(String label, int value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(formatToRupiah(value),
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal))
      ],
    );
  }

  Widget _buildNotice(String message) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        message,
        style: TextStyle(
            color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 14),
      ),
    );
  }

  Widget _buildLocationRow() {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.red[400],
          size: 32,
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lokasi", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Atur lokasi Anda", style: TextStyle(fontStyle: FontStyle.italic))
          ],
        )
      ],
    );
  }

  Widget _buildPaymentRow() {
    return Row(
      children: [
        Icon(
          Icons.credit_card,
          color: Colors.green[400],
          size: 32,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButton<String>(
            value: selectedPayment,
            hint: const Text("Pilih metode pembayaran"),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                  value: "credit_card", child: Text("Credit Card")),
              DropdownMenuItem(
                  value: "cash", child: Text("Cash on Delivery")),
              DropdownMenuItem(value: "paypal", child: Text("Paypal"))
            ],
            onChanged: (value) {
              setState(() {
                selectedPayment = value;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _buildCouponRow() {
    return Row(
      children: [
        Icon(
          Icons.local_offer,
          color: Colors.blue[400],
          size: 32,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              focusColor: Colors.orange,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.orange, width: 1),
              ),
              hintText: "Masukan kode kupon",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.orange, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
