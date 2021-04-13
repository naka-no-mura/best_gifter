（Webpacker周りを修正するにあたり、記録を残しておくbranchとする）
# Best Gifter（wedding）

# サービス概要
身内や友人、職場の上司・部下・同僚が愛でたく結婚するが、結婚祝いのギフトが思いつかない人に  
ギフトを贈りたい相手との関係性から絞り、最適なギフトを考える手助けをしてくれるアプリです。

# 導入
近年、特に結婚する家族や友人には、ご祝儀に加え、結婚祝い・婚約祝いのギフトを贈ることが多くなってきている。

# 登場人物
身内や友人、職場の上司・部下・同僚へ結婚祝いのギフトを贈りたいが、良い案が思いつかない人。

# ユーザーが抱える課題
- 新郎新婦が貰って喜んでくれるギフトを贈りたいが、良い案が思いつかない。
- ご結婚される方との関係性別の、贈るギフト相場が分からない。
- 他の人と被らないようなギフトを贈りたいが、良い案が思いつかない。
- いくつか選択肢が思いついているが、一つに絞れない。
- あるサイトでギフトの相場やマナーを調べて、また別のサイトで商品を探すことになるため、手間がかかる。

# 解決方法
- 「ギフトを贈りたい相手との関係性」を選択すると、おすすめのカテゴリーと相場を提示する。
- カテゴリーからそのまま商品一覧へ遷移し、すぐに購入できる。
（楽天市場商品検索APIを利用し、具体的な商品をWebアプリ上に表示させる。商品パネルをクリックすると、楽天市場へ遷移する。）
- いくつかの案が既にあるが一つに絞れない場合、アンケート投稿機能により、Twitter上で投票を行える。
(TwitterAPIを利用しBest Gifterの公式アカウント上で投稿を行うため、匿名でアンケートが行える。)

# プロダクト
結婚祝いに贈るギフトを考える手助けをしてくれるWebアプリケーション。

# マーケット
結婚する身内や友人、職場の上司・部下・同僚がいる人。
特に、相場やギフトに慣れていない、第一次結婚ラッシュ渦にいる人。

# 使用技術
- Ruby 2.7.2
- Rails 6.0.3.4
- Vue 2.6.11

# 画面遷移図
https://xd.adobe.com/view/8b1a99cc-ba49-49b1-8ec4-1746bbd25ad7-de49/

# ER図
https://drive.google.com/file/d/1bTgWxJMa-G4l0CTDUi7WEk5j1Xw1iQYf/view?usp=sharing
