-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.11-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- tablo yapısı dökülüyor samp.actor
CREATE TABLE IF NOT EXISTS `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(32) CHARACTER SET utf8 NOT NULL,
  `skin` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rz` float NOT NULL,
  `vw` int(11) NOT NULL,
  `int` int(11) NOT NULL,
  `anim` varchar(255) CHARACTER SET utf8 NOT NULL,
  `renk` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.actor: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.akabasarim
CREATE TABLE IF NOT EXISTS `akabasarim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yilbasi` int(11) NOT NULL DEFAULT 0,
  `bughunter` int(11) NOT NULL DEFAULT 0,
  `arge` int(11) NOT NULL DEFAULT 0,
  `ornekoyuncu` int(11) NOT NULL DEFAULT 0,
  `lideroyuncu` int(11) NOT NULL DEFAULT 0,
  `ayinoyuncusu` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `donator` int(11) NOT NULL DEFAULT 0,
  `helper` int(11) NOT NULL DEFAULT 0,
  `v1` int(11) NOT NULL DEFAULT 0,
  `beta` int(11) NOT NULL DEFAULT 0,
  `Nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'Yok',
  `bakiye` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.akabasarim: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `akabasarim` DISABLE KEYS */;
/*!40000 ALTER TABLE `akabasarim` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.aksesuarlar
CREATE TABLE IF NOT EXISTS `aksesuarlar` (
  `aID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL DEFAULT -1,
  `aindex` int(11) NOT NULL DEFAULT 0,
  `abone` int(11) NOT NULL DEFAULT 0,
  `amodel` int(11) NOT NULL DEFAULT 18633,
  `akX` float(11,8) NOT NULL DEFAULT 0.00000000,
  `akY` float(11,8) NOT NULL DEFAULT 0.00000000,
  `akZ` float(11,8) NOT NULL DEFAULT 0.00000000,
  `arX` float(11,8) NOT NULL DEFAULT 0.00000000,
  `arY` float(11,8) NOT NULL DEFAULT 0.00000000,
  `arZ` float(11,8) NOT NULL DEFAULT 0.00000000,
  `aoX` float(11,8) NOT NULL DEFAULT 1.00000000,
  `aoY` float(11,8) NOT NULL DEFAULT 1.00000000,
  `aoZ` float(11,8) NOT NULL DEFAULT 1.00000000,
  `arenk1` int(11) NOT NULL DEFAULT 0,
  `arenk2` int(11) NOT NULL DEFAULT 0,
  `giyilmis` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`aID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.aksesuarlar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `aksesuarlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `aksesuarlar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.ankesortelefon
CREATE TABLE IF NOT EXISTS `ankesortelefon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` varchar(255) CHARACTER SET latin1 NOT NULL,
  `y` varchar(255) CHARACTER SET latin1 NOT NULL,
  `z` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rx` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `ry` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `rz` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.ankesortelefon: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `ankesortelefon` DISABLE KEYS */;
/*!40000 ALTER TABLE `ankesortelefon` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.apb
CREATE TABLE IF NOT EXISTS `apb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suc` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `aranan` varchar(128) CHARACTER SET utf8 NOT NULL,
  `memur` varchar(128) CHARACTER SET utf8 NOT NULL,
  `duzenleyen` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.apb: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `apb` DISABLE KEYS */;
/*!40000 ALTER TABLE `apb` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.aracanahtar
CREATE TABLE IF NOT EXISTS `aracanahtar` (
  `oyuncuID` int(11) NOT NULL,
  `aracID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.aracanahtar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `aracanahtar` DISABLE KEYS */;
/*!40000 ALTER TABLE `aracanahtar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.araclar
CREATE TABLE IF NOT EXISTS `araclar` (
  `sqlid` int(5) NOT NULL AUTO_INCREMENT,
  `model` int(4) NOT NULL DEFAULT 562,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `renk1` int(4) NOT NULL DEFAULT 1,
  `renk2` int(4) NOT NULL DEFAULT 1,
  `owner` int(5) NOT NULL DEFAULT -1,
  `hasar` float NOT NULL DEFAULT 1000,
  `tip` int(2) NOT NULL DEFAULT 0,
  `fiyat` int(11) NOT NULL DEFAULT 100000,
  `spawn` int(2) NOT NULL DEFAULT 1,
  `spawnsatin` int(2) NOT NULL DEFAULT 0,
  `plaka` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `kilit` int(2) NOT NULL DEFAULT 0,
  `kilittip` int(2) NOT NULL DEFAULT 0,
  `alarm` int(2) NOT NULL DEFAULT 0,
  `immo` int(2) NOT NULL DEFAULT 0,
  `benzin` int(11) NOT NULL DEFAULT 100,
  `ceza` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `cezamiktar` int(11) NOT NULL DEFAULT 0,
  `paintjob` int(11) NOT NULL DEFAULT 99,
  `exhaust` int(11) NOT NULL DEFAULT 0,
  `frontbumper` int(11) NOT NULL DEFAULT 0,
  `rearbumper` int(11) NOT NULL DEFAULT 0,
  `roof` int(11) NOT NULL DEFAULT 0,
  `spoilers` int(11) NOT NULL DEFAULT 0,
  `sideskirts` int(11) NOT NULL DEFAULT 0,
  `bullbars` int(11) NOT NULL DEFAULT 0,
  `tekerlek` int(11) NOT NULL DEFAULT 0,
  `carstereo` int(11) NOT NULL DEFAULT 0,
  `hidrolik` int(11) NOT NULL DEFAULT 0,
  `nitro` int(11) NOT NULL DEFAULT 0,
  `panels` int(11) NOT NULL DEFAULT 0,
  `doors` int(11) NOT NULL DEFAULT 0,
  `lights` int(11) NOT NULL DEFAULT 0,
  `tires` int(11) NOT NULL DEFAULT 0,
  `yedekanahtar` int(11) NOT NULL DEFAULT 0,
  `km` int(11) DEFAULT 0,
  `metre` int(11) NOT NULL,
  `textdurum` int(11) NOT NULL DEFAULT 0,
  `textyazi` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `birlik` int(11) DEFAULT 255,
  `birliktip` int(11) NOT NULL DEFAULT 0,
  `rutbe` int(11) NOT NULL DEFAULT 0,
  `sure` int(11) NOT NULL,
  `neon` int(11) DEFAULT 0,
  `silah1` int(11) NOT NULL,
  `mermi1` int(11) NOT NULL,
  `silah2` int(11) NOT NULL,
  `mermi2` int(11) NOT NULL,
  `silah3` int(11) NOT NULL,
  `mermi3` int(11) NOT NULL,
  `benzintip` int(11) NOT NULL DEFAULT 0,
  `hizsabit` int(11) NOT NULL DEFAULT 0,
  `matA` int(11) NOT NULL DEFAULT 0,
  `matB` int(11) NOT NULL DEFAULT 0,
  `matC` int(11) NOT NULL DEFAULT 0,
  `matD` int(11) NOT NULL DEFAULT 0,
  `matE` int(11) NOT NULL,
  `esrar` int(11) NOT NULL DEFAULT 0,
  `amfetamin` int(11) NOT NULL DEFAULT 0,
  `metamfetamin` int(11) NOT NULL DEFAULT 0,
  `lsd` int(11) NOT NULL DEFAULT 0,
  `extacy` int(11) NOT NULL DEFAULT 0,
  `kokain` int(11) NOT NULL DEFAULT 0,
  `eroin` int(11) NOT NULL DEFAULT 0,
  `morfin` int(11) NOT NULL DEFAULT 0,
  `MDA` int(11) NOT NULL DEFAULT 0,
  `vergi` int(11) NOT NULL DEFAULT 0,
  `cezali` int(11) NOT NULL,
  `aisyeri` int(11) NOT NULL,
  `agelir` int(11) NOT NULL,
  `sigorta` int(11) NOT NULL,
  `birlikdestek` int(11) NOT NULL,
  `parcalandi` int(11) NOT NULL DEFAULT 0,
  `siren` int(11) NOT NULL DEFAULT 0,
  `ahurda` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sqlid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.araclar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `araclar` DISABLE KEYS */;
/*!40000 ALTER TABLE `araclar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.aracsilah
CREATE TABLE IF NOT EXISTS `aracsilah` (
  `silahID` int(11) NOT NULL,
  `mermi` int(11) NOT NULL,
  `aracID` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `oyuncuid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.aracsilah: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `aracsilah` DISABLE KEYS */;
/*!40000 ALTER TABLE `aracsilah` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.aranmakayit
CREATE TABLE IF NOT EXISTS `aranmakayit` (
  `id` int(11) NOT NULL,
  `Aranan` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `Memur` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `Suc` varchar(255) CHARACTER SET latin5 NOT NULL,
  `Tip` int(11) NOT NULL,
  `Tarih` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.aranmakayit: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `aranmakayit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aranmakayit` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.atm
CREATE TABLE IF NOT EXISTS `atm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `interior` int(11) NOT NULL,
  `vworld` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.atm: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.banlistesi
CREATE TABLE IF NOT EXISTS `banlistesi` (
  `ad` varchar(64) CHARACTER SET utf8 NOT NULL,
  `neden` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `ipadresi` text CHARACTER SET utf8 NOT NULL,
  `serialip` text CHARACTER SET utf8 NOT NULL,
  `yasaklayan` varchar(32) CHARACTER SET utf8 NOT NULL,
  `tarih` varchar(512) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.banlistesi: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `banlistesi` DISABLE KEYS */;
