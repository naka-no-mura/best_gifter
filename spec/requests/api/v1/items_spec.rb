require 'rails_helper'

RSpec.describe "Items", type: :request, js: true  do
  let!(:user) { create(:user) }
  let!(:item) { create(:item) }

  before do 
    login_as(user)
    visit '/items'
  end

  describe '検索機能', js: true  do
    context '全ての入力が正常なとき', js: true  do
      it '検索が成功する', js: true  do
        fill_in 'search-item', with: 'タオル'
        fill_in 'search-min', with: '3000'
        fill_in 'search-max', with: '5000'
        find('#serch-btn').click
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+%E3%82%BF%E3%82%AA%E3%83%AB&genreId=&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end
    end

    context '価格下限が価格上限よりも大きい時', js: true  do
      it '検索が失敗するので、「検索条件をリセットする」をクリックするとデフォルト検索ができる', js: true  do
        fill_in 'search-item', with: 'タオル'
        fill_in 'search-min', with: '5000'
        fill_in 'search-max', with: '3000'
        find('#serch-btn').click
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+%E3%82%BF%E3%82%AA%E3%83%AB&genreId=&minPrice=5000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(page).to have_content('価格下限は、価格上限より小さい値で検索してください。')
        click_on('検索条件をリセットする')
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        expect(response.status).to eq(200)
      end
    end

    context '検索フォームを空欄で検索した場合', js: true  do
      it 'デフォルト検索が行われる', js: true  do
        fill_in 'search-item', with: ''
        fill_in 'search-min', with: ''
        fill_in 'search-max', with: ''
        find('#serch-btn').click
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        expect(response.status).to eq(200)
        expect(page).to have_content('結婚（デフォルト検索）')
      end
    end

    describe '検索結果の並び替え', js: true  do
      context 'レビュー件数順', js: true  do
        it '検索が成功する', js: true  do
          select 'レビュー件数順', from: '並び替え'
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-reviewCount&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context 'レビュー評価順', js: true  do
        it '検索が成功する', js: true  do
          select 'レビュー評価順', from: '並び替え'
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-reviewAverage&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '価格が高い順', js: true  do
        it '検索が成功する', js: true  do
          select '価格が高い順', from: '並び替え'
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-itemPrice&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '価格が安い順', js: true  do
        it '検索が成功する', js: true  do
          select '価格が安い順', from: '並び替え'
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=+itemPrice&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '新着順', js: true  do
        it '検索が成功する', js: true  do
          select '新着順', from: '並び替え'
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=+updateTimestamp&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'ページネーション', js: true  do
      context '最初のページに戻る', js: true  do
        it 'ページ遷移が成功する', js: true  do
          first('#pg-first').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '1ページ前に戻る', js: true  do
        it 'ページ遷移が成功する', js: true  do
          first('#pg-number').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
          first('#pg-previous').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context 'あるページに遷移する', js: true  do
        it 'ページ遷移が成功する', js: true  do
          first('#pg-number').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
        end
      end

      context '1ページ次に進む', js: true  do
        it 'ページ遷移が成功する', js: true  do
          first('#pg-next').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
        end
      end

      context '最後のページに進む', js: true  do
        it 'ページ遷移が成功する', js: true  do
          first('#pg-last').click
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=100'
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
