
String formatMoney(double amount) {
  if (amount >= 1000) {
    double amountInK = amount / 1000;
    if (amountInK == amountInK.floor()) {
      return '₹ ${amountInK.toInt()}K';
    } else {
      return '₹ ${amountInK.toStringAsFixed(1)}K';
    }
  } else {
    return '₹ ${amount.toStringAsFixed(2)}';
  }
}