/*!40000 ALTER TABLE `banlistesi` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.barikatlar
CREATE TABLE IF NOT EXISTS `barikatlar` (
  `buniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  PRIMARY KEY (`buniqueid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.barikatlar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `barikatlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `barikatlar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.basvurular
CREATE TABLE IF NOT EXISTS `basvurular` (
  `sqlid` int(11) NOT NULL AUTO_INCREMENT,
  `k_nick` varchar(255) CHARACTER SET utf8 NOT NULL,
  `k_adi` varchar(255) CHARACTER SET utf8 NOT NULL,
  `k_sifre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `k_dogumyeri` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `k_dil` int(11) NOT NULL,
  `k_dogumyili` int(11) NOT NULL DEFAULT 0,
  `k_cinsiyet` int(11) NOT NULL,
  `k_irk` int(11) NOT NULL,
  `rolterimi` text CHARACTER SET utf8 NOT NULL,
  `hikaye` text CHARACTER SET utf8 NOT NULL,
  `sacrengi` int(11) NOT NULL,
  `gozrengi` int(11) NOT NULL,
  `boy` int(11) NOT NULL,
  `kilo` int(11) NOT NULL,
  `tarih` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`sqlid`) USING BTREE,
  UNIQUE KEY `karakter_adi` (`k_adi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.basvurular: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `basvurular` DISABLE KEYS */;
/*!40000 ALTER TABLE `basvurular` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.benzinistasyonlari
CREATE TABLE IF NOT EXISTS `benzinistasyonlari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `durum` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.benzinistasyonlari: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `benzinistasyonlari` DISABLE KEYS */;
/*!40000 ALTER TABLE `benzinistasyonlari` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.birlikler
CREATE TABLE IF NOT EXISTS `birlikler` (
  `sqlid` int(11) NOT NULL AUTO_INCREMENT,
  `fisim` varchar(32) CHARACTER SET latin5 NOT NULL,
  `rutbe1` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe1maas` int(11) NOT NULL DEFAULT 0,
  `rutbe2` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe2maas` int(11) NOT NULL DEFAULT 0,
  `rutbe3` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe3maas` int(11) NOT NULL DEFAULT 0,
  `rutbe4` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe4maas` int(11) NOT NULL DEFAULT 0,
  `rutbe5` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe5maas` int(11) NOT NULL DEFAULT 0,
  `rutbe6` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe6maas` int(11) NOT NULL DEFAULT 0,
  `rutbe7` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe7maas` int(11) NOT NULL DEFAULT 0,
  `rutbe8` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe8maas` int(11) NOT NULL DEFAULT 0,
  `rutbe9` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe9maas` int(11) NOT NULL DEFAULT 0,
  `rutbe10` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe10maas` int(11) NOT NULL DEFAULT 0,
  `rutbe11` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe11maas` int(11) NOT NULL DEFAULT 0,
  `rutbe12` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe12maas` int(11) NOT NULL DEFAULT 0,
  `ftip` int(11) NOT NULL,
  `seviye` int(11) NOT NULL DEFAULT 1,
  `itibar` int(11) NOT NULL DEFAULT 10,
  `onay` int(11) NOT NULL DEFAULT 0,
  `lider` int(11) NOT NULL DEFAULT -1,
  `isbasipos` varchar(255) CHARACTER SET utf8 NOT NULL,
  `reklampos` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hesapno` int(11) NOT NULL,
  `reklamfiyat` int(11) NOT NULL DEFAULT 2,
  `rutbe13` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe13maas` int(11) NOT NULL DEFAULT 0,
  `rutbe14` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe14maas` int(11) NOT NULL DEFAULT 0,
  `rutbe15` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe15maas` int(11) NOT NULL DEFAULT 0,
  `rutbe16` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe16maas` int(11) NOT NULL DEFAULT 0,
  `rutbe17` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe17maas` int(11) NOT NULL DEFAULT 0,
  `rutbe18` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe18maas` int(11) NOT NULL DEFAULT 0,
  `rutbe19` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe19maas` int(11) NOT NULL DEFAULT 0,
  `rutbe20` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rutbe20maas` int(11) NOT NULL DEFAULT 0,
  `kasa` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sqlid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.birlikler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `birlikler` DISABLE KEYS */;
/*!40000 ALTER TABLE `birlikler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.birlikyetkili
CREATE TABLE IF NOT EXISTS `birlikyetkili` (
  `birlikid` int(11) NOT NULL,
  `sqlid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.birlikyetkili: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `birlikyetkili` DISABLE KEYS */;
