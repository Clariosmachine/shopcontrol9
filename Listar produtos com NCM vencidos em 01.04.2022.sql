select 
	 prod.Codigo
	,prod.Nome
	,NCM.codigo NCM
from Prod_Serv prod
left join NCM on prod.Ordem_NCM = NCM.Ordem
where NCM.codigo in
(
	03051000,
	04031000,
	04100000,
	08029000,
	15091000,
	15100000,
	20029010,
	20029090,
	25183000,
	28444010,
	28444020,
	28444030,
	28444090,
	29033100,
	29033911,
	29033912,
	29033919,
	29033921,
	29033929,
	29033931,
	29033932,
	29033939,
	29096020,
	29313100,
	29313200,
	29313300,
	29313400,
	29313500,
	29313600,
	29313700,
	29313800,
	29313911,
	29313912,
	29313913,
	29313914,
	29313915,
	29313916,
	29313917,
	29313918,
	29313991,
	29313992,
	29313993,
	29313994,
	29313995,
	29313996,
	29313997,
	29313999,
	29329914,
	29333330,
	29333936,
	29333947,
	29359097,
	29397111,
	29397112,
	29397119,
	29397120,
	29397130,
	29397140,
	30021100,
	30021410,
	30021490,
	30021900,
	30022011,
	30022012,
	30022013,
	30022014,
	30022015,
	30022016,
	30022017,
	30022018,
	30022019,
	30022021,
	30022022,
	30022023,
	30022024,
	30022025,
	30022026,
	30022027,
	30022028,
	30022029,
	30023010,
	30023020,
	30023030,
	30023040,
	30023050,
	30023060,
	30023070,
	30023080,
	30023090,
	30029010,
	30029020,
	30029030,
	30029091,
	30029092,
	30029093,
	30029094,
	30029099,
	30062000,
	32041911,
	32041912,
	32041913,
	32041919,
	34021110,
	34021120,
	34021130,
	34021140,
	34021190,
	34021210,
	34021290,
	34021300,
	34021900,
	34022000,
	36030010,
	36030020,
	36030030,
	36030040,
	36030050,
	36030060,
	38089198,
	38220010,
	38220020,
	38220090,
	38247110,
	38247190,
	38247200,
	38247300,
	38247410,
	38247420,
	38247490,
	38247500,
	38247600,
	38247700,
	38247810,
	38247890,
	38247900,
	39011010,
	39011091,
	39011092,
	39072011,
	39072012,
	39072020,
	39072031,
	39072039,
	39072041,
	39072042,
	39072049,
	39072090,
	40151100,
	44014000,
	44129400,
	44140000,
	44181000,
	44182000,
	44186000,
	44201000,
	49051000,
	49059100,
	49059900,
	55011000,
	57032000,
	57033000,
	58021100,
	58021900,
	62011100,
	62011200,
	62011300,
	62011900,
	62019100,
	62019200,
	62019300,
	62019900,
	62021100,
	62021200,
	62021300,
	62021900,
	62029100,
	62029200,
	62029300,
	62029900,
	68129200,
	68129300,
	68151010,
	68151020,
	68151090,
	70193100,
	70193200,
	70193900,
	70194000,
	70195100,
	70195210,
	70195290,
	70195900,
	70199010,
	70199090,
	71042010,
	71042090,
	71049000,
	74191000,
	74199100,
	74199910,
	74199920,
	74199930,
	74199940,
	74199990,
	81039000,
	81060010,
	81060090,
	81072010,
	81072020,
	81073000,
	81079000,
	81092000,
	81093000,
	81099000,
	84191910,
	84191990,
	84193100,
	84193200,
	84213920,
	84621011,
	84621019,
	84621090,
	84622100,
	84623100,
	84623910,
	84623990,
	84624100,
	84629111,
	84629119,
	84629191,
	84629199,
	84629910,
	84629920,
	84629990,
	84669430,
	84705011,
	84705019,
	84714110,
	84714190,
	84717011,
	84717012,
	84717019,
	84717021,
	84717029,
	84717032,
	84717033,
	84717039,
	84729021,
	84729029,
	84733043,
	84733092,
	84733099,
	85074000,
	85141010,
	85141090,
	85143011,
	85143019,
	85143021,
	85143029,
	85143090,
	85171211,
	85171212,
	85171213,
	85171219,
	85171221,
	85171222,
	85171223,
	85171229,
	85171231,
	85171232,
	85171233,
	85171239,
	85171241,
	85171249,
	85171290,
	85171810,
	85171820,
	85171891,
	85171899,
	85176111,
	85176119,
	85176120,
	85176211,
	85176212,
	85176213,
	85176219,
	85176222,
	85176223,
	85176224,
	85176231,
	85176232,
	85176233,
	85176248,
	85176261,
	85176271,
	85176292,
	85176293,
	85176295,
	85177010,
	85177021,
	85177029,
	85177091,
	85177092,
	85177099,
	85195000,
	85229020,
	85229090,
	85232921,
	85232922,
	85232923,
	85232924,
	85232929,
	85232931,
	85232932,
	85232933,
	85232939,
	85255012,
	85258011,
	85258012,
	85258014,
	85258015,
	85258019,
	85258021,
	85258022,
	85258029,
	85271910,
	85271990,
	85284210,
	85284220,
	85284910,
	85284921,
	85284929,
	85285210,
	85285220,
	85285910,
	85285920,
	85291011,
	85291019,
	85395000,
	85414011,
	85414012,
	85414013,
	85414014,
	85414015,
	85414017,
	85414018,
	85414019,
	85414021,
	85414022,
	85414023,
	85414024,
	85414025,
	85414026,
	85414027,
	85414029,
	85414031,
	85414032,
	85414039,
	85415010,
	85415020,
	85429010,
	85429020,
	85429090,
	85481010,
	85481090,
	85489010,
	85489090,
	87012000,
	88031000,
	88032000,
	88033000,
	88039000,
	89031000,
	89039100,
	89039200,
	90065100,
	90065200,
	90138010,
	90138090,
	90229011,
	90229012,
	90229019,
	90229090,
	90278011,
	90278012,
	90278013,
	90278014,
	90278020,
	90278030,
	90278091,
	90278099,
	91141000,
	91149010,
	91149020,
	91149030,
	91149040,
	91149050,
	91149060,
	91149070,
	91149090,
	94013010,
	94013090,
	94014010,
	94014090,
	94019010,
	94019090,
	94039010,
	94039090,
	94051010,
	94051091,
	94051092,
	94051093,
	94051099,
	94052000,
	94053000,
	94054010,
	94054090,
	94056000,
	95089011,
	95089012,
	95089019,
	95089021,
	95089022,
	95089023,
	95089041,
	95089042,
	95089043,
	95089049,
	95089050,
	95089060,
	96121011,
	96121012,
	96121013,
	96121019,
	96121090,
	97011000,
	97019000,
	97020000,
	97030000,
	97050000,
	97060000
)
order by 3, 2, 1