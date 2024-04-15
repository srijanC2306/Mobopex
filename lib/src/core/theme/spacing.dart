class Spacing {
  double s0 , s1, s2, s3, s4, s5, s6, s7, s8 , s9;

  Spacing({
    this.s0 = 2.0 ,
    this.s1 = 4.0,
    this.s2 = 8.0,
    this.s3 = 12.0,
    this.s4 = 16.0,
    this.s5 = 20.0,
    this.s6 = 24.0,
    this.s7 = 28.0,
    this.s8 = 32.0,
    this.s9 = 36.0,
  });

  void scale(double scaleFactor) {
    s0 *=scaleFactor ;
    s1 *= scaleFactor;
    s2 *= scaleFactor;
    s3 *= scaleFactor;
    s4 *= scaleFactor;
    s5 *= scaleFactor;
    s6 *= scaleFactor;
    s7 *= scaleFactor;
    s8 *= scaleFactor;
    s9 *= scaleFactor;
  }
}