/*!40000 ALTER TABLE `birlikyetkili` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.bitcoinalislog
CREATE TABLE IF NOT EXISTS `bitcoinalislog` (
  `id` int(122) NOT NULL AUTO_INCREMENT,
  `kim` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `kacbtc` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `nekadara` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.bitcoinalislog: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `bitcoinalislog` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoinalislog` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.bitcoinsatislog
CREATE TABLE IF NOT EXISTS `bitcoinsatislog` (
  `id` int(122) NOT NULL AUTO_INCREMENT,
  `kim` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `kacbtc` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `nekadara` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.bitcoinsatislog: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `bitcoinsatislog` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoinsatislog` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.bitcointransferlog
CREATE TABLE IF NOT EXISTS `bitcointransferlog` (
  `id` int(122) NOT NULL AUTO_INCREMENT,
  `kim` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `kime` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `kacbtc` varchar(122) COLLATE utf8_turkish_ci NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.bitcointransferlog: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `bitcointransferlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcointransferlog` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.bkarakterler
CREATE TABLE IF NOT EXISTS `bkarakterler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'Yakisikli',
  `sifre` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT 1742,
  `posy` int(11) NOT NULL DEFAULT -1860,
  `posz` int(11) NOT NULL DEFAULT 14,
  `interior` int(11) NOT NULL DEFAULT 0,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `para` int(11) NOT NULL DEFAULT 1500,
  `skin` int(11) NOT NULL DEFAULT -1,
  `hp` float NOT NULL DEFAULT 100,
  `armor` float NOT NULL DEFAULT 0,
  `kimlikno` int(8) NOT NULL DEFAULT 0,
  `yas` int(11) NOT NULL DEFAULT 0,
  `cinsiyet` int(11) NOT NULL DEFAULT 0,
  `uyruk` int(11) NOT NULL DEFAULT 0,
  `adminlevel` int(11) NOT NULL DEFAULT 0,
  `kilit` int(3) NOT NULL DEFAULT 0,
  `neden` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `chatstili` int(11) NOT NULL DEFAULT 0,
  `esrar` int(11) NOT NULL DEFAULT 0,
  `mantar` int(11) NOT NULL DEFAULT 0,
  `hammantar` int(11) NOT NULL DEFAULT 0,
  `usaksi` int(11) NOT NULL DEFAULT 0,
  `esrartohum` int(11) NOT NULL DEFAULT 0,
  `birlik` int(11) NOT NULL DEFAULT 0,
  `rutbe` int(11) NOT NULL DEFAULT 0,
  `kodes` int(11) NOT NULL DEFAULT 0,
  `ajail` int(11) NOT NULL DEFAULT 0,
  `ceza` int(11) NOT NULL DEFAULT 0,
  `cezaneden` varchar(512) CHARACTER SET utf8 NOT NULL,
  `amfetamin` int(11) NOT NULL DEFAULT 0,
  `metamfetamin` int(11) NOT NULL DEFAULT 0,
  `lsd` int(11) NOT NULL DEFAULT 0,
  `extacy` int(11) NOT NULL DEFAULT 0,
  `eroin` int(11) NOT NULL DEFAULT 0,
  `kokain` int(11) NOT NULL DEFAULT 0,
  `morfin` int(11) NOT NULL DEFAULT 0,
  `MDA` int(11) NOT NULL DEFAULT 0,
  `ip` text CHARACTER SET utf8 NOT NULL,
  `kabartmatozu` int(11) NOT NULL DEFAULT 0,
  `eter` int(11) NOT NULL DEFAULT 0,
  `ephedrin` int(11) NOT NULL DEFAULT 0,
  `hperoksit` int(11) NOT NULL DEFAULT 0,
  `fasit` int(11) NOT NULL DEFAULT 0,
  `bos8` int(11) NOT NULL DEFAULT 0,
  `bos8mermi` int(11) NOT NULL DEFAULT 0,
  `bos9` int(11) NOT NULL DEFAULT 0,
  `bos9mermi` int(11) NOT NULL DEFAULT 0,
  `bos10` int(11) NOT NULL DEFAULT 0,
  `bos10mermi` int(11) NOT NULL DEFAULT 0,
  `telno` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `isbasi` int(11) NOT NULL DEFAULT 0,
  `isbasiskin` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `hesapno` int(11) DEFAULT 0,
  `banka` int(11) DEFAULT 0,
  `savings` int(11) DEFAULT 0,
  `paydakika` int(11) DEFAULT 60,
  `maske` int(11) NOT NULL DEFAULT 0,
  `maskeno` int(20) NOT NULL DEFAULT 0,
  `meslek` int(11) NOT NULL DEFAULT 0,
  `balik` int(11) NOT NULL DEFAULT 0,
  `yem` int(11) NOT NULL DEFAULT 0,
  `yemmiktar` int(11) NOT NULL DEFAULT 0,
  `olta` int(11) NOT NULL DEFAULT 0,
  `tester` int(11) DEFAULT 0,
  `sigara` int(11) NOT NULL DEFAULT 0,
  `k_sahibi` int(11) NOT NULL DEFAULT 0,
  `sonx` float NOT NULL,
  `sony` float NOT NULL,
  `sonz` float NOT NULL,
  `sonvw` int(11) NOT NULL,
  `sonint` int(11) NOT NULL,
  `bagimlimi` int(11) NOT NULL DEFAULT 0,
  `krizgeldimi` int(11) NOT NULL DEFAULT 0,
  `utedavidurum` int(11) NOT NULL DEFAULT 0,
  `aclik` int(11) NOT NULL DEFAULT 10,
  `susuzluk` int(11) NOT NULL DEFAULT 10,
  `tuvalet` int(11) NOT NULL DEFAULT 10,
  `anick` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'admin',
  `askin` int(11) NOT NULL,
  `ehliyet` int(11) NOT NULL DEFAULT 0,
  `rehber` text CHARACTER SET utf8 NOT NULL,
  `kasseviye` int(11) NOT NULL DEFAULT 0,
  `kaspuan` int(11) NOT NULL DEFAULT 0,
  `girdi` int(11) NOT NULL,
  `grup` int(11) NOT NULL,
  `gps` int(11) NOT NULL DEFAULT 0,
  `box` int(11) NOT NULL DEFAULT 0,
  `kungfu` int(11) NOT NULL DEFAULT 0,
  `kneehead` int(11) NOT NULL DEFAULT 0,
  `grabkick` int(11) NOT NULL DEFAULT 0,
  `elbow` int(11) NOT NULL DEFAULT 0,
  `dovussure` int(20) NOT NULL DEFAULT 0,
  `matA` int(11) NOT NULL,
  `matB` int(11) NOT NULL,
  `matC` int(11) NOT NULL,
  `matD` int(11) NOT NULL,
  `kokaintohum` int(11) NOT NULL DEFAULT 0,
  `erointohum` int(11) NOT NULL DEFAULT 0,
  `kiyafetler` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0|0|0',
  `benzinbidon` float NOT NULL DEFAULT 0,
  `bidon` int(11) NOT NULL DEFAULT 0,
  `tezgah` int(11) NOT NULL DEFAULT 0,
  `yem1` int(11) NOT NULL DEFAULT 0,
  `yem2` int(11) NOT NULL DEFAULT 0,
  `yem3` int(11) NOT NULL DEFAULT 0,
  `medisbasi` int(11) NOT NULL DEFAULT 0,
  `sisbasi` int(11) NOT NULL DEFAULT 0,
  `dil` int(11) NOT NULL DEFAULT -1,
  `kvw` int(11) NOT NULL DEFAULT -1,
  `unlu` int(11) NOT NULL DEFAULT 0,
  `rozetno` int(11) NOT NULL DEFAULT 0,
  `ehliyetno` int(11) NOT NULL,
  `alm` int(11) NOT NULL DEFAULT 0,
  `arp` int(11) NOT NULL DEFAULT 0,
  `cin` int(11) NOT NULL DEFAULT 0,
  `fra` int(11) NOT NULL DEFAULT 0,
  `isp` int(11) NOT NULL DEFAULT 0,
  `ita` int(11) NOT NULL DEFAULT 0,
  `japon` int(11) NOT NULL DEFAULT 0,
  `rus` int(11) NOT NULL DEFAULT 0,
  `ibra` int(11) NOT NULL,
  `yunan` int(11) NOT NULL,
  `ermen` int(11) NOT NULL,
  `slovak` int(11) NOT NULL,
  `irlan` int(11) NOT NULL,
  `porte` int(11) NOT NULL,
  `sirp` int(11) NOT NULL,
  `arnavut` int(11) NOT NULL,
  `dilsure` int(11) NOT NULL DEFAULT 0,
  `garajda` int(11) NOT NULL DEFAULT 0,
  `sruhsat` int(11) NOT NULL DEFAULT 0,
  `sruhsat2` int(11) NOT NULL DEFAULT 0,
  `soygunsure` int(11) NOT NULL,
  `kanama` int(11) NOT NULL DEFAULT 0,
  `telsiz` int(11) NOT NULL DEFAULT 0,
  `frekans` int(11) NOT NULL,
  `galeri` int(11) NOT NULL,
  `ssgaleri` int(11) NOT NULL,
  `gengelle` int(11) NOT NULL,
  `gozrenk` int(11) NOT NULL,
  `sacrenk` int(11) NOT NULL,
  `kilo` int(11) NOT NULL,
  `boy` int(11) NOT NULL,
  `ciu` int(11) NOT NULL,
  `kassure` int(11) NOT NULL,
  `uyari` int(11) NOT NULL,
  `saglikrapor` int(11) NOT NULL,
  `temizrapor` int(11) NOT NULL,
  `surucusinav` int(11) NOT NULL,
  `bmxizin` int(11) NOT NULL,
  `pmizin` int(11) NOT NULL,
  `notdefteri` int(11) NOT NULL,
  `dovme` varchar(512) CHARACTER SET utf8 NOT NULL,
  `songiris` varchar(512) CHARACTER SET utf8 NOT NULL,
  `bot` int(11) NOT NULL,
  `dogumyeri` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `dogumtarihi` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sifredegisme` varchar(25) CHARACTER SET utf8 DEFAULT '0',
  `guvenlikayari` int(11) NOT NULL,
  `guvenlikdurumu` int(11) NOT NULL,
  `crapor` int(11) NOT NULL DEFAULT 0,
  `srapor` int(11) NOT NULL DEFAULT 0,
  `csoru` int(11) NOT NULL DEFAULT 0,
  `ssoru` int(11) NOT NULL DEFAULT 0,
  `oyunsure` int(11) NOT NULL,
  `lspdsifre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Nickname` varchar(255) CHARACTER SET utf8 DEFAULT 'Yok',
  `bitcoin` varchar(122) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  `bitcoinno` varchar(122) COLLATE utf8_turkish_ci NOT NULL DEFAULT 'bulunmamaktadır',
  `skin5` int(11) NOT NULL DEFAULT 336,
  `skin22` int(11) NOT NULL DEFAULT 346,
  `skin24` int(11) NOT NULL DEFAULT 348,
  `skin28` int(11) NOT NULL DEFAULT 352,
  `skin29` int(11) NOT NULL DEFAULT 353,
  `skin30` int(11) NOT NULL DEFAULT 355,
  `skin31` int(11) NOT NULL DEFAULT 356,
  `skin32` int(11) NOT NULL DEFAULT 372,
  `forumadmin` int(222) NOT NULL,
  `bakiye` varchar(255) COLLATE utf8_turkish_ci DEFAULT '0',
  `oydurum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.bkarakterler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `bkarakterler` DISABLE KEYS */;
/*!40000 ALTER TABLE `bkarakterler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.bolgeler
CREATE TABLE IF NOT EXISTS `bolgeler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `pos1` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `pos2` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `pos3` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `pos4` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `icrenk` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  `icsaydamlik` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0.35',
  `disrenk` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  `dissaydamlik` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0.8',
  `yazi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- samp.bolgeler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `bolgeler` DISABLE KEYS */;
/*!40000 ALTER TABLE `bolgeler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.cctv
CREATE TABLE IF NOT EXISTS `cctv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_model` int(11) NOT NULL,
  `c_name` varchar(65) CHARACTER SET utf8 NOT NULL,
  `c_px` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_py` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_pz` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_rx` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_ry` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_rz` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c_angle` int(11) NOT NULL,
  `c_int` int(11) NOT NULL,
  `c_world` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.cctv: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `cctv` DISABLE KEYS */;
/*!40000 ALTER TABLE `cctv` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.deepweb
CREATE TABLE IF NOT EXISTS `deepweb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ilanadi` varchar(64) CHARACTER SET utf8 NOT NULL,
  `gorev` varchar(1024) COLLATE utf8_turkish_ci NOT NULL,
  `isim` varchar(32) CHARACTER SET utf8 NOT NULL,
  `yer` varchar(128) CHARACTER SET utf8 NOT NULL,
  `para` int(11) NOT NULL,
  `not` varchar(1024) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.deepweb: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `deepweb` DISABLE KEYS */;
/*!40000 ALTER TABLE `deepweb` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.evanahtar
CREATE TABLE IF NOT EXISTS `evanahtar` (
  `oyuncuID` int(11) NOT NULL,
  `evID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.evanahtar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `evanahtar` DISABLE KEYS */;
