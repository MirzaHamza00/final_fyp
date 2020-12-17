const GOOGLe_API_KEY = "AIzaSyB-Q6pu_qxP9eSxrFxoLn0WK_k4dXVwcHk";

class LocationHepler {
  static String previewImage(String city) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$city,Pakistan&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$city&key=AIzaSyB-Q6pu_qxP9eSxrFxoLn0WK_k4dXVwcHk';
  }
}
