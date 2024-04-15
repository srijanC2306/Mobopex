

class Sizing {
  double iconSmall, iconMedium, iconLarge;
  double buttonSmall, buttonMedium, buttonLarge;
  double textSmall, textMedium, textLarge, textXLarge;
  double paddingSmall, paddingMedium, paddingLarge;
  double cardWidth, cardHeight;
  double dialogWidth, dialogHeight;

  Sizing({
    this.iconSmall = 16.0,
    this.iconMedium = 24.0,
    this.iconLarge = 32.0,
    this.buttonSmall = 40.0,
    this.buttonMedium = 48.0,
    this.buttonLarge = 56.0,
    this.textSmall = 12.0,
    this.textMedium = 14.0,
    this.textLarge = 16.0,
    this.textXLarge = 20.0,
    this.paddingSmall = 8.0,
    this.paddingMedium = 16.0,
    this.paddingLarge = 24.0,
    this.cardWidth = 250.0,
    this.cardHeight = 350.0,
    this.dialogWidth = 300.0,
    this.dialogHeight = 200.0,
  });

  void scale(double scaleFactor) {
    iconSmall *= scaleFactor;
    iconMedium *= scaleFactor;
    iconLarge *= scaleFactor;
    buttonSmall *= scaleFactor;
    buttonMedium *= scaleFactor;
    buttonLarge *= scaleFactor;
    textSmall *= scaleFactor;
    textMedium *= scaleFactor;
    textLarge *= scaleFactor;
    textXLarge *= scaleFactor;
    paddingSmall *= scaleFactor;
    paddingMedium *= scaleFactor;
    paddingLarge *= scaleFactor;
    cardWidth *= scaleFactor;
    cardHeight *= scaleFactor;
    dialogWidth *= scaleFactor;
    dialogHeight *= scaleFactor;
  }
}