/*!40000 ALTER TABLE `evanahtar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.evler
CREATE TABLE IF NOT EXISTS `evler` (
  `sqlid` int(11) NOT NULL AUTO_INCREMENT,
  `ekonum` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `esahip` int(11) NOT NULL DEFAULT -1,
  `girisx` float NOT NULL,
  `girisy` float NOT NULL,
  `girisz` float NOT NULL,
  `egirisvw` int(11) NOT NULL,
  `egirisint` int(11) NOT NULL,
  `egirisangle` float NOT NULL,
  `cikisx` float NOT NULL,
  `cikisy` float NOT NULL,
  `cikisz` float NOT NULL,
  `ecikisint` int(11) NOT NULL,
  `ecikisvw` int(11) NOT NULL,
  `ecikisangle` float NOT NULL,
  `efiyat` int(11) NOT NULL,
  `ekilit` int(11) NOT NULL DEFAULT 1,
  `kira` int(11) NOT NULL DEFAULT 0,
  `kirafiyat` int(11) NOT NULL DEFAULT 0,
  `kiralayan` int(11) NOT NULL DEFAULT -1,
  `silah1` int(11) NOT NULL,
  `mermi1` int(11) NOT NULL,
  `silah2` int(11) NOT NULL,
  `mermi2` int(11) NOT NULL,
  `silah3` int(11) NOT NULL,
  `mermi3` int(11) NOT NULL,
  `intsure` int(11) NOT NULL,
  `intid` int(11) NOT NULL,
  `birlikdestek` int(11) NOT NULL,
  `amfetamin` int(11) NOT NULL DEFAULT 0,
  `metamfetamin` int(11) NOT NULL DEFAULT 0,
  `lsd` int(11) NOT NULL DEFAULT 0,
  `extacy` int(11) NOT NULL DEFAULT 0,
  `eroin` int(11) NOT NULL DEFAULT 0,
  `kokain` int(11) NOT NULL DEFAULT 0,
  `morfin` int(11) NOT NULL DEFAULT 0,
  `uesrar` int(11) NOT NULL DEFAULT 0,
  `MDA` int(11) NOT NULL DEFAULT 0,
  `catigiris` varchar(128) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0.0|0.0|0.0|0|0',
  `caticikis` varchar(128) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0.0|0.0|0.0|0|0',
  PRIMARY KEY (`sqlid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.evler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `evler` DISABLE KEYS */;
/*!40000 ALTER TABLE `evler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.evsilah
CREATE TABLE IF NOT EXISTS `evsilah` (
  `silahID` int(11) NOT NULL,
  `evID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.evsilah: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `evsilah` DISABLE KEYS */;
/*!40000 ALTER TABLE `evsilah` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.galeri
CREATE TABLE IF NOT EXISTS `galeri` (
  `aracid` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL,
  PRIMARY KEY (`aracid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.galeri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `galeri` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeri` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.garajlar
CREATE TABLE IF NOT EXISTS `garajlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `sahip` int(11) NOT NULL DEFAULT 0,
  `birlik` int(11) NOT NULL DEFAULT 0,
  `isim` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  `kilit` int(11) NOT NULL DEFAULT 0,
  `ax` float NOT NULL DEFAULT 0,
  `ay` float NOT NULL DEFAULT 0,
  `az` float NOT NULL DEFAULT 0,
  `arz` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.garajlar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `garajlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `garajlar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.gate
CREATE TABLE IF NOT EXISTS `gate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `ox` float NOT NULL,
  `oy` float NOT NULL,
  `oz` float NOT NULL,
  `orx` float NOT NULL,
  `ory` float NOT NULL,
  `orz` float NOT NULL,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `sahip` int(11) NOT NULL DEFAULT -1,
  `birlik` int(11) NOT NULL,
  `tmodel` int(11) NOT NULL DEFAULT 0,
  `tname1` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tname2` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.gate: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `gate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gate` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.gps
CREATE TABLE IF NOT EXISTS `gps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `y` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `z` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `isim` varchar(255) CHARACTER SET latin5 NOT NULL,
  `ekleyen` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.gps: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `gps` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.graffitiler
CREATE TABLE IF NOT EXISTS `graffitiler` (
  `GraffitiID` int(11) NOT NULL AUTO_INCREMENT,
  `gX` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gY` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gZ` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gRX` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gRY` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gRZ` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gYapan` int(11) NOT NULL,
  `gRenk` int(11) NOT NULL,
  `gInt` int(11) NOT NULL DEFAULT 0,
  `gVW` int(11) NOT NULL DEFAULT 0,
  `gYazi` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `gFont` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT 'Arial',
  `FontBoyut` int(11) NOT NULL DEFAULT 0,
  `MateryalBoyut` int(11) NOT NULL DEFAULT 0,
  `FontBold2` int(11) NOT NULL DEFAULT 0,
  `Ortala` int(11) NOT NULL,
  PRIMARY KEY (`GraffitiID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.graffitiler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `graffitiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `graffitiler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.grotti
CREATE TABLE IF NOT EXISTS `grotti` (
  `aracid` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL,
  PRIMARY KEY (`aracid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.grotti: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `grotti` DISABLE KEYS */;
/*!40000 ALTER TABLE `grotti` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.gruplar
CREATE TABLE IF NOT EXISTS `gruplar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Lider` int(11) NOT NULL,
  `isim` varchar(255) CHARACTER SET latin5 NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.gruplar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `gruplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `gruplar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.hesaplar
CREATE TABLE IF NOT EXISTS `hesaplar` (
  `forumnick` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'bos',
  `yilbasi` int(11) NOT NULL DEFAULT 0,
  `bughunter` int(11) NOT NULL DEFAULT 0,
  `arge` int(11) NOT NULL DEFAULT 0,
  `ornekoyuncu` int(11) NOT NULL DEFAULT 0,
  `lideroyuncu` int(11) NOT NULL DEFAULT 0,
  `ayinoyuncusu` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `donator` int(11) NOT NULL DEFAULT 0,
  `helper` int(11) NOT NULL DEFAULT 0,
  `v1` int(11) NOT NULL DEFAULT 0,
  `kbeta` int(11) NOT NULL DEFAULT 0,
  `bakiye` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  `altkarakterizin` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`forumnick`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.hesaplar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `hesaplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `hesaplar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.interiors
CREATE TABLE IF NOT EXISTS `interiors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(24) COLLATE utf8_turkish_ci NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  `interior` int(11) NOT NULL,
  `tur` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.interiors: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `interiors` DISABLE KEYS */;
