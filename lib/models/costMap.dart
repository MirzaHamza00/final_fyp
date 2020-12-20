class LocationHepler {
  static String previewImage(String source, String dest) {
    if (source != null || dest != null) {
      return 'https://maps.googleapis.com/maps/api/staticmap?size=400x200&scale=2&key=AIzaSyB-Q6pu_qxP9eSxrFxoLn0WK_k4dXVwcHk&path=color:0x0000ff|weight:5|&markers=color:green|label:S|$source%20,%20Pakistan&markers=label:D|$dest%20,%20Pakistan';
    } else {
      return null;
    }
  }
}
