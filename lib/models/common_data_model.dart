class CommonDM {
  final bool success;
  final String message;
  final int? code;
  final String? type;

  final dynamic _data;

  CommonDM(this.success, this.message, this.code, this._data, this.type);

  CommonDM.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        code = json['code'],
        type = json['type'],
        _data = json['data'];

  get data => _data;

  @override
  String toString() {
    return 'CommonDM{success: $success, message: $message, code: $code, type: $type, _customRequest: $_data}';
  }
}