/*!40000 ALTER TABLE `interiors` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.isyerimenu
CREATE TABLE IF NOT EXISTS `isyerimenu` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `tip` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `isim` varchar(255) CHARACTER SET latin5 NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.isyerimenu: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `isyerimenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `isyerimenu` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.isyerleri
CREATE TABLE IF NOT EXISTS `isyerleri` (
  `sqlid` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `isahip` int(11) NOT NULL DEFAULT -1,
  `girisx` float NOT NULL,
  `girisy` float NOT NULL,
  `girisz` float NOT NULL,
  `girisvw` int(11) NOT NULL DEFAULT 0,
  `girisint` int(11) NOT NULL,
  `girisangle` float NOT NULL,
  `cikisx` float NOT NULL,
  `cikisy` float NOT NULL,
  `cikisz` float NOT NULL,
  `cikisint` int(11) NOT NULL,
  `cikisangle` float NOT NULL,
  `fiyat` int(11) NOT NULL,
  `girisucreti` int(11) DEFAULT 0,
  `kasa` int(11) NOT NULL DEFAULT 0,
  `kilit` int(11) NOT NULL DEFAULT 0,
  `urun1` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun2` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun3` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun4` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun5` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun6` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun7` varchar(32) CHARACTER SET latin5 DEFAULT 'Yok',
  `urun8` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun9` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urun10` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT 'Yok',
  `urunfiyat1` int(11) NOT NULL,
  `urunfiyat2` int(11) NOT NULL,
  `urunfiyat3` int(11) NOT NULL,
  `urunfiyat4` int(11) NOT NULL,
  `urunfiyat5` int(11) NOT NULL,
  `urunfiyat6` int(11) NOT NULL,
  `urunfiyat7` int(11) NOT NULL,
  `urunfiyat8` int(11) NOT NULL,
  `urunfiyat9` int(11) NOT NULL,
  `urunfiyat10` int(11) NOT NULL,
  `yedekanahtar` int(11) NOT NULL DEFAULT -1,
  `pickupid` int(11) NOT NULL,
  `tip` int(11) NOT NULL DEFAULT 1,
  `icikisvw` int(11) NOT NULL,
  `istok` int(11) NOT NULL DEFAULT 0,
  `karsilama` varchar(128) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `kira` int(11) DEFAULT 0,
  `kiralayan` int(11) NOT NULL DEFAULT -1,
  `kirafiyat` int(11) NOT NULL DEFAULT 100,
  `isci1` int(11) NOT NULL DEFAULT -1,
  `isci2` int(11) NOT NULL DEFAULT -1,
  `isci3` int(11) DEFAULT -1,
  `isci4` int(11) NOT NULL DEFAULT -1,
  `isci5` int(11) DEFAULT -1,
  `isci6` int(11) NOT NULL DEFAULT -1,
  `isci7` int(11) NOT NULL DEFAULT -1,
  `isci8` int(11) NOT NULL DEFAULT -1,
  `isci9` int(11) NOT NULL DEFAULT -1,
  `isci10` int(11) NOT NULL DEFAULT -1,
  `ortak` int(11) NOT NULL DEFAULT -1,
  `muhurlu` int(11) NOT NULL DEFAULT 0,
  `intsure` int(11) NOT NULL,
  `intid` int(11) NOT NULL,
  `iseviye` int(11) NOT NULL,
  `agirisx` float NOT NULL,
  `agirisy` float NOT NULL,
  `agirisz` float NOT NULL,
  `agirisang` float NOT NULL,
  `acikisx` float NOT NULL,
  `acikisy` float NOT NULL,
  `acikisz` float NOT NULL,
  `acikisang` float NOT NULL,
  `birlikdestek` int(11) NOT NULL,
  `vergi` int(11) NOT NULL DEFAULT 0,
  `catigiris` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `caticikis` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`sqlid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.isyerleri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `isyerleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `isyerleri` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.karakterler
CREATE TABLE IF NOT EXISTS `karakterler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'Yakisikli',
  `sifre` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT -440,
  `posy` int(11) NOT NULL DEFAULT 1032,
  `posz` int(11) NOT NULL DEFAULT 11,
  `interior` int(11) NOT NULL DEFAULT 0,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `para` int(11) NOT NULL DEFAULT 500,
  `skin` int(11) NOT NULL DEFAULT -1,
  `hp` float NOT NULL DEFAULT 100,
  `armor` float NOT NULL DEFAULT 0,
  `kimlikno` int(8) NOT NULL DEFAULT 0,
  `yas` int(11) NOT NULL DEFAULT 0,
  `cinsiyet` int(11) NOT NULL DEFAULT 0,
  `uyruk` int(11) NOT NULL DEFAULT 0,
  `adminlevel` int(11) NOT NULL DEFAULT 0,
  `kilit` int(3) NOT NULL DEFAULT 0,
  `neden` varchar(32) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `chatstili` int(11) NOT NULL DEFAULT 0,
  `esrar` int(11) NOT NULL DEFAULT 0,
  `mantar` int(11) NOT NULL DEFAULT 0,
  `hammantar` int(11) NOT NULL DEFAULT 0,
  `usaksi` int(11) NOT NULL DEFAULT 0,
  `esrartohum` int(11) NOT NULL DEFAULT 0,
  `birlik` int(11) NOT NULL DEFAULT 0,
  `rutbe` int(11) NOT NULL DEFAULT 0,
  `kodes` int(11) NOT NULL DEFAULT 0,
  `ajail` int(11) NOT NULL DEFAULT 0,
  `ceza` int(11) NOT NULL DEFAULT 0,
  `cezaneden` varchar(512) CHARACTER SET latin5 NOT NULL DEFAULT '',
  `amfetamin` int(11) NOT NULL DEFAULT 0,
  `metamfetamin` int(11) NOT NULL DEFAULT 0,
  `lsd` int(11) NOT NULL DEFAULT 0,
  `extacy` int(11) NOT NULL DEFAULT 0,
  `eroin` int(11) NOT NULL DEFAULT 0,
  `kokain` int(11) NOT NULL DEFAULT 0,
  `morfin` int(11) NOT NULL DEFAULT 0,
  `MDA` int(11) NOT NULL DEFAULT 0,
  `ip` text CHARACTER SET utf8 NOT NULL,
  `kabartmatozu` int(11) NOT NULL DEFAULT 0,
  `eter` int(11) NOT NULL DEFAULT 0,
  `ephedrin` int(11) NOT NULL DEFAULT 0,
  `hperoksit` int(11) NOT NULL DEFAULT 0,
  `fasit` int(11) NOT NULL DEFAULT 0,
  `bos8` int(11) NOT NULL DEFAULT 0,
  `bos8mermi` int(11) NOT NULL DEFAULT 0,
  `bos9` int(11) NOT NULL DEFAULT 0,
  `bos9mermi` int(11) NOT NULL DEFAULT 0,
  `bos10` int(11) NOT NULL DEFAULT 0,
  `bos10mermi` int(11) NOT NULL DEFAULT 0,
  `telno` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `isbasi` int(11) NOT NULL DEFAULT 0,
  `isbasiskin` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `hesapno` int(11) NOT NULL DEFAULT 0,
  `banka` int(11) NOT NULL DEFAULT 0,
  `savings` int(11) NOT NULL DEFAULT 0,
  `paydakika` int(11) NOT NULL DEFAULT 60,
  `maske` int(11) NOT NULL DEFAULT 0,
  `maskeno` int(20) NOT NULL DEFAULT 0,
  `meslek` int(11) NOT NULL DEFAULT 0,
  `balik` int(11) NOT NULL DEFAULT 0,
  `yem` int(11) NOT NULL DEFAULT 0,
  `yemmiktar` int(11) NOT NULL DEFAULT 0,
  `olta` int(11) NOT NULL DEFAULT 0,
  `tester` int(11) DEFAULT 0,
  `sigara` int(11) NOT NULL DEFAULT 0,
  `k_sahibi` int(11) NOT NULL DEFAULT 0,
  `sonx` float NOT NULL,
  `sony` float NOT NULL,
  `sonz` float NOT NULL,
  `sonvw` int(11) NOT NULL,
  `sonint` int(11) NOT NULL,
  `bagimlimi` int(11) NOT NULL DEFAULT 0,
  `krizgeldimi` int(11) NOT NULL DEFAULT 0,
  `utedavidurum` int(11) NOT NULL DEFAULT 0,
  `aclik` int(11) NOT NULL DEFAULT 10,
  `susuzluk` int(11) NOT NULL DEFAULT 10,
  `tuvalet` int(11) NOT NULL DEFAULT 10,
  `anick` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'admin',
  `askin` int(11) NOT NULL DEFAULT 0,
  `ehliyet` int(11) NOT NULL DEFAULT 1,
  `rehber` varchar(32) CHARACTER SET latin5 NOT NULL,
  `kasseviye` int(11) NOT NULL DEFAULT 0,
  `kaspuan` int(11) NOT NULL DEFAULT 0,
  `girdi` int(11) NOT NULL DEFAULT 0,
  `grup` int(11) NOT NULL DEFAULT 0,
  `gps` int(11) NOT NULL DEFAULT 0,
  `box` int(11) NOT NULL DEFAULT 0,
  `kungfu` int(11) NOT NULL DEFAULT 0,
  `kneehead` int(11) NOT NULL DEFAULT 0,
  `grabkick` int(11) NOT NULL DEFAULT 0,
  `elbow` int(11) NOT NULL DEFAULT 0,
  `dovussure` int(20) NOT NULL DEFAULT 0,
  `matA` int(11) NOT NULL DEFAULT 0,
  `matB` int(11) NOT NULL DEFAULT 0,
  `matC` int(11) NOT NULL DEFAULT 0,
  `matD` int(11) NOT NULL DEFAULT 0,
  `matE` int(11) NOT NULL,
  `kokaintohum` int(11) NOT NULL DEFAULT 0,
  `erointohum` int(11) NOT NULL DEFAULT 0,
  `kiyafetler` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0|0|0',
  `benzinbidon` float NOT NULL DEFAULT 0,
  `bidon` int(11) NOT NULL DEFAULT 0,
  `tezgah` int(11) NOT NULL DEFAULT 0,
  `yem1` int(11) NOT NULL DEFAULT 0,
  `yem2` int(11) NOT NULL DEFAULT 0,
  `yem3` int(11) NOT NULL DEFAULT 0,
  `medisbasi` int(11) NOT NULL DEFAULT 0,
  `sisbasi` int(11) NOT NULL DEFAULT 0,
  `dil` int(11) NOT NULL DEFAULT -1,
  `kvw` int(11) NOT NULL DEFAULT -1,
  `unlu` int(11) NOT NULL DEFAULT 0,
  `rozetno` int(11) NOT NULL DEFAULT 0,
  `ehliyetno` int(11) NOT NULL DEFAULT 0,
  `alm` int(11) NOT NULL DEFAULT 0,
  `arp` int(11) NOT NULL DEFAULT 0,
  `cin` int(11) NOT NULL DEFAULT 0,
  `fra` int(11) NOT NULL DEFAULT 0,
  `isp` int(11) NOT NULL DEFAULT 0,
  `ita` int(11) NOT NULL DEFAULT 0,
  `japon` int(11) NOT NULL DEFAULT 0,
  `rus` int(11) NOT NULL DEFAULT 0,
  `ibra` int(11) NOT NULL DEFAULT 0,
  `yunan` int(11) NOT NULL DEFAULT 0,
  `ermen` int(11) NOT NULL DEFAULT 0,
  `slovak` int(11) NOT NULL DEFAULT 0,
  `irlan` int(11) NOT NULL DEFAULT 0,
  `porte` int(11) NOT NULL DEFAULT 0,
  `sirp` int(11) NOT NULL DEFAULT 0,
  `arnavut` int(11) NOT NULL DEFAULT 0,
  `dilsure` int(11) NOT NULL DEFAULT 0,
  `garajda` int(11) NOT NULL DEFAULT 0,
  `sruhsat` int(11) NOT NULL DEFAULT 0,
  `sruhsat2` int(11) NOT NULL DEFAULT 0,
  `soygunsure` int(11) NOT NULL DEFAULT 0,
  `kanama` int(11) NOT NULL DEFAULT 0,
  `telsiz` int(11) NOT NULL DEFAULT 0,
  `frekans` int(11) NOT NULL,
  `galeri` int(11) NOT NULL,
  `ssgaleri` int(11) NOT NULL,
  `gengelle` int(11) NOT NULL,
  `gozrenk` int(11) NOT NULL,
  `sacrenk` int(11) NOT NULL,
  `kilo` int(11) NOT NULL,
  `boy` int(11) NOT NULL,
  `ciu` int(11) NOT NULL,
  `kassure` int(11) NOT NULL,
  `uyari` int(11) NOT NULL,
  `saglikrapor` int(11) NOT NULL,
  `temizrapor` int(11) NOT NULL,
  `surucusinav` int(11) NOT NULL,
  `bmxizin` int(11) NOT NULL,
  `pmizin` int(11) NOT NULL,
  `notdefteri` int(11) NOT NULL,
  `dovme` varchar(512) CHARACTER SET latin5 NOT NULL,
  `songiris` varchar(512) CHARACTER SET utf8 NOT NULL,
  `bot` int(11) NOT NULL,
  `dogumyeri` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `dogumtarihi` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sifredegisme` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `guvenlikayari` int(11) NOT NULL,
  `guvenlikdurumu` int(11) NOT NULL,
  `crapor` int(11) NOT NULL DEFAULT 0,
  `srapor` int(11) NOT NULL DEFAULT 0,
  `csoru` int(11) NOT NULL DEFAULT 0,
  `ssoru` int(11) NOT NULL DEFAULT 0,
  `oyunsure` int(11) NOT NULL,
  `lspdsifre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Nickname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'Yok',
  `bitcoin` varchar(122) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  `bitcoinno` varchar(122) COLLATE utf8_turkish_ci NOT NULL DEFAULT 'bulunmamaktadır',
  `skin4` int(11) NOT NULL DEFAULT 335,
  `skin5` int(11) NOT NULL DEFAULT 336,
  `skin22` int(11) NOT NULL DEFAULT 346,
  `skin24` int(11) NOT NULL DEFAULT 348,
  `skin28` int(11) NOT NULL DEFAULT 352,
  `skin29` int(11) NOT NULL DEFAULT 353,
  `skin30` int(11) NOT NULL DEFAULT 355,
  `skin31` int(11) NOT NULL DEFAULT 356,
  `skin32` int(11) NOT NULL DEFAULT 372,
  `forumadmin` int(222) NOT NULL,
  `bakiye` varchar(255) COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  `oydurum` int(11) NOT NULL,
  `deaglealdi` int(11) NOT NULL DEFAULT 0,
  `pistolaldi` int(11) NOT NULL DEFAULT 0,
  `ozellik` int(11) NOT NULL DEFAULT 0,
  `liderlik` int(11) NOT NULL DEFAULT 0,
  `guc` int(11) NOT NULL DEFAULT 0,
  `pazarlik` int(11) NOT NULL DEFAULT 0,
  `ustalik` int(11) NOT NULL DEFAULT 0,
  `silahpayday` int(11) NOT NULL,
  `silahuretimid` int(11) NOT NULL,
  `multi` int(11) NOT NULL DEFAULT 0,
  `ck` int(11) NOT NULL DEFAULT 0,
  `fdisbasi` int(11) NOT NULL DEFAULT 0,
  `avukat` int(11) NOT NULL,
  `denizlisans` int(11) NOT NULL DEFAULT 0,
  `havalisans` int(11) NOT NULL DEFAULT 0,
  `yelek` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.karakterler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `karakterler` DISABLE KEYS */;
