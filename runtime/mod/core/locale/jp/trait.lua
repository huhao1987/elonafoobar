ELONA.i18n:add {
   trait = {
      window = {
         title = "特徴と体質",
         enter = "決定 [フィート取得]",
         ally = "仲間",

         name = "特徴の名称",
         level = "段階",
         detail = "特徴の効果",

         available_feats = "◆ 取得できるフィート",
         feats_and_traits = "◆ 特徴と体質",
         requirement = "条件不足",

         you_can_acquire = "残り {$1}個のフィートを取得できる",
         already_maxed = "これ以上取得できない。",
         your_trait = "{$1}の特性",

         category = {
            feat = "フィート",
            mutation = "変異",
            race = "先天",
            ether_disease = "ｴｰﾃﾙ病",
            etc = "その他",
         },

         his_equipment = "{$1}装備は{$2}",
      },

      -- ######### Feats ##########

      _24 = {
         desc = "長年の特訓の成果がスタミナを高める",
         levels = {
            _0 = {
               name = "短距離走者",
               desc = "あなたは持久力がある[スタミナ+]",
            },
            _1 = {
               name = "中距離走者",
               desc = "あなたはかなり持久力がある[スタミナ++]",
            },
            _2 = {
               name = "長距離走者",
               desc = "あなたの持久力は恐ろしい[スタミナ上昇]",
            },
         },
      },
      _3 = {
         desc = "吸血鬼の友人から血の吸い方を学ぶ",
         levels = {
            _0 = {
               name = "吸血鬼",
               desc = "あなたは血を吸うことができる",
            },
         },
      },
      _40 = {
         desc = "指導を続けるうちに、仲間を一時的に強くする方法を見つける",
         levels = {
            _0 = {
               name = "指導者",
               desc = "あなたは仲間を一時的に強くできる",
            },
         },
      },
      _13 = {
         desc = "夢の中で近くへの瞬間移動を思いつく",
         levels = {
            _0 = {
               name = "空間歪曲",
               desc = "あなたは空間を曲げられる",
            },
         },
      },
      _14 = {
         desc = "酒を飲んでいるうちに火を噴けるようになる",
         levels = {
            _0 = {
               name = "火炎芸",
               desc = "あなたは口から火を噴ける",
            },
         },
      },
      _22 = {
         desc = "突如として眠りの手を覚える",
         levels = {
            _0 = {
               name = "催眠術師",
               desc = "あなたは催眠をかけることができる",
            },
         },
      },
      _23 = {
         desc = "毒の研究の結果、毒の手を覚える",
         levels = {
            _0 = {
               name = "毒の知恵",
               desc = "あなたは毒を盛ることができる",
            },
         },
      },
      _21 = {
         desc = "セクシーなポーズを学ぶ",
         levels = {
            _0 = {
               name = "セクシー",
               desc = "あなたはセクシーだ[魅力+4]",
            },
            _1 = {
               name = "色魔",
               desc = "あなたはとんでもない色魔だ[魅力+8] ",
            },
         },
      },
      _5 = {
         desc = "腕相撲の特訓で筋力を高める",
         levels = {
            _0 = {
               name = "腕相撲",
               desc = "あなたは腕相撲が強い[筋力+3]",
            },
            _1 = {
               name = "腕相撲の達人",
               desc = "あなたは腕相撲の達人だ[筋力+6]",
            },
            _2 = {
               name = "腕相撲のチャンピオン",
               desc = "あなたは腕相撲のチャンピオンだ[筋力+9]",
            },
         },
      },
      _38 = {
         desc = "会計の技能を磨き税金を減らす",
         levels = {
            _0 = {
               name = "見習い会計士",
               desc = "あなたは税金の計算に強い[税金7%減]",
            },
            _1 = {
               name = "熟練会計士",
               desc = "あなたは税金の計算にとても強い[税金15%減]",
            },
         },
      },
      _39 = {
         desc = "補給係としての経験が、給料物資の品質を上げる",
         levels = {
            _0 = {
               name = "見習い補給係",
               desc = "あなたはたまに質の高い補給品を受け取る",
            },
            _1 = {
               name = "熟練補給係",
               desc = "あなたは頻繁に質の高い補給品を受け取る",
            },
         },
      },
      _42 = {
         desc = "祈祷を捧げることで、呪いの言葉の効力を弱める",
         levels = {
            _0 = {
               name = "祈祷師",
               desc = "あなたの祈りは呪いの言葉を掻き消す",
            },
         },
      },
      _9 = {
         desc = "頭を壁にぶつけて耐久力を高める",
         levels = {
            _0 = {
               name = "我慢強い",
               desc = "あなたは我慢強い[耐久+3]",
            },
            _1 = {
               name = "とても我慢強い",
               desc = "あなたはとても我慢強い[耐久+6]",
            },
            _2 = {
               name = "恐ろしく我慢強い",
               desc = "あなたは恐ろしく我慢強い[耐久+9]",
            },
         },
      },
      _20 = {
         desc = "ストリートファイトに興じ格闘技の技を得る",
         levels = {
            _0 = {
               name = "格闘家",
               desc = "あなたは格闘技を会得している[格闘+3]",
            },
            _1 = {
               name = "拳聖",
               desc = "あなたは拳聖だ[格闘+6]",
            },
         },
      },
      _12 = {
         desc = "日々瞑想し詠唱技術を高める",
         levels = {
            _0 = {
               name = "集中",
               desc = "あなたの集中力は高い[詠唱+4]",
            },
            _1 = {
               name = "高い集中",
               desc = "あなたは極度に集中できる[詠唱+8]",
            },
         },
      },
      _43 = {
         desc = "盾の扱いを身につけ、盾での攻撃機会を増やす",
         levels = {
            _0 = {
               name = "盾殴り",
               desc = "あなたは盾で攻撃する機会を多く得る",
            },
         },
      },
      _44 = {
         desc = "優しい笑顔を習得し、敵が逃げ出すのを防ぐ",
         levels = {
            _0 = {
               name = "優しい笑顔",
               desc = "あなたの攻撃は敵を恐怖させない",
            },
         },
      },
      _19 = {
         desc = "長年の修行により二刀流の技術を磨く",
         levels = {
            _0 = {
               name = "二刀流の習熟",
               desc = "あなたは複数の武器を巧みに操る[二刀流+4]",
            },
            _1 = {
               name = "二刀流の達人",
               desc = "あなたは二刀流を極めている[二刀流+8]",
            },
         },
      },
      _15 = {
         desc = "地底での生活が暗黒への耐性を高める",
         levels = {
            _0 = {
               name = "暗闇への適正",
               desc = "あなたは暗闇に慣れている[暗黒耐性強化]",
            },
            _1 = {
               name = "暗闇への強い適正",
               desc = "あなたは闇の中で生活できる[暗黒耐性強化]",
            },
         },
      },
      _18 = {
         desc = "貴族の毒見係のおかげで毒への耐性を得る",
         levels = {
            _0 = {
               name = "免疫",
               desc = "あなたは毒に免疫がある[毒耐性強化]",
            },
            _1 = {
               name = "強い免疫",
               desc = "あなたには毒に強い免疫がある[毒耐性強化]",
            },
         },
      },
      _16 = {
         desc = "行商人の下で働き交渉の技術を学ぶ",
         levels = {
            _0 = {
               name = "交渉上手",
               desc = "あなたは交渉が上手い[交渉+4]",
            },
            _1 = {
               name = "交渉の神",
               desc = "あなたの交渉は神ががっている[交渉+8]",
            },
         },
      },
      _17 = {
         desc = "神官の下で修行し信仰を深める",
         levels = {
            _0 = {
               name = "信者",
               desc = "あなたは信仰に篤い[信仰+4]",
            },
            _1 = {
               name = "狂信者",
               desc = "あなたは猛烈な信者だ[信仰+8]",
            },
         },
      },
      _1 = {
         desc = "流れ星を見て幸運を手にする",
         levels = {
            _0 = {
               name = "幸運の持ち主",
               desc = "あなたは幸運の持ち主だ",
            },
            _1 = {
               name = "類稀な幸運",
               desc = "あなたは類稀な幸運の持ち主だ",
            },
            _2 = {
               name = "幸運の女神の寵愛",
               desc = "あなたは幸運の女神の寵愛を受けている",
            },
         },
      },
      _2 = {
         desc = "苦行を通じてHPを増やす",
         levels = {
            _0 = {
               name = "苦行者見習い",
               desc = "あなたは苦行者の見習いだ[HP+5%]",
            },
            _1 = {
               name = "苦行者",
               desc = "あなたは立派な苦行者だ[HP+10%]",
            },
            _2 = {
               name = "熟練の苦行者",
               desc = "あなたは熟練した苦行者だ[HP+15%]",
            },
            _3 = {
               name = "苦行の達人",
               desc = "あなたは苦行の達人だ[HP+20%]",
            },
            _4 = {
               name = "伝説的苦行者",
               desc = "あなたは伝説的名苦行者だ[HP+25%]",
            },
         },
      },
      _11 = {
         desc = "遺伝子組み換えを行いMPを増やす",
         levels = {
            _0 = {
               name = "魔力の遺伝子",
               desc = "あなたは魔力の遺伝子を持っている[MP+5%]",
            },
            _1 = {
               name = "魔力の細胞",
               desc = "あなたは魔力の細胞を持っている[MP+10%]",
            },
            _2 = {
               name = "魔力の血液",
               desc = "あなたには魔力の血液が流れている[MP+15%]",
            },
            _3 = {
               name = "魔力の肉体",
               desc = "あなたの肉体は魔力を帯びている[MP+20%]",
            },
            _4 = {
               name = "魔力の支配",
               desc = "あなたは魔力を支配している[MP+25%]",
            },
         },
      },
      _6 = {
         desc = "周りを注意深く観察し、罠の発見を容易にする",
         levels = {
            _0 = {
               name = "罠への注意",
               desc = "あなたは罠に注意している[探知+3]",
            },
            _1 = {
               name = "罠への警戒",
               desc = "あなたは罠に警戒している[探知+6]",
            },
         },
      },
      _4 = {
         desc = "猫を追いかけて速くなる",
         levels = {
            _0 = {
               name = "俊足",
               desc = "あなたは速く走ることができる[速度+5]",
            },
            _1 = {
               name = "韋駄天",
               desc = "あなたは猫よりも速い[速度+10]",
            },
         },
      },
      _7 = {
         desc = "受身を会得しPVを上昇させる",
         levels = {
            _0 = {
               name = "石の守備",
               desc = "あなたの防御は石のように硬い[PV+5]",
            },
            _1 = {
               name = "鉄の守備",
               desc = "あなたの守備は鉄壁だ[PV+10]",
            },
            _2 = {
               name = "鋼の守備",
               desc = "あなたの防御は鋼のように固い[PV+15]",
            },
         },
      },
      _8 = {
         desc = "敵の動きを見極めDVを上昇させる",
         levels = {
            _0 = {
               name = "見極め",
               desc = "あなたは見切れる[DV+4]",
            },
            _1 = {
               name = "見極めの熟練者",
               desc = "あなたはかなり見切れる[DV+8]",
            },
            _2 = {
               name = "見極めの達人",
               desc = "あなたの見切りは伝説的だ[DV+12]",
            },
         },
      },
      _10 = {
         desc = "回避の技術に磨きをかける",
         levels = {
            _0 = {
               name = "回避の修練者",
               desc = "あなたは回避に長けている[回避+2]",
            },
            _1 = {
               name = "回避の熟練者",
               desc = "あなたは華麗に回避する[回避+4]",
            },
            _2 = {
               name = "回避の達人",
               desc = "あなたは回避の達人だ[回避+6]",
            },
         },
      },


      -- ######### Mutation/Race traits ##########

      _41 = {
         positive = {
            name = "カンニバリズム",
            gain = "あなたは人肉の味の虜になった。",
            levels = {
               _0 = "あなたは人肉を食べることに抵抗がない",
            },
         },
         negative = {
            gain = "あなたは人肉の味に飽きた。",
         },
      },
      _25 = {
         positive = {
            name = "鉄の皮膚",
            gain = "あなたの皮膚は硬くなった。",
            levels = {
               _0 = "あなたの皮膚は硬い[PV+3]",
               _1 = "あなたの皮膚はとても硬い[PV+6]",
               _2 = "あなたは鉄のような皮膚を持っている[PV+9]",
            },
         },
         negative = {
            name = "アルビノ",
            gain = "あなたの皮膚は薄くなった。",
            levels = {
               _0 = "あなたの皮膚は白い[PV-3]",
               _1 = "あなたの皮膚は脆い[PV-6]",
               _2 = "あなたの皮膚は崩れている[PV-9]",
            },
         },
      },
      _26 = {
         positive = {
            name = "しなやかな関節",
            gain = "あなたの関節はしなやかになった。",
            levels = {
               _0 = "あなたの関節はしなやかだ[器用+3]",
               _1 = "あなたの関節はとてもしなやかだ[器用+6]",
               _2 = "あなたの関節は驚くほどしなやかだ[器用+9]",
            },
         },
         negative = {
            name = "きしむ関節",
            gain = "あなたの関節は痛み出した。",
            levels = {
               _0 = "あなたの関節はきしむ[器用-3]",
               _1 = "あなたは関節痛に悩んでいる[器用-6]",
               _2 = "あなたはひどい関節痛を抱えている[器用-9]",
            },
         },
      },
      _27 = {
         positive = {
            name = "トロールの血",
            gain = "あなたの血液は緑っぽくなった。",
            levels = {
               _0 = "あなたの傷跡は再生する[自然治癒強化]",
               _1 = "あなたの傷は瞬く間にふさがる[自然治癒強化]",
            },
         },
         negative = {
            name = "貧血",
            gain = "あなたの血液は薄れた。",
            levels = {
               _0 = "あなたは血の気が少ない[自然治癒弱化]",
               _1 = "あなたの顔には血の気が全くない[自然治癒弱化]",
            },
         },
      },
      _28 = {
         positive = {
            name = "しなやかな脚",
            gain = "あなたの脚はしなやかになった。",
            levels = {
               _0 = "あなたの脚はしなやかだ[速度上昇]",
               _1 = "あなたの脚はとてもしなやかだ[速度上昇]",
               _2 = "あなたの脚は理想的な形をしている[速度上昇]",
            },
         },
         negative = {
            name = "ねじれた脚",
            gain = "あなたの脚はねじれた。",
            levels = {
               _0 = "あなたの脚はねじれている[速度下降]",
               _1 = "あなたの脚はとてもねじれている[速度下降]",
               _2 = "あなたの脚は折れている[速度下降]",
            },
         },
      },
      _29 = {
         positive = {
            name = "強い腕",
            gain = "あなたの腕の筋肉が増えた。",
            levels = {
               _0 = "あなたの腕はひきしまっている[筋力+3]",
               _1 = "あなたの腕は強力だ[筋力+6]",
               _2 = "あなたの腕は筋肉の塊だ[筋力+9]",
            },
         },
         negative = {
            name = "弱い腕",
            gain = "あなたの腕の贅肉が増えた。",
            levels = {
               _0 = "あなたの腕はたるんでいる[筋力-3]",
               _1 = "あなたの腕はとてもたるんでいる[筋力-6]",
               _2 = "あなたの腕には筋肉がない[筋力-9]",
            },
         },
      },
      _30 = {
         positive = {
            name = "美声",
            gain = "あなたの声はよく通る。",
            levels = {
               _0 = "あなたは美声を持っている[魅力+5]",
               _1 = "あなたの声は全てを魅了する[魅力+10]",
            },
         },
         negative = {
            name = "かれた声",
            gain = "あなたの声はかれた。",
            levels = {
               _0 = "あなたの声はかれている[魅力-5]",
               _1 = "あなたが喋ると皆逃げる[魅力-10]",
            },
         },
      },
      _31 = {
         positive = {
            name = "脳内コンピュータ",
            gain = "あなたの脳は機械化した。",
            levels = {
               _0 = "あなたの脳は機械化している[暗記+4]",
               _1 = "あなたの脳は完璧な機械だ[暗記+8]",
            },
         },
         negative = {
            name = "痴呆",
            gain = "あなたの脳は原始化した。",
            levels = {
               _0 = "あなたは少しぼけている[暗記-4]",
               _1 = "あなたは痴呆だ[暗記-8]",
            },
         },
      },
      _32 = {
         positive = {
            name = "魔法への耐性",
            gain = "あなたは魔法の耐性を得た。",
            levels = {
               _0 = "あなたは魔法に耐性がある[魔法耐性強化]",
            },
         },
         negative = {
            name = "魔法の弱点",
            gain = "あなたは魔法の耐性を失った。",
            levels = {
               _0 = "あなたは魔法に弱い[魔法耐性弱化]",
            },
         },
      },
      _33 = {
         positive = {
            name = "強い鼓膜",
            gain = "あなたの鼓膜は厚くなった。",
            levels = {
               _0 = "あなたの鼓膜は厚い[音耐性強化]",
            },
         },
         negative = {
            name = "弱い鼓膜",
            gain = "あなたの鼓膜は薄くなった。",
            levels = {
               _0 = "あなたの鼓膜は薄い[音耐性弱化]",
            },
         },
      },
      _34 = {
         positive = {
            name = "火炎耐性",
            gain = "あなたの血は滾りだした。",
            levels = {
               _0 = "あなたの血は滾っている[火炎耐性強化]",
            },
         },
         negative = {
            name = "火炎弱点",
            gain = "あなたの腕に鳥肌がたった。",
            levels = {
               _0 = "あなたの腕には鳥肌がたっている[火炎耐性弱化]",
            },
         },
      },
      _35 = {
         positive = {
            name = "冷気耐性",
            gain = "あなたの皮膚は冷たくなった。",
            levels = {
               _0 = "あなたの皮膚には霜が付いている[冷気耐性強化]",
            },
         },
         negative = {
            name = "冷気弱点",
            gain = "あなたは汗をかきはじめた。",
            levels = {
               _0 = "あなたの皮膚は寒さに弱い[冷気耐性弱化]",
            },
         },
      },
      _36 = {
         positive = {
            name = "電撃耐性",
            gain = "あなたは非電導体になった。",
            levels = {
               _0 = "あなたは非電導体だ[電撃耐性強化]",
            },
         },
         negative = {
            name = "電撃弱点",
            gain = "あなたの身体は電気を良く通す。",
            levels = {
               _0 = "あなたの身体は電気を良く通す[電撃耐性弱化]",
            },
         },
      },
      _37 = {
         positive = {
            name = "鷹の目",
            gain = "あなたの目は細くなった。",
            levels = {
               _0 = "あなたは猫の目をしている[感覚+5]",
               _1 = "あなたは鷹の目をしている[感覚+10]",
            },
         },
         negative = {
            name = "色弱",
            gain = "あなたの視力は低下した。",
            levels = {
               _0 = "あなたは色弱だ[感覚-5]",
               _1 = "あなたは片目がない[感覚-10]",
            },
         },
      },
      _150 = {
         positive = {
            levels = {
               _0 = "あなたは火炎に耐性がある",
               _1 = "あなたは火炎にかなりの耐性がある",
            },
         },
         negative = {
            levels = {
               _0 = "あなたは火炎に弱い",
               _1 = "あなたはかなり火炎に弱い",
            },
         },
      },
      _151 = {
         positive = {
            levels = {
               _0 = "あなたは冷気に耐性がある",
               _1 = "あなたは冷気にかなりの耐性がある",
            },
         },
         negative = {
            levels = {
               _0 = "あなたは冷気に弱い",
               _1 = "あなたはかなり冷気に弱い",
            },
         },
      },
      _152 = {
         positive = {
            levels = {
               _0 = "あなたは毒に耐性がある",
               _1 = "あなたは毒にかなりの耐性がある",
            },
         },
         negative = {
            levels = {
               _0 = "あなたは毒に弱い",
               _1 = "あなたはかなり毒に弱い",
            },
         },
      },
      _155 = {
         positive = {
            levels = {
               _0 = "あなたは暗黒に耐性がある",
               _1 = "あなたは暗黒にかなりの耐性がある",
            },
         },
         negative = {
            levels = {
               _0 = "あなたは暗黒に弱い",
               _1 = "あなたはかなり暗黒に弱い",
            },
         },
      },
      _156 = {
         positive = {
            levels = {
               _0 = "あなたはマナの反動を軽減できる",
            },
         },
      },
      _160 = {
         positive = {
            levels = {
               _0 = "あなたは高い耐性をもっている",
            },
         },
      },
      _161 = {
         positive = {
            levels = {
               _0 = "あなたは1s以上の物を装備できない[DV上昇]",
            },
         },
      },
      _162 = {
         positive = {
            levels = {
               _0 = "あなたは罪悪感を感じない[カルマ上限-20]",
            },
         },
      },
      _169 = {
         positive = {
            levels = {
               _0 = "あなたは良い心を持っている[カルマ上限+20]",
            },
         },
      },
      _163 = {
         positive = {
            levels = {
               _0 = "あなたの周りでは質の高いエンチャントが生成される",
            },
         },
      },
      _164 = {
         positive = {
            levels = {
               _0 = "あなたが受ける物理ダメージは軽減される",
            },
         },
      },
      _165 = {
         positive = {
            levels = {
               _0 = "あなたの元素魔法は強化されている",
            },
         },
      },
      _166 = {
         positive = {
            levels = {
               _0 = "あなたは周囲の狂気を緩和する",
            },
         },
      },
      _167 = {
         positive = {
            levels = {
               _0 = "あなたは萌える",
            },
         },
      },
      _157 = {
         positive = {
            levels = {
               _0 = "あなたは朦朧状態にならない",
            },
         },
      },
      _158 = {
         positive = {
            levels = {
               _0 = "あなたの食料の消化は遅い",
            },
         },
      },
      _159 = {
         positive = {
            levels = {
               _0 = "あなたはより多く採取できる",
            },
         },
      },
      _154 = {
         positive = {
            levels = {
               _0 = "あなたには追加の成長ボーナスが与えられる",
            },
         },
      },
      _153 = {
         positive = {
            levels = {
               _0 = "あなたは魔法に耐性がある",
               _1 = "あなたは魔法にかなりの耐性がある",
            },
         },
         negative = {
            levels = {
               _0 = "あなたは魔法に弱い",
               _1 = "あなたはかなり魔法に弱い",
            },
         },
      },
      _0 = {
         positive = {
            levels = {
               _0 = "あなたの肉体は刻々と変化する",
            },
         },
      },
      _168 = {
         positive = {
            levels = {
               _0 = "あなたのエーテル病の進行は遅い",
            },
         },
      },

      -- ######### Ether Disease traits ##########

      _201 = {
         positive = {
            gain = "あなたの周りの重力は軽減した。",
         },
         negative = {
            gain = "あなたは重力を発するようになった。",
            levels = {
               _0 = "あなたは重力を生み出している[重量+10%]",
               _1 = "あなたは大きな重力を生み出している[重量+20%]",
               _2 = "あなたはとてつもない重力を生み出している[重量+30%]",
            },
         },
      },
      _202 = {
         positive = {
            gain = "あなたの顔のただれは軽くなった。",
         },
         negative = {
            gain = "あなたの顔はただれた。",
            levels = {
               _0 = "あなたの顔はただれている[魅力{$1}]",
               _1 = "あなたの顔中に蕁麻疹が出ている[魅力[CHR{$1}]",
               _2 = "あなたの顔は崩れかけている[魅力[CHR{$1}]",
            },
         },
      },
      _203 = {
         positive = {
            gain = "あなたの足は元に戻った。",
         },
         negative = {
            gain = "あなたの足の裏は蹄に変形した。",
            levels = {
               _0 = "あなたの足の裏は蹄になっている[足装備不可 速度+{$1}]",
            },
         },
      },
      _204 = {
         positive = {
            gain = "あなたの目は減った。",
         },
         negative = {
            gain = "あなたの目は増殖した。",
            levels = {
               _0 = "あなたの目は4つある[感覚+{$1} 魅力{$2}]",
            },
         },
      },
      _205 = {
         positive = {
            gain = "あなたの背中から羽が消えた。",
         },
         negative = {
            gain = "あなたの背中に羽が生えた。",
            levels = {
               _0 = "あなたの背中には羽がある[背中装備不可 重量-20% 速度+{$1}]",
            },
         },
      },
      _206 = {
         positive = {
            gain = "あなたの首は細くなった。",
         },
         negative = {
            gain = "あなたの首は太くなった。",
            levels = {
               _0 = "あなたの首はもの凄く太い[首装備不可 魅力{$1} PV+{$2}]",
            },
         },
      },
      _207 = {
         positive = {
            gain = "あなたの心は落ち着いた。",
         },
         negative = {
            gain = "あなたは憎しみに支配された。",
            levels = {
               _0 = "あなたは殺戮に飢えている[DV{$1} ダメージ修正+{$2}]",
            },
         },
      },
      _208 = {
         positive = {
            gain = "あなたの頭は元に戻った。",
         },
         negative = {
            gain = "あなたの頭は巨大化した。",
            levels = {
               _0 = "あなたの頭は巨大化している[耐久{$1} 器用{$2} 習得+{$3} 意思+{$4}]",
            },
         },
      },
      _209 = {
         positive = {
            gain = "あなたの頭上から雨雲が消えた。",
         },
         negative = {
            gain = "あなたの頭上に雨雲が現れた。",
            levels = {
               _0 = "あなたは雨を呼ぶ[雨天確率上昇]",
            },
         },
      },
      _210 = {
         positive = {
            gain = "あなたのポーション中毒は消えた。",
         },
         negative = {
            gain = "あなたはポーション中毒になった。",
            levels = {
               _0 = "あなたはポーション中毒だ[定期的ポーション消費]",
            },
         },
      },
      _211 = {
         positive = {
            gain = "あなたは健康になった。",
         },
         negative = {
            gain = "あなたは衰弱した。",
            levels = {
               _0 = "あなたは衰弱している[HP-15% 筋力{$1}]",
            },
         },
      },
      _212 = {
         positive = {
            gain = "あなたは明晰になった。",
         },
         negative = {
            gain = "あなたはぼけた。",
            levels = {
               _0 = "あなたは痴呆になっている[MP-15% 魔力{$1}]",
            },
         },
      },
      _213 = {
         positive = {
            gain = "あなたの皮膚から甲殻が消えた。",
         },
         negative = {
            gain = "あなたの皮膚は甲殻で覆われた。",
            levels = {
               _0 = "あなたは重い甲殻で覆われている[PV+{$1} 速度{$2}]",
            },
         },
      },
      _214 = {
         positive = {
            gain = "あなたの周囲の空間は元通りになった。",
         },
         negative = {
            gain = "あなたの周囲の空間は捩れた。",
            levels = {
               _0 = "あなたの周囲の空間は捩れている[ランダムテレポート]",
            },
         },
      },
      _215 = {
         positive = {
            gain = "あなたのマナは元通りになった。",
         },
         negative = {
            gain = "あなたのマナは杖から魔力を抽出する。",
            levels = {
               _0 = "あなたは生きたマナバッテリーだ[杖から魔力抽出]",
            },
         },
      },
      _216 = {
         positive = {
            gain = "あなたの手は元通りになった。",
         },
         negative = {
            gain = "あなたの手から毒が滴り出した。",
            levels = {
               _0 = "あなたの手から毒が滴っている[ポーション毒化 毒耐性強化]",
            },
         },
      },

      -- ######### Other traits ##########

      incognito = "あなたは変装している",
      pregnant = "あなたは寄生されている",
      anorexia = "あなたは拒食症だ",
      body_is_complicated = "あなたは複雑な体をしている[速度-{$1}%]",
      ether_disease_grows = {
         fast = "あなたのエーテル病の進行は早い",
         slow = "あなたのエーテル病の進行は遅い",
      },
   },
}
