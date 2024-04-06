class LoginModel {
  String? code;
  bool? success;
  String? message;
  List<DataUser> data;


  LoginModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: List<DataUser>.from(json["data"].map((x) => DataUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataUser {
    String iduser;
    String nik;
    String nama;
    String alamat;
    String pekerjaan;
    String telp;
    String email;
    String password;
    String kodeOtp;
    String isAktif;
    String isDelete;
    String noDaftar;
    String foto;
    dynamic tglDaftar;
    dynamic tglUpdate;
    String rt;
    String rw;
    String kddesa;
    String kdkecamatan;
    String kdkabupaten;
    String kdprovinsi;
    String npwp;
    dynamic fcNpwp;
    dynamic fcKtp;

    DataUser({
        required this.iduser,
        required this.nik,
        required this.nama,
        required this.alamat,
        required this.pekerjaan,
        required this.telp,
        required this.email,
        required this.password,
        required this.kodeOtp,
        required this.isAktif,
        required this.isDelete,
        required this.noDaftar,
        required this.foto,
        required this.tglDaftar,
        required this.tglUpdate,
        required this.rt,
        required this.rw,
        required this.kddesa,
        required this.kdkecamatan,
        required this.kdkabupaten,
        required this.kdprovinsi,
        required this.npwp,
        required this.fcNpwp,
        required this.fcKtp,
    });

    factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        iduser: json["iduser"],
        nik: json["nik"],
        nama: json["nama"],
        alamat: json["alamat"],
        pekerjaan: json["pekerjaan"],
        telp: json["telp"],
        email: json["email"],
        password: json["password"],
        kodeOtp: json["kode_otp"],
        isAktif: json["is_aktif"],
        isDelete: json["is_delete"],
        noDaftar: json["no_daftar"],
        foto: json["foto"],
        tglDaftar: json["tgl_daftar"],
        tglUpdate: json["tgl_update"],
        rt: json["rt"],
        rw: json["rw"],
        kddesa: json["kddesa"],
        kdkecamatan: json["kdkecamatan"],
        kdkabupaten: json["kdkabupaten"],
        kdprovinsi: json["kdprovinsi"],
        npwp: json["npwp"],
        fcNpwp: json["fc_npwp"],
        fcKtp: json["fc_ktp"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "nik": nik,
        "nama": nama,
        "alamat": alamat,
        "pekerjaan": pekerjaan,
        "telp": telp,
        "email": email,
        "password": password,
        "kode_otp": kodeOtp,
        "is_aktif": isAktif,
        "is_delete": isDelete,
        "no_daftar": noDaftar,
        "foto": foto,
        "tgl_daftar": tglDaftar,
        "tgl_update": tglUpdate,
        "rt": rt,
        "rw": rw,
        "kddesa": kddesa,
        "kdkecamatan": kdkecamatan,
        "kdkabupaten": kdkabupaten,
        "kdprovinsi": kdprovinsi,
        "npwp": npwp,
        "fc_npwp": fcNpwp,
        "fc_ktp": fcKtp,
    };
}