/*!40000 ALTER TABLE `karakterler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.karakterlerex
CREATE TABLE IF NOT EXISTS `karakterlerex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'Yakisikli',
  `sifre` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT 1742,
  `posy` int(11) NOT NULL DEFAULT -1860,
  `posz` int(11) NOT NULL DEFAULT 14,
  `interior` int(11) NOT NULL DEFAULT 0,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `para` int(11) NOT NULL DEFAULT 500,
  `skin` int(11) NOT NULL DEFAULT -1,
  `hp` float NOT NULL DEFAULT 100,
  `armor` float NOT NULL DEFAULT 0,
  `kimlikno` int(8) NOT NULL DEFAULT 0,
  `yas` int(11) NOT NULL DEFAULT 0,
  `cinsiyet` int(11) NOT NULL DEFAULT 0,
  `uyruk` int(11) NOT NULL DEFAULT 0,
  `adminlevel` int(11) NOT NULL DEFAULT 0,
  `kilit` int(3) NOT NULL DEFAULT 0,
  `neden` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '(Yok)',
  `chatstili` int(11) NOT NULL DEFAULT 0,
  `esrar` int(11) NOT NULL DEFAULT 0,
  `mantar` int(11) NOT NULL DEFAULT 0,
  `hammantar` int(11) NOT NULL DEFAULT 0,
  `usaksi` int(11) NOT NULL DEFAULT 0,
  `esrartohum` int(11) NOT NULL DEFAULT 0,
  `birlik` int(11) NOT NULL,
  `rutbe` int(11) NOT NULL,
  `kodes` int(11) NOT NULL DEFAULT 0,
  `ajail` int(11) NOT NULL DEFAULT 0,
  `ceza` int(11) NOT NULL DEFAULT 0,
  `cezaneden` varchar(512) CHARACTER SET utf8 NOT NULL,
  `amfetamin` int(11) NOT NULL DEFAULT 0,
  `metamfetamin` int(11) NOT NULL DEFAULT 0,
  `lsd` int(11) NOT NULL DEFAULT 0,
  `extacy` int(11) NOT NULL DEFAULT 0,
  `eroin` int(11) NOT NULL DEFAULT 0,
  `kokain` int(11) NOT NULL DEFAULT 0,
  `morfin` int(11) NOT NULL DEFAULT 0,
  `MDA` int(11) NOT NULL DEFAULT 0,
  `ip` text CHARACTER SET utf8 NOT NULL,
  `kabartmatozu` int(11) NOT NULL DEFAULT 0,
  `eter` int(11) NOT NULL DEFAULT 0,
  `ephedrin` int(11) NOT NULL DEFAULT 0,
  `hperoksit` int(11) NOT NULL DEFAULT 0,
  `fasit` int(11) NOT NULL DEFAULT 0,
  `bos8` int(11) NOT NULL,
  `bos8mermi` int(11) NOT NULL,
  `bos9` int(11) NOT NULL,
  `bos9mermi` int(11) NOT NULL,
  `bos10` int(11) NOT NULL,
  `bos10mermi` int(11) NOT NULL,
  `telno` varchar(11) CHARACTER SET utf8 DEFAULT '0',
  `isbasi` int(11) NOT NULL,
  `isbasiskin` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `hesapno` int(11) DEFAULT 0,
  `banka` int(11) DEFAULT 0,
  `savings` int(11) DEFAULT 0,
  `paydakika` int(11) DEFAULT 60,
  `maske` int(11) NOT NULL,
  `maskeno` int(20) NOT NULL,
  `meslek` int(11) NOT NULL DEFAULT 0,
  `balik` int(11) NOT NULL,
  `yem` int(11) NOT NULL,
  `yemmiktar` int(11) NOT NULL,
  `olta` int(11) NOT NULL DEFAULT 0,
  `tester` int(11) DEFAULT 0,
  `sigara` int(11) NOT NULL,
  `k_sahibi` int(11) NOT NULL,
  `sonx` float NOT NULL,
  `sony` float NOT NULL,
  `sonz` float NOT NULL,
  `sonvw` int(11) NOT NULL,
  `sonint` int(11) NOT NULL,
  `silah1` int(11) NOT NULL DEFAULT 0,
  `silah1mermi` int(11) NOT NULL DEFAULT 0,
  `silah2` int(11) NOT NULL DEFAULT 0,
  `silah2mermi` int(11) NOT NULL DEFAULT 0,
  `silah3` int(11) NOT NULL DEFAULT 0,
  `silah3mermi` int(11) NOT NULL DEFAULT 0,
  `silah4` int(11) NOT NULL DEFAULT 0,
  `silah4mermi` int(11) NOT NULL DEFAULT 0,
  `silah5` int(11) NOT NULL DEFAULT 0,
  `silah5mermi` int(11) NOT NULL DEFAULT 0,
  `silah6` int(11) NOT NULL DEFAULT 0,
  `silah6mermi` int(11) NOT NULL DEFAULT 0,
  `silah7` int(11) NOT NULL DEFAULT 0,
  `silah7mermi` int(11) NOT NULL DEFAULT 0,
  `silah8` int(11) NOT NULL DEFAULT 0,
  `silah8mermi` int(11) NOT NULL DEFAULT 0,
  `silah9` int(11) NOT NULL DEFAULT 0,
  `silah9mermi` int(11) NOT NULL DEFAULT 0,
  `silah10` int(11) NOT NULL DEFAULT 0,
  `silah10mermi` int(11) NOT NULL DEFAULT 0,
  `bagimlimi` int(11) NOT NULL DEFAULT 0,
  `krizgeldimi` int(11) NOT NULL DEFAULT 0,
  `utedavidurum` int(11) NOT NULL DEFAULT 0,
  `aclik` int(11) NOT NULL DEFAULT 10,
  `susuzluk` int(11) NOT NULL DEFAULT 10,
  `tuvalet` int(11) NOT NULL DEFAULT 10,
  `anick` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT 'admin',
  `askin` int(11) NOT NULL,
  `ehliyet` int(11) NOT NULL DEFAULT 0,
  `rehber` text CHARACTER SET utf8 NOT NULL,
  `kasseviye` int(11) NOT NULL DEFAULT 0,
  `kaspuan` int(11) NOT NULL DEFAULT 0,
  `girdi` int(11) NOT NULL,
  `grup` int(11) NOT NULL,
  `gps` int(11) NOT NULL DEFAULT 0,
  `box` int(11) NOT NULL DEFAULT 0,
  `kungfu` int(11) NOT NULL DEFAULT 0,
  `kneehead` int(11) NOT NULL DEFAULT 0,
  `grabkick` int(11) NOT NULL DEFAULT 0,
  `elbow` int(11) NOT NULL DEFAULT 0,
  `dovussure` int(20) NOT NULL DEFAULT 0,
  `matA` int(11) NOT NULL,
  `matB` int(11) NOT NULL,
  `matC` int(11) NOT NULL,
  `matD` int(11) NOT NULL,
  `kokaintohum` int(11) NOT NULL DEFAULT 0,
  `erointohum` int(11) NOT NULL DEFAULT 0,
  `kiyafetler` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0|0|0',
  `benzinbidon` float NOT NULL DEFAULT 0,
  `bidon` int(11) NOT NULL DEFAULT 0,
  `tezgah` int(11) NOT NULL DEFAULT 0,
  `yem1` int(11) NOT NULL DEFAULT 0,
  `yem2` int(11) NOT NULL DEFAULT 0,
  `yem3` int(11) NOT NULL DEFAULT 0,
  `medisbasi` int(11) NOT NULL DEFAULT 0,
  `sisbasi` int(11) NOT NULL DEFAULT 0,
  `dil` int(11) NOT NULL DEFAULT -1,
  `kvw` int(11) NOT NULL DEFAULT -1,
  `unlu` int(11) NOT NULL DEFAULT 0,
  `rozetno` int(11) NOT NULL DEFAULT 0,
  `ehliyetno` int(11) NOT NULL,
  `alm` int(11) NOT NULL DEFAULT 0,
  `arp` int(11) NOT NULL DEFAULT 0,
  `cin` int(11) NOT NULL DEFAULT 0,
  `fra` int(11) NOT NULL DEFAULT 0,
  `isp` int(11) NOT NULL DEFAULT 0,
  `ita` int(11) NOT NULL DEFAULT 0,
  `japon` int(11) NOT NULL DEFAULT 0,
  `rus` int(11) NOT NULL DEFAULT 0,
  `ibra` int(11) NOT NULL,
  `yunan` int(11) NOT NULL,
  `ermen` int(11) NOT NULL,
  `slovak` int(11) NOT NULL,
  `irlan` int(11) NOT NULL,
  `porte` int(11) NOT NULL,
  `sirp` int(11) NOT NULL,
  `arnavut` int(11) NOT NULL,
  `dilsure` int(11) NOT NULL DEFAULT 0,
  `garajda` int(11) NOT NULL DEFAULT 0,
  `sruhsat` int(11) NOT NULL DEFAULT 0,
  `sruhsat2` int(11) NOT NULL DEFAULT 0,
  `soygunsure` int(11) NOT NULL,
  `kanama` int(11) NOT NULL DEFAULT 0,
  `telsiz` int(11) NOT NULL DEFAULT 0,
  `frekans` int(11) NOT NULL,
  `galeri` int(11) NOT NULL,
  `ssgaleri` int(11) NOT NULL,
  `gengelle` int(11) NOT NULL,
  `gozrenk` int(11) NOT NULL,
  `sacrenk` int(11) NOT NULL,
  `kilo` int(11) NOT NULL,
  `boy` int(11) NOT NULL,
  `ciu` int(11) NOT NULL,
  `kassure` int(11) NOT NULL,
  `uyari` int(11) NOT NULL,
  `saglikrapor` int(11) NOT NULL,
  `temizrapor` int(11) NOT NULL,
  `surucusinav` int(11) NOT NULL,
  `bmxizin` int(11) NOT NULL,
  `pmizin` int(11) NOT NULL,
  `songiris` varchar(512) CHARACTER SET utf8 NOT NULL,
  `kFID` int(10) DEFAULT NULL,
  `kKID` int(10) DEFAULT NULL,
  `bot` int(11) NOT NULL,
  `dogumyeri` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `dogumtarihi` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sifredegisme` varchar(25) CHARACTER SET utf8 DEFAULT '0',
  `Nickname` varchar(255) CHARACTER SET utf8 DEFAULT 'Yok',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.karakterlerex: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `karakterlerex` DISABLE KEYS */;
