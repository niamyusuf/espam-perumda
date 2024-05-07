class AlihKelolaModel {
  String? code;
  bool? success;
  String? message;
  List<DataAkTL> data;


  AlihKelolaModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory AlihKelolaModel.fromJson(Map<String, dynamic> json) => AlihKelolaModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: List<DataAkTL>.from(json["data"].map((x) => DataAkTL.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataAkTL {
    int     id;
    String  nopendaftaran;
    String  keterangan;
    int     stsverifikasi;
    String  tgl;
    int     isdelete;
    int     posisi;
    int     iduser;
    int     idpegawai;
    String  nnmperumahan;

    DataAkTL({
        required this.id,
        required this.nopendaftaran,
        required this.keterangan,
        required this.stsverifikasi,
        required this.tgl,
        required this.isdelete,
        required this.posisi,
        required this.iduser,
        required this.idpegawai,
        required this.nnmperumahan,

    });

    factory DataAkTL.fromJson(Map<String, dynamic> json) => DataAkTL(
        id              : int.parse(json["id"]),
        nopendaftaran   : json["nopendaftaran"],
        keterangan      : json["keterangan"],
        stsverifikasi   : int.parse(json["sts_verifikasi"]),
        tgl             : json["tgl"],
        isdelete        : int.parse(json["is_delete"]),
        posisi          : int.parse(json["posisi"]),
        iduser          : json["id_user"] == null ? 0 : int.parse(json["id_user"]),
        idpegawai       : json["id_pegawai"] == null ? 0 : int.parse(json["id_pegawai"]),
        nnmperumahan    : json["nama_perumahan"],

    );

    Map<String, dynamic> toJson() => {
        "id"              : id,
        "nopendaftaran"   : nopendaftaran,
        "keterangan"      : keterangan,
        "sts_verifikasi"  : stsverifikasi,
        "tgl"             : tgl,
        "is_delete"       : isdelete,
        "posisi"          : posisi,
        "id_user"         : iduser,
        "idpegawai"       : idpegawai,
        "nmperumahan"     : nnmperumahan,
    };
}


class ListDaftarModel {
  String? code;
  bool? success;
  String? message;
  List<DataAK> data;


  ListDaftarModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ListDaftarModel.fromJson(Map<String, dynamic> json) => ListDaftarModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: List<DataAK>.from(json["data"].map((x) => DataAK.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataAK {
    String     id;
    String  nopendaftaran;
    String  nmperumahan;
    int     stsajuan;

    DataAK({
        required this.id,
        required this.nopendaftaran,
        required this.nmperumahan,
        required this.stsajuan

    });

    factory DataAK.fromJson(Map<String, dynamic> json) => DataAK(
        id              : json["id"],
        nopendaftaran   : json["nodaftar"],
        nmperumahan     : json["nama"],
        stsajuan        : int.parse(json["sts_ajuan"]),
    );

    Map<String, dynamic> toJson() => {
        "id"            : id,
        "nodaftar"      : nopendaftaran,
        "nmperumahan"   : nmperumahan,
        "stsajuan"      : stsajuan,
    };
}