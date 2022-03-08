class AddressModal {
  String? _userId;
  String? _addId;
  String? _fullName;
  String? _addStreetNo;
  String? _addStreet;
  String? _addCity;
  String? _addState;
  String? _addCountry;
  String? _addPinCode;

  AddressModal(
      {String? userId,
        String? addId,
        String? fullName,
        String? addStreetNo,
        String? addStreet,
        String? addCity,
        String? addState,
        String? addCountry,
        String? addPinCode}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (addId != null) {
      this._addId = addId;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (addStreetNo != null) {
      this._addStreetNo = addStreetNo;
    }
    if (addStreet != null) {
      this._addStreet = addStreet;
    }
    if (addCity != null) {
      this._addCity = addCity;
    }
    if (addState != null) {
      this._addState = addState;
    }
    if (addCountry != null) {
      this._addCountry = addCountry;
    }
    if (addPinCode != null) {
      this._addPinCode = addPinCode;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get addId => _addId;
  set addId(String? addId) => _addId = addId;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get addStreetNo => _addStreetNo;
  set addStreetNo(String? addStreetNo) => _addStreetNo = addStreetNo;
  String? get addStreet => _addStreet;
  set addStreet(String? addStreet) => _addStreet = addStreet;
  String? get addCity => _addCity;
  set addCity(String? addCity) => _addCity = addCity;
  String? get addState => _addState;
  set addState(String? addState) => _addState = addState;
  String? get addCountry => _addCountry;
  set addCountry(String? addCountry) => _addCountry = addCountry;
  String? get addPinCode => _addPinCode;
  set addPinCode(String? addPinCode) => _addPinCode = addPinCode;

  AddressModal.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _addId = json['addId'];
    _fullName = json['fullName'];
    _addStreetNo = json['addStreetNo'];
    _addStreet = json['addStreet'];
    _addCity = json['addCity'];
    _addState = json['addState'];
    _addCountry = json['addCountry'];
    _addPinCode = json['addPinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['addId'] = this._addId;
    data['fullName'] = this._fullName;
    data['addStreetNo'] = this._addStreetNo;
    data['addStreet'] = this._addStreet;
    data['addCity'] = this._addCity;
    data['addState'] = this._addState;
    data['addCountry'] = this._addCountry;
    data['addPinCode'] = this._addPinCode;
    return data;
  }
}