/*!40000 ALTER TABLE `karakterlerex` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.lspdplog
CREATE TABLE IF NOT EXISTS `lspdplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sorgulatanmemur` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sorgu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.lspdplog: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `lspdplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `lspdplog` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.market-loglar
CREATE TABLE IF NOT EXISTS `market-loglar` (
  `Nickname` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `islem` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `aciklama` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `durum` int(11) NOT NULL DEFAULT 0,
  `tarih` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.market-loglar: ~1.554 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `market-loglar` DISABLE KEYS */;
/*!40000 ALTER TABLE `market-loglar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.mobilya
CREATE TABLE IF NOT EXISTS `mobilya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL DEFAULT 0,
  `x` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `y` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `z` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `rx` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `ry` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `rz` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `ox` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `oy` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `oz` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `orx` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `ory` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `orz` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `int` int(11) NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `texture1` int(11) NOT NULL DEFAULT 0,
  `texture2` int(11) NOT NULL DEFAULT 0,
  `texturerenk1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `texturerenk2` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `aracid` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.mobilya: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `mobilya` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobilya` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.notdefteri
CREATE TABLE IF NOT EXISTS `notdefteri` (
  `sqlid` int(11) NOT NULL,
  `sayfa` int(11) NOT NULL,
  `not` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.notdefteri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `notdefteri` DISABLE KEYS */;
/*!40000 ALTER TABLE `notdefteri` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.objeler
CREATE TABLE IF NOT EXISTS `objeler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `vworld` int(11) NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `tmodel` int(11) NOT NULL DEFAULT 0,
  `tname1` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tname2` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.objeler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `objeler` DISABLE KEYS */;
/*!40000 ALTER TABLE `objeler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.oochapis
CREATE TABLE IF NOT EXISTS `oochapis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(64) CHARACTER SET latin1 NOT NULL,
  `nick` varchar(64) CHARACTER SET latin1 NOT NULL,
  `sebep` varchar(255) CHARACTER SET latin5 NOT NULL,
  `sure` int(11) NOT NULL,
  `tarih` varchar(64) CHARACTER SET latin5 NOT NULL,
  `yonetici` varchar(32) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.oochapis: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `oochapis` DISABLE KEYS */;
/*!40000 ALTER TABLE `oochapis` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.piyango
CREATE TABLE IF NOT EXISTS `piyango` (
  `sqlid` int(11) NOT NULL,
  `piyangono` int(11) NOT NULL,
  `tip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.piyango: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `piyango` DISABLE KEYS */;
/*!40000 ALTER TABLE `piyango` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.raporlar
CREATE TABLE IF NOT EXISTS `raporlar` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `tarih` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `memur` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `islem` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rutbe` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ekip` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ekipuye` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `zanli` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `suc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rapor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.raporlar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `raporlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `raporlar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.rehber
CREATE TABLE IF NOT EXISTS `rehber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oyuncuID` int(11) NOT NULL,
  `rehberIsim` varchar(255) CHARACTER SET latin5 NOT NULL DEFAULT '(Yok)',
  `rehberNumara` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.rehber: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `rehber` DISABLE KEYS */;
/*!40000 ALTER TABLE `rehber` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.rorscase
CREATE TABLE IF NOT EXISTS `rorscase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sahip` int(11) NOT NULL DEFAULT -1,
  `cx` float NOT NULL,
  `cy` float NOT NULL,
  `cz` float NOT NULL,
  `sifre` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  `para` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `vworld` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.rorscase: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `rorscase` DISABLE KEYS */;
