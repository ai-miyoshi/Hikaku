class Scraping
    require 'mechanize'

    def self.product_info
      links = []      # 個別ページのリンクを保存する配列
      # 取得ぺージの指定
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows IE 7'
      # 認証画面に飛ぶので，認証画面で「はい」をクリック
      url = 'http://www.gcdental.co.jp/sys/data/category/20/'
      page = agent.get(url)
      next_page = page.link_with(:text => 'は　い').click
      # 再度取得ぺージの指定と個別ページのリンクの取得
      current_page = agent.get(url)     # リンク取得ぺージの指定
      product_url = current_page.search('h3 a')     # リンクの取得元を指定
      product_url.each do |ele|
         links << ele.get_attribute('href')    # 個別ページをlink配列に代入
      end
      # 取得したリンクが相対パスなのでURL追加とメソッドの呼び出し
      links.each do |link|
          puts scraping_detail('http://www.gcdental.co.jp' + link)
        end
    end

    def self.scraping_detail(links)
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows IE 7'
      # 個別ぺージの指定と認証画面で「はい」をクリック
      page = agent.get(links)
      next_page = page.link_with(:text => 'は　い').click
      current_page = agent.get(links)     # リンク取得ぺージの指定

      # データの取得
      image_url = 'http://www.gcdental.co.jp' +current_page.at('dt img').get_attribute('src') if current_page.at('dt img')
      product_url = 'http://www.gcdental.co.jp' +current_page.at('h3 a').get_attribute('href') if current_page.at('h3 a')
      product_name = current_page.at('h3 a').inner_text if current_page.at('h3 a')
      info = current_page.at('dd h4').inner_text if current_page.at('dd h4')
      corporation_id == 1

      # テーブルにデータの保存
      product = Product.where(product_name: product_name, image_url: image_url, product_url: product_url, info: info, corporation_id: corporation_id).first_or_initialize
      product.save
    end


end