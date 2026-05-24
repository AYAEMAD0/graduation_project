class CountryCodeModel {
  final String name;
  final String code;
  final String flag;

  const CountryCodeModel({
    required this.name,
    required this.code,
    required this.flag,
  });
}

const List<CountryCodeModel> countryCodes = [
  CountryCodeModel(name: "Egypt", code: "+20", flag: "🇪🇬"),
  CountryCodeModel(name: "Saudi Arabia", code: "+966", flag: "🇸🇦"),
  CountryCodeModel(name: "UAE", code: "+971", flag: "🇦🇪"),
  CountryCodeModel(name: "Kuwait", code: "+965", flag: "🇰🇼"),
  CountryCodeModel(name: "Qatar", code: "+974", flag: "🇶🇦"),
  CountryCodeModel(name: "Bahrain", code: "+973", flag: "🇧🇭"),
  CountryCodeModel(name: "Oman", code: "+968", flag: "🇴🇲"),
  CountryCodeModel(name: "Jordan", code: "+962", flag: "🇯🇴"),
  CountryCodeModel(name: "Lebanon", code: "+961", flag: "🇱🇧"),
  CountryCodeModel(name: "Iraq", code: "+964", flag: "🇮🇶"),
  CountryCodeModel(name: "Syria", code: "+963", flag: "🇸🇾"),
  CountryCodeModel(name: "Libya", code: "+218", flag: "🇱🇾"),
  CountryCodeModel(name: "Tunisia", code: "+216", flag: "🇹🇳"),
  CountryCodeModel(name: "Algeria", code: "+213", flag: "🇩🇿"),
  CountryCodeModel(name: "Morocco", code: "+212", flag: "🇲🇦"),
  CountryCodeModel(name: "Sudan", code: "+249", flag: "🇸🇩"),
  CountryCodeModel(name: "Yemen", code: "+967", flag: "🇾🇪"),
  CountryCodeModel(name: "USA", code: "+1", flag: "🇺🇸"),
  CountryCodeModel(name: "UK", code: "+44", flag: "🇬🇧"),
  CountryCodeModel(name: "Germany", code: "+49", flag: "🇩🇪"),
  CountryCodeModel(name: "France", code: "+33", flag: "🇫🇷"),
  CountryCodeModel(name: "Turkey", code: "+90", flag: "🇹🇷"),
  CountryCodeModel(name: "India", code: "+91", flag: "🇮🇳"),
];