/*!40000 ALTER TABLE `rorscase` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.sabikaydi
CREATE TABLE IF NOT EXISTS `sabikaydi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucluid` int(11) NOT NULL,
  `isim` varchar(24) COLLATE utf8_turkish_ci NOT NULL,
  `suc` varchar(224) CHARACTER SET latin5 NOT NULL,
  `tarih` varchar(24) COLLATE utf8_turkish_ci NOT NULL,
  `timestamp` int(15) NOT NULL,
  `tutuklayan` varchar(24) COLLATE utf8_turkish_ci NOT NULL,
  `tutukid` int(11) NOT NULL,
  `nick` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.sabikaydi: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `sabikaydi` DISABLE KEYS */;
/*!40000 ALTER TABLE `sabikaydi` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.secim
CREATE TABLE IF NOT EXISTS `secim` (
  `secid` int(11) NOT NULL,
  `sarah` int(255) DEFAULT NULL,
  `marshall` int(255) DEFAULT NULL,
  PRIMARY KEY (`secid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.secim: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `secim` DISABLE KEYS */;
/*!40000 ALTER TABLE `secim` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.silah
CREATE TABLE IF NOT EXISTS `silah` (
  `no` int(11) NOT NULL,
  `silahid` int(11) NOT NULL,
  `mermi` int(11) NOT NULL,
  `oyuncuid` int(11) NOT NULL,
  `tip` int(11) NOT NULL DEFAULT 0,
  `durum` int(11) NOT NULL DEFAULT 1,
  `ruhsat` int(11) NOT NULL DEFAULT 0,
  `veren` int(11) NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.silah: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `silah` DISABLE KEYS */;
/*!40000 ALTER TABLE `silah` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.silahlar
CREATE TABLE IF NOT EXISTS `silahlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay` text CHARACTER SET utf8 NOT NULL,
  `no` int(20) unsigned NOT NULL DEFAULT 0,
  `bnick` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.silahlar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `silahlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `silahlar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.silahyer
CREATE TABLE IF NOT EXISTS `silahyer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syposx` float NOT NULL,
  `syposy` float NOT NULL,
  `syposz` float NOT NULL,
  `syvworld` int(11) NOT NULL,
  `syinterior` int(11) NOT NULL,
  `angle` float NOT NULL DEFAULT 0,
  `sysilah` int(11) NOT NULL,
  `symermi` int(11) NOT NULL,
  `posrx` float NOT NULL,
  `posry` float NOT NULL,
  `posrz` float NOT NULL,
  `no` int(11) NOT NULL,
  `oyuncuid` int(11) NOT NULL,
  PRIMARY KEY (`id`,`no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.silahyer: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `silahyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `silahyer` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.skins
CREATE TABLE IF NOT EXISTS `skins` (
  `sqlID` int(6) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `glockBlack` int(6) NOT NULL,
  `glockGold` int(6) NOT NULL,
  `deagleGold` int(6) NOT NULL,
  `deagleSilver` int(6) NOT NULL,
  `ak47Gold` int(6) NOT NULL,
  `ak47Silver` int(6) NOT NULL,
  `ak47Black` int(6) NOT NULL,
  `balta` int(6) NOT NULL,
  `kabarGold` int(6) NOT NULL,
  PRIMARY KEY (`sqlID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.skins: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `skins` DISABLE KEYS */;
/*!40000 ALTER TABLE `skins` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.sorular
CREATE TABLE IF NOT EXISTS `sorular` (
  `id` int(11) NOT NULL,
  `soru` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `cevap_1` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `cevap_2` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `cevap_3` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `cevap_4` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `cevap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.sorular: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `sorular` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorular` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.sportgaleri
CREATE TABLE IF NOT EXISTS `sportgaleri` (
  `aracid` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL,
  PRIMARY KEY (`aracid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.sportgaleri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `sportgaleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `sportgaleri` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.telefoncekim
CREATE TABLE IF NOT EXISTS `telefoncekim` (
  `uniqueid` int(11) NOT NULL AUTO_INCREMENT,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `mesafe` float NOT NULL,
  PRIMARY KEY (`uniqueid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.telefoncekim: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `telefoncekim` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefoncekim` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.uyarilar
CREATE TABLE IF NOT EXISTS `uyarilar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(32) CHARACTER SET latin1 NOT NULL,
  `nick` varchar(32) CHARACTER SET latin1 NOT NULL,
  `yonetici` varchar(32) CHARACTER SET latin1 NOT NULL,
  `sebep` varchar(255) CHARACTER SET latin5 NOT NULL,
  `tarih` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.uyarilar: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `uyarilar` DISABLE KEYS */;
/*!40000 ALTER TABLE `uyarilar` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.uyusturucular
CREATE TABLE IF NOT EXISTS `uyusturucular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip` int(11) NOT NULL,
  `durum` int(11) NOT NULL,
  `dakika` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `interior` int(11) NOT NULL,
  `vworld` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.uyusturucular: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `uyusturucular` DISABLE KEYS */;
/*!40000 ALTER TABLE `uyusturucular` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.veriler
CREATE TABLE IF NOT EXISTS `veriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gdurum` int(11) NOT NULL,
  `gposx` float NOT NULL,
  `gposy` float NOT NULL,
  `gposz` float NOT NULL,
  `tiX` float NOT NULL,
  `tiY` float NOT NULL,
  `tiZ` float NOT NULL,
  `tX` float NOT NULL,
  `tY` float NOT NULL,
  `tZ` float NOT NULL,
  `tint` int(11) NOT NULL,
  `tvw` int(11) NOT NULL,
  `isbasiX` float NOT NULL,
  `isbasiY` float NOT NULL,
  `isbasiZ` float NOT NULL,
  `isbasint` int(11) NOT NULL,
  `isbasivw` int(11) NOT NULL,
  `sevkX` float NOT NULL,
  `sevkY` float NOT NULL,
  `sevkZ` float NOT NULL,
  `sevkint` int(11) NOT NULL,
  `sevkvw` int(11) NOT NULL,
  `balikX` float NOT NULL DEFAULT 0,
  `balikY` float NOT NULL DEFAULT 0,
  `balikZ` float NOT NULL DEFAULT 0,
  `bankX` float NOT NULL,
  `bankY` float NOT NULL,
  `bankZ` float NOT NULL,
  `bankint` int(11) NOT NULL,
  `bankvw` int(11) NOT NULL,
  `taksiX` float NOT NULL,
  `taksiY` float NOT NULL,
  `taksiZ` float NOT NULL,
  `reklamX` float NOT NULL,
  `reklamY` float NOT NULL,
  `reklamZ` float NOT NULL,
  `reklamint` int(11) NOT NULL,
  `tezgahX` float NOT NULL,
  `tezgahY` float NOT NULL,
  `tezgahZ` float NOT NULL,
  `tezgahint` int(11) NOT NULL,
  `ekipmanx` float NOT NULL,
  `ekipmany` float NOT NULL,
  `ekipmanz` float NOT NULL,
  `ekipmanint` int(11) NOT NULL,
  `ekipmanvw` int(11) NOT NULL,
  `pizzaX` float NOT NULL,
  `pizzaY` float NOT NULL,
  `pizzaZ` float NOT NULL,
  `alkolfiyat` int(11) NOT NULL,
  `yiyecekfiyat` int(11) NOT NULL,
  `ickifiyat` int(11) NOT NULL,
  `benzinfiyat` int(11) NOT NULL,
  `ehliyetX` float NOT NULL,
  `ehliyetY` float NOT NULL,
  `ehliyetZ` float NOT NULL,
  `aracsicilX` float NOT NULL,
  `aracsicilY` float NOT NULL,
  `aracsicilZ` float NOT NULL,
  `otobusX` float NOT NULL,
  `otobusY` float NOT NULL,
  `otobusZ` float NOT NULL,
  `paintX` float NOT NULL,
  `paintY` float NOT NULL,
  `paintZ` float NOT NULL,
  `balikfiyat` int(11) NOT NULL,
  `cctvx` float NOT NULL,
  `cctvy` float NOT NULL,
  `cctvz` float NOT NULL,
  `cctvint` int(11) NOT NULL,
  `cctvvw` int(11) NOT NULL,
  `aractahta` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aractahtax` float NOT NULL,
  `aractahtay` float NOT NULL,
  `aractahtaz` float NOT NULL,
  `aractahtarz` float NOT NULL,
  `aractahtaint` int(11) NOT NULL,
  `aractahtavw` int(11) NOT NULL,
  `aractahtayazix` float NOT NULL,
  `aractahtayaziy` float NOT NULL,
  `aractahtayaziz` float NOT NULL,
  `basvuru` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.veriler: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `veriler` DISABLE KEYS */;
/*!40000 ALTER TABLE `veriler` ENABLE KEYS */;

-- tablo yapısı dökülüyor samp.yetkililer
CREATE TABLE IF NOT EXISTS `yetkililer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(128) CHARACTER SET utf8 NOT NULL,
  `sifre` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

-- samp.yetkililer: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `yetkililer` DISABLE KEYS */;
/*!40000 ALTER TABLE `yetkililer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
