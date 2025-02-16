import 'package:xml/xml.dart';

// XMLヘルパー
class XmlHelper {
  // XML文字列を解析するメソッド
  static XmlDocument parse(String xmlString) {
    return XmlDocument.parse(xmlString);
  }

  // XMLドキュメントを文字列に変換するメソッド
  static String toXmlString(XmlDocument document) {
    return document.toXmlString(pretty: true);
  }
}