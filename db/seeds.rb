# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# original category
Category.create!([
  {name: "レディース", parent_id: 0, order: 0, description: "レディース用ファッションなど", slug: "ladies"},
  {name: "メンズ", parent_id: 0, order: 0, description: "メンズ用ファッションなど", slug: "mens"},
  {name: "キッズ＆ベビー", parent_id: 0, order: 0, description: "子供服、ベビー服、学生服など", slug: "kids"},
  {name: "バッグ・スーツケース", parent_id: 0, order: 0, description: "ビジネスバッグ、ファッションバッグ、スーツケースなど", slug: "bag"},
  {name: "スポーツ用品", parent_id: 0, order: 0, description: "スポーツウェア、スポーツ道具、ユニフォームなど", slug: "sports"},
  {name: "古着", parent_id: 0, order: 0, description: "レディース、メンズ、キッズ、ベビーの古着など", slug: "old"},
  {name: "ドレス", parent_id: 0, order: 0, description: "パーティドレス、フォーマルドレスなど", slug: "party"},
  {name: "コスプレ", parent_id: 0, order: 0, description: "アニメコスプレ用アパレル、グッズなど", slug: "cosplay"},
  {name: "下着・寝間着", parent_id: 0, order: 0, description: "下着、ランジェリー、キャミソール、パジャマなど", slug: "underwear"},
  {name: "ジュエリー", parent_id: 0, order: 0, description: "リング、ネックレス、ブレスレット、イヤリングなど", slug: "jewelry"},
  {name: "アクセサリー", parent_id: 0, order: 0, description: "帽子、手袋、靴下、マフラー、ベルトなど", slug: "accessory"},
  {name: "財布・小物", parent_id: 0, order: 0, description: "レディース、メンズ、革製品、扇子、傘など", slug: "wallet"},
  {name: "靴", parent_id: 0, order: 0, description: "ハイヒール、サンダル、ブーツ、スニーカー、レインブーツなど", slug: "shoes"},
  {name: "ヘアアクセサリー", parent_id: 0, order: 0, description: "シュシュ、カチューシャ、ヘアクリップ、ヘアバンド、ウィッグなど", slug: "hair"},
  {name: "ネイル", parent_id: 0, order: 0, description: "ジェルネイル、アクリルスカルプ、ポリッシュなど", slug: "nail"},
  {name: "美容・健康", parent_id: 0, order: 0, description: "基礎化粧品、オーガニック、香水、健康食品、サプリメントなど", slug: "beauty"},
  {name: "おもちゃ", parent_id: 0, order: 0, description: "おもちゃ、カードゲーム、食玩、知育玩具、フィギュアなど", slug: "hobby"},
  {name: "ゲーム", parent_id: 0, order: 0, description: "ゲーム機本体、ゲームソフト、コントローラー、周辺機器など", slug: "game"},
  {name: "レジャー・アウトドア", parent_id: 0, order: 0, description: "メンズファッション", slug: "outdoor"},
  {name: "子育て用品", parent_id: 0, order: 0, description: "抱っこ紐、おんぶ紐、ベビーカー、チャイルドシートなど", slug: "parenting"},
  {name: "雑貨", parent_id: 0, order: 0, description: "アジアン雑貨、北欧雑貨、手作り雑貨、アロマ、ノベルティなど", slug: "goods"},
  {name: "キッチン用品・食器", parent_id: 0, order: 0, description: "鍋・フライパン、調理器具、食器、グラス、弁当箱など", slug: "kitchen"},
  {name: "バス・トイレ用品", parent_id: 0, order: 0, description: "掃除用品、洗濯用品、バス用品、トイレ用品など", slug: "bath"},
  {name: "家具・インテリア", parent_id: 0, order: 0, description: "収納家具、子供用家具、輸入家具、オーダー家具、ペット用家具など", slug: "furniture"},
  {name: "パソコン・周辺機器", parent_id: 0, order: 0, description: "パソコン、周辺機器、タブレット、スマートフォンなど", slug: "computer"},
  {name: "家電・電化製品", parent_id: 0, order: 0, description: "生活家電、理美容家電、照明、カメラ、音響、イヤフォンなど", slug: "appliances"},
  {name: "DIY・工具", parent_id: 0, order: 0, description: "電動工具、作業工具、リフォーム、エクステリアなど", slug: "diy"},
  {name: "オフィス用品・文房具", parent_id: 0, order: 0, description: "文房具、印刷用トナー、ハンコ・印鑑、名刺、作業用品など", slug: "office"},
  {name: "食品", parent_id: 0, order: 0, description: "果物、肉類、魚介類、米、乳製品、野菜、加工食品、輸入食品など", slug: "food"},
  {name: "飲料品", parent_id: 0, order: 0, description: "ミネラルウォーター、ジュース、お茶、コーヒー、紅茶、お酒など", slug: "beverage"},
  {name: "結婚・ブライダル", parent_id: 0, order: 0, description: "ウエディングドレス、アクセサリー、ウェルカムボード、引き出物など", slug: "marriage"},
  {name: "花・ガーデニング", parent_id: 0, order: 0, description: "生花、ドライフラワー、観葉植物、盆栽、ガーデニング用品など", slug: "flower"},
  {name: "ペット・ペット用品", parent_id: 0, order: 0, description: "ペット、ペット用アパレル、リード・首輪、ケージ、食品など", slug: "pets"},
  {name: "買い取り", parent_id: 0, order: 0, description: "各種買い取りサービス", slug: "purchase"},
  {name: "その他", parent_id: 0, order: 0, description: "不動産、防災・セキュリティ、ハウスクリー二ング、ゴミ回収、ギフトなど", slug: "other"},
# sub category
  {name: "カジュアル", parent_id: 1, order: 0, description: "カジュアルなファッションなど", slug: "casual"},
  {name: "ナチュラル", parent_id: 1, order: 0, description: "ナチュラル系のファッションなど", slug: "natural"},
  {name: "スウィート", parent_id: 1, order: 0, description: "スウィート系の甘くて可愛いファッションなど", slug: "sweet"},
]) if Rails.env.development?

Payment.create!([
  {name: "銀行振込", order: 0},
  {name: "代金引換", order: 0},
  {name: "クレジットカード", order: 0},
  {name: "Apple Pay", order: 0},
  {name: "Amazonペイメント", order: 0},
  {name: "楽天ペイ", order: 0},
  {name: "Yahoo!かんたん決済", order: 0},
  {name: "コンビニ払い", order: 0},
  {name: "NP後払い", order: 0},
  {name: "電子マネー", order: 0},
  {name: "ネットバンキング", order: 0},
  {name: "キャリア決済", order: 0},
  {name: "郵便振替", order: 0},
  {name: "現金書留", order: 0},
  {name: "掛売", order: 0},
])