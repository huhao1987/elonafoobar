ELONA.i18n:add {
   casino = {
      talk_to_dealer = "ディーラーに話しかけた。",
      can_acquire = "幾つかの戦利品がある。",

      you_get = "{$2}を{$1}個手に入れた！(所持数:{$3}個)",
      you_lose = "{$2}を{$1}個失った(残り:{$3}個)",
      chips_left = "カジノチップ残り {$1}枚",

      window = {
         title = "カジノ《フォーチュンクッキー》",
         desc = {
            _0 = "カジノ《フォーチュンクッキー》へようこそ。",
            _1 = "チップマテリアルと引き換えにゲームをすることができます。",
            _2 = "ごゆっくりお楽しみ下さい。",
         },
         first = {
            _0 = "お客様は初めてのご利用のようですね。",
            _1 = "当店からチップマテリアルを10枚進呈します。",
         },

         choices = {
            blackjack = "ブラックジャック",
            leave = "店を出る",
         },
      },

      blackjack = {
         desc = {
            _0 = "ブラックジャックは、カードの合計を21に近づけるゲームです。",
            _1 = "J,Q,Kは10に、Aは1または11に数えられます。21を越えると負けです。",
            _2 = "では、賭けるチップを宣言してください。",
            _3 = "チップが多いほど、景品の質があがります。",
         },

         no_chips = "お客様はチップをもっていません。",

         choices = {
            bet = "{$1}枚賭ける",
            quit = "やめる",
         },

         game = {
            dealer = "　親",
            you = "あなた",

            your_hand = "あなたの合計は{$1}です。",
            dealers_hand = "親の合計は{$1}です。",

            result = {
               draw = "勝負は引き分けです。",
               win = "おめでとうございます。あなたの勝ちです。",
               lose = "あなたの負けです。",

               choices = {
                  next_round = "次の勝負へ",
                  leave = "戻る",
               },
            },

            bets = "賭けチップ {$1}枚",
            wins = "現在{$1}連勝中",

            choices = {
               stay = "これに決める",
               hit = "もう一枚引く(運)",
               cheat = "イカサマ(器用{$1})",
            },

            bad_feeling = "このカードは悪い予感がする…",

            cheat = {
               dialog = "イカサマだ！",
               text = "イカサマが見つかってしまった…",
               response = "濡れ衣だ！",
            },

            total_wins = "おめでとうございます。あなたは{$1}連勝しました。",
            loot = "アイテム：{itemname($1)}を戦利品に加えた！",
            leave = "戻る",
         },
      },
   },
}
