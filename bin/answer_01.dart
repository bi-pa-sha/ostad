main(){
  triangle(10.0, 5.0);
}
double triangle(double base, double height) {
  double area = 0.5*base*height;
  print("Triangle area: $area");
  return area;
}