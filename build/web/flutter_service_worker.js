'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "401db37db295cbeefff06900a6d7904c",
"assets/AssetManifest.bin.json": "1c6212aefcd7a607cba91e67e4c18922",
"assets/AssetManifest.json": "9ffca535fa89d65048d91f8653e58c88",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "004f082e21c716dcad59662adeeb39a3",
"assets/lib/assets/data/about/about_data.json": "11d2d9a2c8281569dc8177f943be76c7",
"assets/lib/assets/data/about/about_model.dart": "69e1fca562807cec88256ac3897ca9ad",
"assets/lib/assets/data/about/about_model.freezed.dart": "3bf4e55441b6467bfe794c79d8c23fca",
"assets/lib/assets/data/about/about_model.g.dart": "df05d31dcd54363f832c45d85aa12d45",
"assets/lib/assets/data/contact/contact_data.json": "f340b2d1664edf244189c69696cfcf1f",
"assets/lib/assets/data/contact/contact_model.dart": "ef87c02d44bde3ea8242d053f397152a",
"assets/lib/assets/data/contact/contact_model.freezed.dart": "392b5b414320a7d14f18f2b63eaf52df",
"assets/lib/assets/data/contact/contact_model.g.dart": "1ef7db81ca88c0dde0f880dceaaf2455",
"assets/lib/assets/data/funds/agency_model.dart": "59238797554f7852f265d77ecd872b38",
"assets/lib/assets/data/funds/agency_model.freezed.dart": "03dd9319c971b58b3af42dec0dab18f0",
"assets/lib/assets/data/funds/agency_model.g.dart": "37b80ad0f37e318e145d2bb0df78d7e2",
"assets/lib/assets/data/funds/funds_data.json": "7b609a5154d802072b13f2f78fd03c67",
"assets/lib/assets/data/funds/funds_model.dart": "3a1c520bd74ac190bb62c4c35a2d84f6",
"assets/lib/assets/data/funds/funds_model.freezed.dart": "de6c296f826c7c995f7aa38e0c21a602",
"assets/lib/assets/data/funds/funds_model.g.dart": "2dfd315da930f5672a3937bef684c812",
"assets/lib/assets/data/funds/pdf_funds_data.json": "5e0d64a1e9f69ddb86b0352589d5d72b",
"assets/lib/assets/data/news/news_data.json": "67288f133b037e3ba5fc062ba39ad971",
"assets/lib/assets/data/news/news_model.dart": "ca69fe42c382b65e0ce5f5840d572419",
"assets/lib/assets/data/news/news_model.freezed.dart": "fa88fa7533ee8c556947e29788d422f4",
"assets/lib/assets/data/news/news_model.g.dart": "4d038b321afa89520d11a014e9175704",
"assets/lib/assets/data/notice/notice_data.json": "2b36f0c9a6ea3d88c4c6f1330073bd3b",
"assets/lib/assets/data/notice/notice_model.dart": "68ca3bc6c4e8414e734f3fbd2173b96b",
"assets/lib/assets/data/notice/notice_model.freezed.dart": "d481b7af1d6a0eef2b4ecad69349cc5e",
"assets/lib/assets/data/notice/notice_model.g.dart": "20de983621839c9ec03f31002e952d8d",
"assets/lib/assets/data/notification/message_model.dart": "427eab8af3c383de9358dc0a4bbf4d74",
"assets/lib/assets/data/notification/message_model.freezed.dart": "42489251aa3eb026b43e791d2915af98",
"assets/lib/assets/data/notification/message_model.g.dart": "cad5febcdcf3fcb112fb572bc78d7a8c",
"assets/lib/assets/data/notification/notification_data.json": "bb670debc6857cc7b552cb458218d1cf",
"assets/lib/assets/data/people/alumni_model.dart": "ddf352e87e4af4bc6565bd8c95504f04",
"assets/lib/assets/data/people/alumni_model.freezed.dart": "d85f7d6b1538cafa2f6ba8da5c4a8dfc",
"assets/lib/assets/data/people/alumni_model.g.dart": "cca0590c9ed20c93f81212531fbe1992",
"assets/lib/assets/data/people/alumnus_data.json": "07bd605f065d6b28d888aa8f673efce7",
"assets/lib/assets/data/people/alumnus_staff_data.json": "38781339125bce4e066595979ea1962c",
"assets/lib/assets/data/people/mscs_data.json": "80b87f582edfd902157b9b6cb55bee10",
"assets/lib/assets/data/people/pdfs_data.json": "4dadc9a285d87e8a453c7e562fa884c1",
"assets/lib/assets/data/people/people_model.dart": "93b71352171d53a94a020b2c46b6b72f",
"assets/lib/assets/data/people/people_model.freezed.dart": "f6b00028666aac63e805db0a2f93914f",
"assets/lib/assets/data/people/people_model.g.dart": "a5d852ae7fcbba83d6a362a1e12e727c",
"assets/lib/assets/data/people/phds_data.json": "e370dc98742d503e19236d490cfe5bc0",
"assets/lib/assets/data/people/pi_data.json": "27369a77f45581b7d1159ec34b5a8c95",
"assets/lib/assets/data/people/pi_model.dart": "26f659dd6ac03b5392ab3dba68231c4a",
"assets/lib/assets/data/people/pi_model.freezed.dart": "164504b80b7bed1211660b6866fca245",
"assets/lib/assets/data/people/pi_model.g.dart": "f7030588027d80150339b9add27e64f9",
"assets/lib/assets/data/people/staffs_data.json": "fc36b46e2f172e0f0f39b7b133776578",
"assets/lib/assets/data/publication/publication_data.json": "6544e827229ffaec4fd25ab9e9ed852d",
"assets/lib/assets/data/publication/publication_model.dart": "f3e5be266feb8d41656927044304a504",
"assets/lib/assets/data/publication/publication_model.freezed.dart": "2d3c9c1a8c707791cda352952c79bf1c",
"assets/lib/assets/data/publication/publication_model.g.dart": "4b8bacca911d464d1af1eca4109076f2",
"assets/lib/assets/data/research/research_data.json": "f370ebad1d59fd1409b7498903774f26",
"assets/lib/assets/data/research/research_model.dart": "11be12ab651b74d0bac4be824a669af4",
"assets/lib/assets/data/research/research_model.freezed.dart": "e7eb3e90a18a4e1b3a54221f6d98897f",
"assets/lib/assets/data/research/research_model.g.dart": "234cc31b0835c77c702538c7d6836e9f",
"assets/lib/assets/data/research-area/research_area_data.json": "362d7750ec32700b8f30a2f870e57810",
"assets/lib/assets/data/research-area/research_area_model.dart": "9e0e1e03e3237bcfb005cbfc7aa22a50",
"assets/lib/assets/data/research-area/research_area_model.freezed.dart": "38c6e0f19f30dbe41abef7fb81350ce6",
"assets/lib/assets/data/research-area/research_area_model.g.dart": "31a457d2bc4dc5ee94d8ccfbd48388c1",
"assets/lib/assets/data/social-media/social_media_data.json": "fc2aeba34fc9cc30a8ce7e7a16fcfe37",
"assets/lib/assets/data/social-media/social_media_model.dart": "602f24d42ead019ecc3f30bccee96dc5",
"assets/lib/assets/data/social-media/social_media_model.freezed.dart": "66ffb68cfacabe8083444408d48f83ce",
"assets/lib/assets/data/social-media/social_media_model.g.dart": "e281f1ef8ce8ea1ee3052525431f1689",
"assets/lib/assets/fonts/poppins-400.woff2": "9212f6f9860f9fc6c69b02fedf6db8c3",
"assets/lib/assets/fonts/poppins-500.woff2": "a09f2fccfee35b7247b08a1a266f0328",
"assets/lib/assets/fonts/poppins-700.woff2": "25b0e113ca7cce3770d542736db26368",
"assets/lib/assets/icons/contact.svg": "6e39ff33ae80a52b3bd7c1284e5f6c4a",
"assets/lib/assets/icons/csir-logo.svg": "4e1e6be746bc0835cdae9a7c54c0ad76",
"assets/lib/assets/icons/gallery.svg": "4515eade7379ce4efb5a96ad6ee19932",
"assets/lib/assets/icons/home.svg": "ec2c9281f8c2295abad02ef0cf2a35fc",
"assets/lib/assets/icons/mail.svg": "16012b92a40b6fe8f2306c2a9488006c",
"assets/lib/assets/icons/menu.svg": "9b11d222f6eb04e1e26a1df95d9dee8e",
"assets/lib/assets/icons/menu_open.svg": "b4a6fec1b2d1476120815e99677d3cc7",
"assets/lib/assets/icons/moon.svg": "cb5b12b749887f2f6fe303a657c67b6a",
"assets/lib/assets/icons/people.svg": "352983b3f14aba15b8a17185758e9999",
"assets/lib/assets/icons/phone.svg": "b5dcf201a939f9461802946969872fc8",
"assets/lib/assets/icons/picture_as_pdf.svg": "924574ef468535ddb35aaefccf430658",
"assets/lib/assets/icons/publication.svg": "4e7e7f1186a880f81b3c98d4b8393c67",
"assets/lib/assets/icons/pubmed_logo.svg": "a152d9692b93aef682622d6bdec5ee2c",
"assets/lib/assets/icons/research.svg": "a09e0a18fa2c3edcceda27b88841ab68",
"assets/lib/assets/icons/resource.svg": "026c480777afdc86231ca87c586efff4",
"assets/lib/assets/icons/rupee.svg": "da85f28a232a1567c8568f6b26a058b1",
"assets/lib/assets/icons/sun.svg": "49f30aad65eb7c1c8442b943d0a892da",
"assets/lib/assets/icons/tab_close.svg": "c12f16adfaa4b3f89d300a4240218937",
"assets/lib/assets/images/album/1.webp": "7c2a449ccac397b0e81e34f6fdef6aaa",
"assets/lib/assets/images/album/10.webp": "5b8ae8cb07a1ae3e21190e90602daf07",
"assets/lib/assets/images/album/11.webp": "3d9403a3a86312403040623f31348ac8",
"assets/lib/assets/images/album/12.webp": "6d62f564eb98b261a09e343347ed90d2",
"assets/lib/assets/images/album/13.webp": "6a2afd64b7c02b13a2bc80a4342e324c",
"assets/lib/assets/images/album/14.webp": "a506cb7511d2c2e297725d9fe6cf1639",
"assets/lib/assets/images/album/15.webp": "412ec0b9f8bd240369a3df67d9d55b84",
"assets/lib/assets/images/album/16.webp": "6b60d9db1048e260ea7161ed521bdf73",
"assets/lib/assets/images/album/17.webp": "282f063c1c05ada794b221aba750c945",
"assets/lib/assets/images/album/18.webp": "0988ef1a6cd0bac131b6d6e53d1bc38f",
"assets/lib/assets/images/album/19.webp": "fbd8724fdd51f33b1bdef79ea4de0eec",
"assets/lib/assets/images/album/2.webp": "ce270bb177dc7ddfb6e1682fb28751b9",
"assets/lib/assets/images/album/20.webp": "999ec22713850291a559e1ce905852bd",
"assets/lib/assets/images/album/21.webp": "93b0feb26bcbd6ac4e67a42687190608",
"assets/lib/assets/images/album/22.webp": "79d259cae466be12687929e2413fbc27",
"assets/lib/assets/images/album/23.webp": "44601ddf1954eff1f10b0ff443d446be",
"assets/lib/assets/images/album/3.webp": "48112166d623c088224b5f9d73a8ffaf",
"assets/lib/assets/images/album/4.webp": "6916d89fbe92872099788e5f8d0f0a7a",
"assets/lib/assets/images/album/5.webp": "76125e14bd9160e10e700abeb52c63d5",
"assets/lib/assets/images/album/6.webp": "a1bfe785d15dd5038b1588f3d5cb0999",
"assets/lib/assets/images/album/7.webp": "307a71a1290dbe82f8873f3e57b44a5c",
"assets/lib/assets/images/album/8.webp": "a9ec14a1a7cd661896d239d8d9d85889",
"assets/lib/assets/images/album/9.webp": "39b72064888a0dc0d3c2f0a6e7451cf0",
"assets/lib/assets/images/bg/bg.webp": "50b1f594a27fa2493c027e71c4790a5e",
"assets/lib/assets/images/cards/disease.webp": "d105b19b33ef163f88989dd71795a4fb",
"assets/lib/assets/images/cards/ironsulfur.webp": "5a7eb038ed7c76cd023bd407c7407cf4",
"assets/lib/assets/images/cards/mitochondria.webp": "45f611760fc85929482d085fa83557f9",
"assets/lib/assets/images/cards/Protein_folding.webp": "89d1439d4a02d2a991afd63148ddf110",
"assets/lib/assets/images/cards/ros.webp": "b11d260c0b331a7a81e242c3962f8517",
"assets/lib/assets/images/gallery/birthdays/2021/patrick_d_silva/1.webp": "34e4202f44327e6ddfe0609372e302e3",
"assets/lib/assets/images/gallery/birthdays/2021/patrick_d_silva/2.webp": "8f5cff3a87ed85771087f498fee1d923",
"assets/lib/assets/images/gallery/birthdays/2021/patrick_d_silva/3.webp": "49a02ce6e49f1c859fc8cd22a5161752",
"assets/lib/assets/images/gallery/birthdays/2022/patrick_d_silva/1.webp": "3fac852c71887396fbd0b1f50374859a",
"assets/lib/assets/images/gallery/birthdays/2022/patrick_d_silva/2.webp": "461925865090b76227b2568b1dc72842",
"assets/lib/assets/images/gallery/birthdays/2022/patrick_d_silva/3.webp": "8c4b4af34d116c8af5492f590db6b8b4",
"assets/lib/assets/images/gallery/events/2020/centenary_celebration/1.webp": "a892edd8c15bd67dd3093cc2e33018b9",
"assets/lib/assets/images/gallery/events/2020/centenary_celebration/2.webp": "3b5fcc1f11533f33011d65a9724da95a",
"assets/lib/assets/images/gallery/events/2021/diwali/1.webp": "a05a38fe21d6c32168263fb2761e045f",
"assets/lib/assets/images/gallery/events/2021/diwali/2.webp": "0cd4444577678ac953fb7c6aa0709350",
"assets/lib/assets/images/gallery/events/2021/diwali/3.webp": "ef16408537c860826deb05a382396fed",
"assets/lib/assets/images/gallery/events/2022/bybc_jncasr/1.webp": "b732847c1a044620c6cc9a78b53261fa",
"assets/lib/assets/images/gallery/events/2022/diwali/1.webp": "ec7b6ecfbe3d4c8f793156c512398881",
"assets/lib/assets/images/gallery/events/2022/diwali/2.webp": "8ef973e75376c66ce911c1623a3a0bff",
"assets/lib/assets/images/gallery/events/2022/diwali/3.webp": "9bba7360779d469099fc3eceb1fbd363",
"assets/lib/assets/images/gallery/events/2022/diwali/4.webp": "15f82bfe31ce3abe6597b64a149b5e0d",
"assets/lib/assets/images/gallery/events/2022/independance_day/1.webp": "5aea30d8effe7c336eacdad8ddbafd9d",
"assets/lib/assets/images/gallery/events/2022/independance_day/2.webp": "c87dd51ff5c06756966f8664b045eb0f",
"assets/lib/assets/images/gallery/events/2022/nurturance_programme/1.webp": "d1b61084daa537136878730d3b39b515",
"assets/lib/assets/images/gallery/events/2022/nurturance_programme/2.webp": "c5dbddbf7ac70959c1230db9823533b5",
"assets/lib/assets/images/gallery/events/2022/nurturance_programme/3.webp": "41f88fb2a6c9d680dad23daf0f6e3f4e",
"assets/lib/assets/images/gallery/events/2022/nurturance_programme/4.webp": "de836163bc37b4fe2ca4e02bb5fbf024",
"assets/lib/assets/images/gallery/events/2022/sports_day/1.webp": "1341111ec857ae007d8b653f73d937be",
"assets/lib/assets/images/gallery/events/2022/sports_day/2.webp": "2d43be0c8478bb4fd9b9ad3fad24e6d6",
"assets/lib/assets/images/gallery/events/2022/sports_day/3.webp": "1d86f071f7dc28d886e2777da3667138",
"assets/lib/assets/images/gallery/events/2022/sports_day/4.webp": "a20cd22c2b65a640e0577a12692ab092",
"assets/lib/assets/images/gallery/farewell/2022/abhishek/1.webp": "a0efd1cb2a02229346298fe5d15ddcd1",
"assets/lib/assets/images/gallery/farewell/2022/abhishek/2.webp": "9ee12f037c603f362ddc7462ca399a29",
"assets/lib/assets/images/gallery/farewell/2022/abhishek/3.webp": "87732476aa9f67ca25d6dba6d7b64e11",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/1.webp": "3cb3e08b4b7c898289242dbe9d3f5a31",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/2.webp": "a4aae88594d4eed77bf7b0ce2d5acba8",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/3.webp": "7a4bc5bb26cc77b4b073120fc231d9b2",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/4.webp": "62cf76b3ad4c8a270e12029bd086bdec",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/5.webp": "040d78f8f5f8907bf3dfcc93e5de20eb",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/6.webp": "c800563adb968a6c0bee48b35b546524",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/7.webp": "a4aae88594d4eed77bf7b0ce2d5acba8",
"assets/lib/assets/images/gallery/farewell/2022/tejashree/8.webp": "c0389a4a4f8654bd52f104a3d5856689",
"assets/lib/assets/images/gallery/lab_photos/1.webp": "2367ef639d2463a935ee3af18eb3e4ea",
"assets/lib/assets/images/gallery/lab_photos/2.webp": "6bca0cdb0650b38a00db8079ab7e6aeb",
"assets/lib/assets/images/gallery/lab_photos/3.webp": "ba24455d0eaddd33fdf21d6970e12b64",
"assets/lib/assets/images/gallery/lab_photos/4.webp": "9f28cf31b854cf08e51521ea5aa9e7a3",
"assets/lib/assets/images/gallery/lab_photos/5.webp": "90026db40529d1226a22b48d820ee8ac",
"assets/lib/assets/images/gallery/lab_photos/6.webp": "c5f28054f33922a3e28a867d4552416b",
"assets/lib/assets/images/gallery/lab_photos/7.webp": "325645631041b24fa943137afaee8dda",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/1.jpg": "dd4f25f7b784440ae43eb142ff7b1d5f",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/1.webp": "6a2afd64b7c02b13a2bc80a4342e324c",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/2.jpg": "cfb1ffe44897d4d9342ac238db02dafd",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/2.webp": "6d62f564eb98b261a09e343347ed90d2",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/3.jpg": "d94d304b2c4a6b943d2bea9982117836",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/3.webp": "3d9403a3a86312403040623f31348ac8",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/4.jpg": "dcefdeb055f30d447a4ff00f28ff48b6",
"assets/lib/assets/images/gallery/official_events/2018/sir_cv_raman_award/4.webp": "5b8ae8cb07a1ae3e21190e90602daf07",
"assets/lib/assets/images/gallery/official_events/2021/defence/abhishek/1.webp": "d2571a1152c6341d47fb3873dd05b446",
"assets/lib/assets/images/gallery/official_events/2021/defence/abhishek/2.webp": "78f717c7362d89763d10ec4d6daeb153",
"assets/lib/assets/images/gallery/official_events/2021/defence/abhishek/3.webp": "9fec04ceace090d7c5337c29b2204222",
"assets/lib/assets/images/gallery/official_events/2021/defence/abhishek/4.webp": "6ccdc7ab7387850a1105783e4cb06ecf",
"assets/lib/assets/images/gallery/official_events/2022/defence/tejashree/1.webp": "999ec22713850291a559e1ce905852bd",
"assets/lib/assets/images/gallery/official_events/2022/defence/tejashree/2.webp": "61bff7c2364bd1f5b031bf3850263f01",
"assets/lib/assets/images/gallery/official_events/2022/defence/tejashree/3.webp": "1dbb09c52a79a0e5be3adbfc89122cca",
"assets/lib/assets/images/gallery/official_events/2022/defence/tejashree/4.webp": "0988ef1a6cd0bac131b6d6e53d1bc38f",
"assets/lib/assets/images/gallery/official_events/2022/defence/vinaya/1.webp": "44601ddf1954eff1f10b0ff443d446be",
"assets/lib/assets/images/gallery/official_events/2022/defence/vinaya/2.webp": "79d259cae466be12687929e2413fbc27",
"assets/lib/assets/images/gallery/official_events/2022/defence/vinaya/3.webp": "a03590764a9473bca0874a0b0c2008b2",
"assets/lib/assets/images/gallery/official_events/2022/defence/vinaya/4.webp": "aed7ea19daa19f955e442dee4a33f760",
"assets/lib/assets/images/models/abishek-jcb/1.webp": "f2fe275327c79e879a71dedc55f3780f",
"assets/lib/assets/images/models/abishek-jcb/2.webp": "d51c00cbd59ad80984246ee797a8eb13",
"assets/lib/assets/images/models/gautam-elife/1.webp": "12dc6b4aefc7a6c0ee19cfe84433f8f8",
"assets/lib/assets/images/models/gautam-elife/2.webp": "5a529a2b97a7270931dd3194826eb77e",
"assets/lib/assets/images/models/gautam-elife/3.webp": "7c16b41a2b981a4a94eaf47b24c0904b",
"assets/lib/assets/images/parallax/1.webp": "ca9752f241e8232e49a0fcd95806c58d",
"assets/lib/assets/images/parallax/2.webp": "7c6154326b5055b6cefddc3504413c3a",
"assets/lib/assets/images/parallax/3.webp": "3d976a2fb34fb6beaca4716b68d20acd",
"assets/lib/assets/images/parallax/4.webp": "bee9a29a207f43fdaabce17a5e73d4c6",
"assets/lib/assets/images/parallax/5.jpg": "7ed13d95e6192fef07a79eb253569110",
"assets/lib/assets/images/people/abhi.webp": "bb14cfb455e2ba9eedac4af5f1192b74",
"assets/lib/assets/images/people/aishita.webp": "6f0b38eecaed828c179fe38ef6689a8a",
"assets/lib/assets/images/people/akansha.webp": "cf2529dae3ed61c8f3ed83b3b699a292",
"assets/lib/assets/images/people/anjali.webp": "e4481af2cdf4dae874ee1b2728a3109f",
"assets/lib/assets/images/people/ashutosh.webp": "3a1821bcfa2219a6a69c4ad03948f064",
"assets/lib/assets/images/people/gautam.webp": "ddddd2bc02f2aa827f7e0920f2589d4b",
"assets/lib/assets/images/people/mahima.webp": "2ea1511e99e9d39b04e4ad1a21e8b71d",
"assets/lib/assets/images/people/muskan.webp": "2e599c4194b9bf62fa25ea0bd0656ba8",
"assets/lib/assets/images/people/partha.webp": "e843cb2963a1f57d672f4bf0c689dc23",
"assets/lib/assets/images/people/patrick.webp": "a4a38f3500576507fe4e0c497f70ea26",
"assets/lib/assets/images/people/priyanka.webp": "4ac8b272988c183810c07ed2434b41a5",
"assets/lib/assets/images/people/rachayeeta.webp": "84331c4c1d54e1c1aa3949d1d50a46a8",
"assets/lib/assets/images/people/research/patrick-research.webp": "9eb66c31ed5e8044e5d74fc99ba2d5da",
"assets/lib/assets/images/people/sananda.webp": "cbf5fe72231f92438088312a3fb169ac",
"assets/lib/assets/images/people/sanjay.webp": "44d4e3abcee38d55e662b8bed5c5b452",
"assets/lib/assets/images/people/saravana.webp": "b01e74f9427b1dba6ce6f60674bf29c4",
"assets/lib/assets/images/people/shravya.webp": "4fd28ec9b4f449bf78ab396f735b2d20",
"assets/lib/assets/images/people/shreedivya.webp": "0d1155caf311120130121e7089ce7f50",
"assets/lib/assets/images/people/sruthi.webp": "9805d0f9e8d5c31e141e615e6d9da4f1",
"assets/lib/assets/images/people/surya.webp": "a5efaf6c8a611c2650281082fbb3974b",
"assets/lib/assets/images/people/vicky.webp": "01189fc607b6c5549ee727269304fc00",
"assets/lib/assets/images/poster/gautam_biopatrika.webp": "c3ef02ac7bda2bd7afd2444e09b15e6c",
"assets/lib/assets/logos/Biopatrika-logo.svg": "f88e165692f70a64da11bda175bf3442",
"assets/lib/assets/logos/cell-press.svg": "4c01d6461770ac1fb3b4ffaba9493481",
"assets/lib/assets/logos/csir.svg": "53986dacc61cc4e31aa5f8ab8f8a55c0",
"assets/lib/assets/logos/facebook.svg": "ed4c903e760dd82cfae14c73b1a3c37d",
"assets/lib/assets/logos/google_scholar.svg": "3ccc71b8e609e6ab8f306f1353739a00",
"assets/lib/assets/logos/iasc-logo.png": "f4e0bdfab3f05714d2cb552dd632e5ce",
"assets/lib/assets/logos/iasc-logo.svg": "0719f89ecb94bee5f0ff71353ee17498",
"assets/lib/assets/logos/iisc-logo.svg": "e53836c97188871e5a0b3058e490067a",
"assets/lib/assets/logos/iisc_protein.png": "b64c1a554b3c912d02aa9bb6f9bdbf88",
"assets/lib/assets/logos/india_emblem.svg": "807a56c394ccbc79b818bf171421b5f9",
"assets/lib/assets/logos/linkedin.svg": "5a997fbe829771d4a8021681bf604e0c",
"assets/lib/assets/logos/research_gate.svg": "1b6d98aeb333922d1f521c6fa621be95",
"assets/lib/assets/logos/tata_trust.svg": "ac5b229f672bac4b667b36c30d73020e",
"assets/lib/assets/logos/thehindu-logo.svg": "34a3628a4eeaabf0e11b4110fb815c2b",
"assets/lib/assets/logos/twitter.svg": "0c9462a79f736453eac5bf7cbb756875",
"assets/lib/assets/logos/wellcome_trust.svg": "8c7e58676203d87cd19a7164c478b398",
"assets/NOTICES": "e65791229d71574dba341f5add7d3529",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "a507344bc555d54fd28b2e70686f19f9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a9f3f127d8d843870ac5eb282fff6c45",
"/": "a9f3f127d8d843870ac5eb282fff6c45",
"main.dart.js": "f73bc76a12d2ca5135560490d21e25ac",
"manifest.json": "24204ba2a7eb3e364735c29d61582d5e",
"version.json": "8eff3eefd555b726151969b4ab329e72"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
