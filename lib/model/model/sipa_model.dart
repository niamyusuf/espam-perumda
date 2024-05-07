class SipaModel {
  String? code;
  bool? success;
  String? message;
  List<DataSipaTL> data;


  SipaModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory SipaModel.fromJson(Map<String, dynamic> json) => SipaModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: List<DataSipaTL>.from(json["data"].map((x) => DataSipaTL.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataSipaTL {
    int     id;
    String  nopendaftaran;
    String  keterangan;
    int     stsverifikasi;
    String  tgl;
    int     isdelete;
    int     posisi;
    int     iduser;
    int     idpegawai;
    String  nmpemohon;

    DataSipaTL({
        required this.id,
        required this.nopendaftaran,
        required this.keterangan,
        required this.stsverifikasi,
        required this.tgl,
        required this.isdelete,
        required this.posisi,
        required this.iduser,
        required this.idpegawai,
        required this.nmpemohon,

    });

    factory DataSipaTL.fromJson(Map<String, dynamic> json) => DataSipaTL(
        id              : int.parse(json["id"]),
        nopendaftaran   : json["nopendaftaran"],
        keterangan      : json["keterangan"],
        stsverifikasi   : int.parse(json["sts_verifikasi"]),
        tgl             : json["tgl"],
        isdelete        : int.parse(json["is_delete"]),
        posisi          : int.parse(json["posisi"]),
        iduser          : json["id_user"] == null ? 0 : int.parse(json["id_user"]),
        idpegawai       : json["id_pegawai"] == null ? 0 : int.parse(json["id_pegawai"]),
        nmpemohon       : json["nama_pemohon"],

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
        "nmpemohon"       : nmpemohon,
    };
}


class ListDaftarModel {
  String? code;
  bool? success;
  String? message;
  List<DataSipa> data;


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
        data: List<DataSipa>.from(json["data"].map((x) => DataSipa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataSipa {
    String     id;
    String  nopendaftaran;
    String  nmperumahan;
    int     stsajuan;

    DataSipa({
        required this.id,
        required this.nopendaftaran,
        required this.nmperumahan,
        required this.stsajuan

    });

    factory DataSipa.fromJson(Map<String, dynamic> json) => DataSipa(
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