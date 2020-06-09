#define IsPlayerLoggedIn(%0) Girdi[%0]
#define IsAdminLoggedIn(%0) Karakter[%0][aGirdi]
#define GetPlayerAdminLevel(%0) Karakter[%0][adminlevel]
#define GetPlayerHelperLevel(%0) Karakter[%0][tester]
#define GetPlayerLevel(%0) Karakter[%0][level]
#define IsPlayerMasked(%0) Maske[%0]
#define IsPlayerFBIMasked(%0) Maske2[%0]
#define GetPlayerFactionType(%0) Birlik[Karakter[%0][birlik]][ftip]

#define HAVAARAC_POS_X 1506.4270
#define HAVAARAC_POS_Y -2636.1958
#define HAVAARAC_POS_Z 16.7551

#define MAX_BENZIN_ISTASYONU 30
#define MAX_ISYERI 2000
#define MAX_EV 2000
#define MAX_BIRLIK 500
#define MAX_GRAFFITI 600
#define MAX_DRUGS 1000
#define MAX_ATM 100
#define MAX_GRUP 250
#define MAX_REHBER_LIST (80)
#define MAX_INTERIORS 300
#define MAX_STANDS 150
#define MAX_ZONE_NAME 28
#define MAX_SILAH 5000
#define MAX_SOYGUN 150
#define MAX_NPC 200
#define MAX_IHBAR 25
#define MAX_MDCARANMA 100
#define MAX_OBJE 500
#define MAX_ANKESORLU_TELEFON 100
#define MAX_EKIP 100

#define MENU_MODEL 1
#define MENU_MODEL2 2
#define MENU_SKIN_SEC1 3
#define MENU_SKIN_SEC2 4
#define MENU_SOYUN_ERKEK 5
#define MENU_SOYUN_KADIN 6

#define NOKTA "•"
#define CIZGI "»"
#define CIZGI1 "›"
#define YILDIZ "*"
#define DOLAR "{85bb65}"

#define CINSIYET_ERKEK 1
#define CINSIYET_KADIN 2

#define BILGI_MESAJ 1
#define HATA_MESAJ 2
#define IPUCU_MESAJ 3
#define KULLANIM_MESAJ 4

#define function%0(%1) forward%0(%1);public%0(%1)

#define DIL_INGILIZCE 0
#define DIL_ALMANCA 1
#define DIL_ARAPCA 2
#define DIL_CINCE 3
#define DIL_FRANSIZCA 4
#define DIL_ISPANYOLCA 5
#define DIL_ITALYANCA 6
#define DIL_JAPONCA 7
#define DIL_RUSCA 8
#define DIL_IBRANICE 9
#define DIL_YUNANCA 10
#define DIL_ERMENICE 11
#define DIL_SLOVAKCA 12
#define DIL_IRLANDACA 13
#define DIL_PORTEKIZCE 14
#define DIL_SIRPCA 15
#define DIL_ARNAVUTCA 16

#define LSPD 1
#define ASMS 2
#define SANTV 3
#define MODIFIYE 4
#define GALERI 5
#define FBI 6
#define NAKLIYE 7
#define LEGAL 8
#define CETE 9
#define MAFYA 10
#define DOVUS 11
#define LSPA 12
#define YARIS 13
#define ARAC_HIRSIZ 14
#define LSFD 15
#define MC 16

#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
#define KEY_AIM (128)

#include "src/utils/colors.pwn"