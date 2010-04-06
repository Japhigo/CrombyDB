\qecho Inserting ISO 3166 Country codes...

select rlm.register_component ( 'CIN', 'ins_countries.sql' );

begin;
insert into cin.countries ( country, country_code ) values ( 'AFGHANISTAN','AF' );
insert into cin.countries ( country, country_code ) values ( 'ÅLAND ISLANDS','AX' );
insert into cin.countries ( country, country_code ) values ( 'ALBANIA','AL' );
insert into cin.countries ( country, country_code ) values ( 'ALGERIA','DZ' );
insert into cin.countries ( country, country_code ) values ( 'AMERICAN SAMOA','AS' );
insert into cin.countries ( country, country_code ) values ( 'ANDORRA','AD' );
insert into cin.countries ( country, country_code ) values ( 'ANGOLA','AO' );
insert into cin.countries ( country, country_code ) values ( 'ANGUILLA','AI' );
insert into cin.countries ( country, country_code ) values ( 'ANTARCTICA','AQ' );
insert into cin.countries ( country, country_code ) values ( 'ANTIGUA AND BARBUDA','AG' );
insert into cin.countries ( country, country_code ) values ( 'ARGENTINA','AR' );
insert into cin.countries ( country, country_code ) values ( 'ARMENIA','AM' );
insert into cin.countries ( country, country_code ) values ( 'ARUBA','AW' );
insert into cin.countries ( country, country_code ) values ( 'AUSTRALIA','AU' );
insert into cin.countries ( country, country_code ) values ( 'AUSTRIA','AT' );
insert into cin.countries ( country, country_code ) values ( 'AZERBAIJAN','AZ' );
insert into cin.countries ( country, country_code ) values ( 'BAHAMAS','BS' );
insert into cin.countries ( country, country_code ) values ( 'BAHRAIN','BH' );
insert into cin.countries ( country, country_code ) values ( 'BANGLADESH','BD' );
insert into cin.countries ( country, country_code ) values ( 'BARBADOS','BB' );
insert into cin.countries ( country, country_code ) values ( 'BELARUS','BY' );
insert into cin.countries ( country, country_code ) values ( 'BELGIUM','BE' );
insert into cin.countries ( country, country_code ) values ( 'BELIZE','BZ' );
insert into cin.countries ( country, country_code ) values ( 'BENIN','BJ' );
insert into cin.countries ( country, country_code ) values ( 'BERMUDA','BM' );
insert into cin.countries ( country, country_code ) values ( 'BHUTAN','BT' );
insert into cin.countries ( country, country_code ) values ( 'BOLIVIA','BO' );
insert into cin.countries ( country, country_code ) values ( 'BOSNIA AND HERZEGOVINA','BA' );
insert into cin.countries ( country, country_code ) values ( 'BOTSWANA','BW' );
insert into cin.countries ( country, country_code ) values ( 'BOUVET ISLAND','BV' );
insert into cin.countries ( country, country_code ) values ( 'BRAZIL','BR' );
insert into cin.countries ( country, country_code ) values ( 'BRITISH INDIAN OCEAN TERRITORY','IO' );
insert into cin.countries ( country, country_code ) values ( 'BRUNEI DARUSSALAM','BN' );
insert into cin.countries ( country, country_code ) values ( 'BULGARIA','BG' );
insert into cin.countries ( country, country_code ) values ( 'BURKINA FASO','BF' );
insert into cin.countries ( country, country_code ) values ( 'BURUNDI','BI' );
insert into cin.countries ( country, country_code ) values ( 'CAMBODIA','KH' );
insert into cin.countries ( country, country_code ) values ( 'CAMEROON','CM' );
insert into cin.countries ( country, country_code ) values ( 'CANADA','CA' );
insert into cin.countries ( country, country_code ) values ( 'CAPE VERDE','CV' );
insert into cin.countries ( country, country_code ) values ( 'CAYMAN ISLANDS','KY' );
insert into cin.countries ( country, country_code ) values ( 'CENTRAL AFRICAN REPUBLIC','CF' );
insert into cin.countries ( country, country_code ) values ( 'CHAD','TD' );
insert into cin.countries ( country, country_code ) values ( 'CHILE','CL' );
insert into cin.countries ( country, country_code ) values ( 'CHINA','CN' );
insert into cin.countries ( country, country_code ) values ( 'CHRISTMAS ISLAND','CX' );
insert into cin.countries ( country, country_code ) values ( 'COCOS (KEELING) ISLANDS','CC' );
insert into cin.countries ( country, country_code ) values ( 'COLOMBIA','CO' );
insert into cin.countries ( country, country_code ) values ( 'COMOROS','KM' );
insert into cin.countries ( country, country_code ) values ( 'CONGO','CG' );
insert into cin.countries ( country, country_code ) values ( 'CONGO, THE DEMOCRATIC REPUBLIC OF THE','CD' );
insert into cin.countries ( country, country_code ) values ( 'COOK ISLANDS','CK' );
insert into cin.countries ( country, country_code ) values ( 'COSTA RICA','CR' );
insert into cin.countries ( country, country_code ) values ( 'CÔTE D''IVOIRE','CI' );
insert into cin.countries ( country, country_code ) values ( 'CROATIA','HR' );
insert into cin.countries ( country, country_code ) values ( 'CUBA','CU' );
insert into cin.countries ( country, country_code ) values ( 'CYPRUS','CY' );
insert into cin.countries ( country, country_code ) values ( 'CZECH REPUBLIC','CZ' );
insert into cin.countries ( country, country_code ) values ( 'DENMARK','DK' );
insert into cin.countries ( country, country_code ) values ( 'DJIBOUTI','DJ' );
insert into cin.countries ( country, country_code ) values ( 'DOMINICA','DM' );
insert into cin.countries ( country, country_code ) values ( 'DOMINICAN REPUBLIC','DO' );
insert into cin.countries ( country, country_code ) values ( 'ECUADOR','EC' );
insert into cin.countries ( country, country_code ) values ( 'EGYPT','EG' );
insert into cin.countries ( country, country_code ) values ( 'EL SALVADOR','SV' );
insert into cin.countries ( country, country_code ) values ( 'EQUATORIAL GUINEA','GQ' );
insert into cin.countries ( country, country_code ) values ( 'ERITREA','ER' );
insert into cin.countries ( country, country_code ) values ( 'ESTONIA','EE' );
insert into cin.countries ( country, country_code ) values ( 'ETHIOPIA','ET' );
insert into cin.countries ( country, country_code ) values ( 'FALKLAND ISLANDS (MALVINAS)','FK' );
insert into cin.countries ( country, country_code ) values ( 'FAROE ISLANDS','FO' );
insert into cin.countries ( country, country_code ) values ( 'FIJI','FJ' );
insert into cin.countries ( country, country_code ) values ( 'FINLAND','FI' );
insert into cin.countries ( country, country_code ) values ( 'FRANCE','FR' );
insert into cin.countries ( country, country_code ) values ( 'FRENCH GUIANA','GF' );
insert into cin.countries ( country, country_code ) values ( 'FRENCH POLYNESIA','PF' );
insert into cin.countries ( country, country_code ) values ( 'FRENCH SOUTHERN TERRITORIES','TF' );
insert into cin.countries ( country, country_code ) values ( 'GABON','GA' );
insert into cin.countries ( country, country_code ) values ( 'GAMBIA','GM' );
insert into cin.countries ( country, country_code ) values ( 'GEORGIA','GE' );
insert into cin.countries ( country, country_code ) values ( 'GERMANY','DE' );
insert into cin.countries ( country, country_code ) values ( 'GHANA','GH' );
insert into cin.countries ( country, country_code ) values ( 'GIBRALTAR','GI' );
insert into cin.countries ( country, country_code ) values ( 'GREECE','GR' );
insert into cin.countries ( country, country_code ) values ( 'GREENLAND','GL' );
insert into cin.countries ( country, country_code ) values ( 'GRENADA','GD' );
insert into cin.countries ( country, country_code ) values ( 'GUADELOUPE','GP' );
insert into cin.countries ( country, country_code ) values ( 'GUAM','GU' );
insert into cin.countries ( country, country_code ) values ( 'GUATEMALA','GT' );
insert into cin.countries ( country, country_code ) values ( 'GUERNSEY','GG' );
insert into cin.countries ( country, country_code ) values ( 'GUINEA','GN' );
insert into cin.countries ( country, country_code ) values ( 'GUINEA-BISSAU','GW' );
insert into cin.countries ( country, country_code ) values ( 'GUYANA','GY' );
insert into cin.countries ( country, country_code ) values ( 'HAITI','HT' );
insert into cin.countries ( country, country_code ) values ( 'HEARD ISLAND AND MCDONALD ISLANDS','HM' );
insert into cin.countries ( country, country_code ) values ( 'HOLY SEE (VATICAN CITY STATE)','VA' );
insert into cin.countries ( country, country_code ) values ( 'HONDURAS','HN' );
insert into cin.countries ( country, country_code ) values ( 'HONG KONG','HK' );
insert into cin.countries ( country, country_code ) values ( 'HUNGARY','HU' );
insert into cin.countries ( country, country_code ) values ( 'ICELAND','IS' );
insert into cin.countries ( country, country_code ) values ( 'INDIA','IN' );
insert into cin.countries ( country, country_code ) values ( 'INDONESIA','ID' );
insert into cin.countries ( country, country_code ) values ( 'IRAN, ISLAMIC REPUBLIC OF','IR' );
insert into cin.countries ( country, country_code ) values ( 'IRAQ','IQ' );
insert into cin.countries ( country, country_code ) values ( 'IRELAND','IE' );
insert into cin.countries ( country, country_code ) values ( 'ISLE OF MAN','IM' );
insert into cin.countries ( country, country_code ) values ( 'ISRAEL','IL' );
insert into cin.countries ( country, country_code ) values ( 'ITALY','IT' );
insert into cin.countries ( country, country_code ) values ( 'JAMAICA','JM' );
insert into cin.countries ( country, country_code ) values ( 'JAPAN','JP' );
insert into cin.countries ( country, country_code ) values ( 'JERSEY','JE' );
insert into cin.countries ( country, country_code ) values ( 'JORDAN','JO' );
insert into cin.countries ( country, country_code ) values ( 'KAZAKHSTAN','KZ' );
insert into cin.countries ( country, country_code ) values ( 'KENYA','KE' );
insert into cin.countries ( country, country_code ) values ( 'KIRIBATI','KI' );
insert into cin.countries ( country, country_code ) values ( 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF','KP' );
insert into cin.countries ( country, country_code ) values ( 'KOREA, REPUBLIC OF','KR' );
insert into cin.countries ( country, country_code ) values ( 'KUWAIT','KW' );
insert into cin.countries ( country, country_code ) values ( 'KYRGYZSTAN','KG' );
insert into cin.countries ( country, country_code ) values ( 'LAO PEOPLE''S DEMOCRATIC REPUBLIC','LA' );
insert into cin.countries ( country, country_code ) values ( 'LATVIA','LV' );
insert into cin.countries ( country, country_code ) values ( 'LEBANON','LB' );
insert into cin.countries ( country, country_code ) values ( 'LESOTHO','LS' );
insert into cin.countries ( country, country_code ) values ( 'LIBERIA','LR' );
insert into cin.countries ( country, country_code ) values ( 'LIBYAN ARAB JAMAHIRIYA','LY' );
insert into cin.countries ( country, country_code ) values ( 'LIECHTENSTEIN','LI' );
insert into cin.countries ( country, country_code ) values ( 'LITHUANIA','LT' );
insert into cin.countries ( country, country_code ) values ( 'LUXEMBOURG','LU' );
insert into cin.countries ( country, country_code ) values ( 'MACAO','MO' );
insert into cin.countries ( country, country_code ) values ( 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','MK' );
insert into cin.countries ( country, country_code ) values ( 'MADAGASCAR','MG' );
insert into cin.countries ( country, country_code ) values ( 'MALAWI','MW' );
insert into cin.countries ( country, country_code ) values ( 'MALAYSIA','MY' );
insert into cin.countries ( country, country_code ) values ( 'MALDIVES','MV' );
insert into cin.countries ( country, country_code ) values ( 'MALI','ML' );
insert into cin.countries ( country, country_code ) values ( 'MALTA','MT' );
insert into cin.countries ( country, country_code ) values ( 'MARSHALL ISLANDS','MH' );
insert into cin.countries ( country, country_code ) values ( 'MARTINIQUE','MQ' );
insert into cin.countries ( country, country_code ) values ( 'MAURITANIA','MR' );
insert into cin.countries ( country, country_code ) values ( 'MAURITIUS','MU' );
insert into cin.countries ( country, country_code ) values ( 'MAYOTTE','YT' );
insert into cin.countries ( country, country_code ) values ( 'MEXICO','MX' );
insert into cin.countries ( country, country_code ) values ( 'MICRONESIA, FEDERATED STATES OF','FM' );
insert into cin.countries ( country, country_code ) values ( 'MOLDOVA, REPUBLIC OF','MD' );
insert into cin.countries ( country, country_code ) values ( 'MONACO','MC' );
insert into cin.countries ( country, country_code ) values ( 'MONGOLIA','MN' );
insert into cin.countries ( country, country_code ) values ( 'MONTENEGRO','ME' );
insert into cin.countries ( country, country_code ) values ( 'MONTSERRAT','MS' );
insert into cin.countries ( country, country_code ) values ( 'MOROCCO','MA' );
insert into cin.countries ( country, country_code ) values ( 'MOZAMBIQUE','MZ' );
insert into cin.countries ( country, country_code ) values ( 'MYANMAR','MM' );
insert into cin.countries ( country, country_code ) values ( 'NAMIBIA','NA' );
insert into cin.countries ( country, country_code ) values ( 'NAURU','NR' );
insert into cin.countries ( country, country_code ) values ( 'NEPAL','NP' );
insert into cin.countries ( country, country_code ) values ( 'NETHERLANDS','NL' );
insert into cin.countries ( country, country_code ) values ( 'NETHERLANDS ANTILLES','AN' );
insert into cin.countries ( country, country_code ) values ( 'NEW CALEDONIA','NC' );
insert into cin.countries ( country, country_code ) values ( 'NEW ZEALAND','NZ' );
insert into cin.countries ( country, country_code ) values ( 'NICARAGUA','NI' );
insert into cin.countries ( country, country_code ) values ( 'NIGER','NE' );
insert into cin.countries ( country, country_code ) values ( 'NIGERIA','NG' );
insert into cin.countries ( country, country_code ) values ( 'NIUE','NU' );
insert into cin.countries ( country, country_code ) values ( 'NORFOLK ISLAND','NF' );
insert into cin.countries ( country, country_code ) values ( 'NORTHERN MARIANA ISLANDS','MP' );
insert into cin.countries ( country, country_code ) values ( 'NORWAY','NO' );
insert into cin.countries ( country, country_code ) values ( 'OMAN','OM' );
insert into cin.countries ( country, country_code ) values ( 'PAKISTAN','PK' );
insert into cin.countries ( country, country_code ) values ( 'PALAU','PW' );
insert into cin.countries ( country, country_code ) values ( 'PALESTINIAN TERRITORY, OCCUPIED','PS' );
insert into cin.countries ( country, country_code ) values ( 'PANAMA','PA' );
insert into cin.countries ( country, country_code ) values ( 'PAPUA NEW GUINEA','PG' );
insert into cin.countries ( country, country_code ) values ( 'PARAGUAY','PY' );
insert into cin.countries ( country, country_code ) values ( 'PERU','PE' );
insert into cin.countries ( country, country_code ) values ( 'PHILIPPINES','PH' );
insert into cin.countries ( country, country_code ) values ( 'PITCAIRN','PN' );
insert into cin.countries ( country, country_code ) values ( 'POLAND','PL' );
insert into cin.countries ( country, country_code ) values ( 'PORTUGAL','PT' );
insert into cin.countries ( country, country_code ) values ( 'PUERTO RICO','PR' );
insert into cin.countries ( country, country_code ) values ( 'QATAR','QA' );
insert into cin.countries ( country, country_code ) values ( 'RÉUNION','RE' );
insert into cin.countries ( country, country_code ) values ( 'ROMANIA','RO' );
insert into cin.countries ( country, country_code ) values ( 'RUSSIAN FEDERATION','RU' );
insert into cin.countries ( country, country_code ) values ( 'RWANDA','RW' );
insert into cin.countries ( country, country_code ) values ( 'SAINT BARTHÉLEMY','BL' );
insert into cin.countries ( country, country_code ) values ( 'SAINT HELENA','SH' );
insert into cin.countries ( country, country_code ) values ( 'SAINT KITTS AND NEVIS','KN' );
insert into cin.countries ( country, country_code ) values ( 'SAINT LUCIA','LC' );
insert into cin.countries ( country, country_code ) values ( 'SAINT MARTIN','MF' );
insert into cin.countries ( country, country_code ) values ( 'SAINT PIERRE AND MIQUELON','PM' );
insert into cin.countries ( country, country_code ) values ( 'SAINT VINCENT AND THE GRENADINES','VC' );
insert into cin.countries ( country, country_code ) values ( 'SAMOA','WS' );
insert into cin.countries ( country, country_code ) values ( 'SAN MARINO','SM' );
insert into cin.countries ( country, country_code ) values ( 'SAO TOME AND PRINCIPE','ST' );
insert into cin.countries ( country, country_code ) values ( 'SAUDI ARABIA','SA' );
insert into cin.countries ( country, country_code ) values ( 'SENEGAL','SN' );
insert into cin.countries ( country, country_code ) values ( 'SERBIA','RS' );
insert into cin.countries ( country, country_code ) values ( 'SEYCHELLES','SC' );
insert into cin.countries ( country, country_code ) values ( 'SIERRA LEONE','SL' );
insert into cin.countries ( country, country_code ) values ( 'SINGAPORE','SG' );
insert into cin.countries ( country, country_code ) values ( 'SLOVAKIA','SK' );
insert into cin.countries ( country, country_code ) values ( 'SLOVENIA','SI' );
insert into cin.countries ( country, country_code ) values ( 'SOLOMON ISLANDS','SB' );
insert into cin.countries ( country, country_code ) values ( 'SOMALIA','SO' );
insert into cin.countries ( country, country_code ) values ( 'SOUTH AFRICA','ZA' );
insert into cin.countries ( country, country_code ) values ( 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','GS' );
insert into cin.countries ( country, country_code ) values ( 'SPAIN','ES' );
insert into cin.countries ( country, country_code ) values ( 'SRI LANKA','LK' );
insert into cin.countries ( country, country_code ) values ( 'SUDAN','SD' );
insert into cin.countries ( country, country_code ) values ( 'SURINAME','SR' );
insert into cin.countries ( country, country_code ) values ( 'SVALBARD AND JAN MAYEN','SJ' );
insert into cin.countries ( country, country_code ) values ( 'SWAZILAND','SZ' );
insert into cin.countries ( country, country_code ) values ( 'SWEDEN','SE' );
insert into cin.countries ( country, country_code ) values ( 'SWITZERLAND','CH' );
insert into cin.countries ( country, country_code ) values ( 'SYRIAN ARAB REPUBLIC','SY' );
insert into cin.countries ( country, country_code ) values ( 'TAIWAN, PROVINCE OF CHINA','TW' );
insert into cin.countries ( country, country_code ) values ( 'TAJIKISTAN','TJ' );
insert into cin.countries ( country, country_code ) values ( 'TANZANIA, UNITED REPUBLIC OF','TZ' );
insert into cin.countries ( country, country_code ) values ( 'THAILAND','TH' );
insert into cin.countries ( country, country_code ) values ( 'TIMOR-LESTE','TL' );
insert into cin.countries ( country, country_code ) values ( 'TOGO','TG' );
insert into cin.countries ( country, country_code ) values ( 'TOKELAU','TK' );
insert into cin.countries ( country, country_code ) values ( 'TONGA','TO' );
insert into cin.countries ( country, country_code ) values ( 'TRINIDAD AND TOBAGO','TT' );
insert into cin.countries ( country, country_code ) values ( 'TUNISIA','TN' );
insert into cin.countries ( country, country_code ) values ( 'TURKEY','TR' );
insert into cin.countries ( country, country_code ) values ( 'TURKMENISTAN','TM' );
insert into cin.countries ( country, country_code ) values ( 'TURKS AND CAICOS ISLANDS','TC' );
insert into cin.countries ( country, country_code ) values ( 'TUVALU','TV' );
insert into cin.countries ( country, country_code ) values ( 'UGANDA','UG' );
insert into cin.countries ( country, country_code ) values ( 'UKRAINE','UA' );
insert into cin.countries ( country, country_code ) values ( 'UNITED ARAB EMIRATES','AE' );
insert into cin.countries ( country, country_code ) values ( 'UNITED KINGDOM','GB' );
insert into cin.countries ( country, country_code ) values ( 'UNITED STATES','US' );
insert into cin.countries ( country, country_code ) values ( 'UNITED STATES MINOR OUTLYING ISLANDS','UM' );
insert into cin.countries ( country, country_code ) values ( 'URUGUAY','UY' );
insert into cin.countries ( country, country_code ) values ( 'UZBEKISTAN','UZ' );
insert into cin.countries ( country, country_code ) values ( 'VANUATU','VU' );
insert into cin.countries ( country, country_code ) values ( 'VENEZUELA','VE' );
insert into cin.countries ( country, country_code ) values ( 'VIET NAM','VN' );
insert into cin.countries ( country, country_code ) values ( 'VIRGIN ISLANDS, BRITISH','VG' );
insert into cin.countries ( country, country_code ) values ( 'VIRGIN ISLANDS, U.S.','VI' );
insert into cin.countries ( country, country_code ) values ( 'WALLIS AND FUTUNA','WF' );
insert into cin.countries ( country, country_code ) values ( 'WESTERN SAHARA','EH' );
insert into cin.countries ( country, country_code ) values ( 'YEMEN','YE' );
insert into cin.countries ( country, country_code ) values ( 'ZAMBIA','ZM' );
insert into cin.countries ( country, country_code ) values ( 'ZIMBABWE','ZW' );
commit;

select rlm.component_registered ( 'ins_countries.sql' );

\qecho ISO 3166 Country codes inserted
