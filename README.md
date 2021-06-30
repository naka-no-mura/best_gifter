# 💐Best Gifter Wedding💐  
### べストギフターウェディング
  
### 🌐 https://www.best-gifter.work  


⭐️ ユニークユーザー：276人  
⭐️ 累計：1561PV  
（2021年6月30日）
  
![top_image_pink](https://user-images.githubusercontent.com/67740798/116098645-3366dc00-a6e6-11eb-82c8-eb232d002091.JPG)

## Qiita記事
[【個人開発】新郎新婦へ最高の結婚祝いギフトを選べるサービス『Best Gifter』をリリースしました！（Rails×Vue）](https://qiita.com/_naka_no_mura_/items/ce01f088f73291c83783)

⭐️LGTM：41  
（2021年6月21日）  
  

## サービス概要

**新郎新婦へ、最高のギフトを贈りたい。**  

第1次結婚ウェーブ渦中（20代半ば）の方が  
結婚祝いのギフトを選ぶときに  
「なにを？」「いくらで？」を明確にし、「第三者目線」でギフトを選べるサービスです。

## サービスを作った背景
24歳になり、身の回りで結婚する友人が出始めました。巷では20代半ばを「第1次結婚ウェーブ」というようです。  
この時、結婚祝いのギフトを贈ること自体が初めてであったため、「なにを？」「いくらで？」選べばいいのか非常に迷いました。  
また、「その人物像に対して、本当にこれが適しているのか？」という状態に陥ったためです。  

Best Gifterで「第１次結婚ウェーブ渦中」の皆さんが、新郎新婦に最高なギフトを贈ることで、  
皆んながハッピーになれることを祈っています。

## 登場人物 / マーケット
第1次結婚ウェーブ渦中（20代半ば）の方

## ユーザーが抱える課題
結婚祝いのギフトを選ぶときに、相手との関係性によって
- どんなジャンルが適しているのか分からない
- いくらくらいが常識の範囲内なのか分からない

いくつか自分で選んでみたものの
- 最後１つに絞れない

## 解決方法
ギフトを贈りたい相手別に、ぱっと見で「なにを」「いくらで」選べば良いのかが分かり、  
「第三者目線」でギフトを選べるようにする。

- 結婚祝いに適した商品検索ができる
- アンケートにより第三者目線で厳選ができる


## 使用技術

### バックエンド#
- Ruby 2.7.2
- Rails 6.0.3.6
- RSpec 3.10.1
- 楽天商品検索API（外部API）

### 機能における主要なGem
- counter_culture 2.7.0（投票数カウント）
- sorcery 0.16.0（ログイン）
- JWT 2.2.2（トークン発行）
- rakuten_web_service 1.13.0（楽天商品検索API）
- httpclient 2.8.3（ネットワーク通信）
- capistrano 3.16.0（自動デプロイ）
- unicorn 6.0.0（アプケーションサーバ）


### フロントエンド
- Vue 2.6.12
- vuex 3.6.0
- Vue Router 3.4.9
- axios 0.21.1
- vee-validate 3.4.5
- vue-poll 0.1.8（アンケートの投稿/投票）


### CSSフレームワーク
- Buefy 0.9.4
- Bulma 0.9.1

## ER図
<img width="754" alt="スクリーンショット 2021-04-25 20 31 28" src="https://user-images.githubusercontent.com/67740798/116011553-9746c180-a660-11eb-8d87-caafefbbf9e5.png">

## インフラストラクチャー
- CircleCI
- Nginx 1.12.2
- unicorn 6.0.0
- AWS
  - VPC
  - EC2
  - Amazon Linux 2
  - RDS
  - MySQL 5.7
  - ALB
  - Route53
  - ACM

<img width="782" alt="スクリーンショット 2021-06-21 23 27 31" src="https://user-images.githubusercontent.com/67740798/122778828-482bae80-d2e8-11eb-9db3-f9b216afdaf7.png">


## 関連記事

⭐️[【editch/YouTube】ポートフォリオコンテストで入賞/Live映像](https://www.youtube.com/watch?v=nQOdoZ-xV1Q&t=1755s)  
⭐️[【editch vol.3】ポートフォリオコンテストで発表するまでの道のりと参加後の感想](https://note.com/_naka_no_mura/n/n67f74712e51f)  
