
abstract class LocaleUtils {
  static parseRateMessage(
    int rate,
    {required String message}
  ) {
    String text = message;
    text = text.replaceAll('[rate]', rate.toString());
    text = text.replaceAll('[total]', '5');
    return text;
  }
}