class Scraping

  def self.product_urls

  end

  def self.product_name
    
  end

  def self.image_url

    def scraping_image(links)
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows IE 7'
      # 取得ぺージの指定(認証画面にまず飛ぶ)
      page = agent.get(links)
      next_page = page.link_with(:text => 'は　い').click      # 認証画面で「はい」をクリック
      current_page = agent.get(links)     # リンク取得ぺージの指定
      image_url = current_page.at('dt img').get_attribute('src')     # リンクの取得元を指定
      return 'http://www.gcdental.co.jp' + image_url
    end

      links = []      # 個別ページのリンクを保存する配列
      agent = Mechanize.new
      agent.user_agent_alias = 'Windows IE 7'
      url = 'http://www.gcdental.co.jp/sys/data/category/20/'      # 取得ぺージの指定(認証画面にまず飛ぶ)
      page = agent.get(url)
      next_page = page.link_with(:text => 'は　い').click      # 認証画面で「はい」をクリック

      current_page = agent.get("http://www.gcdental.co.jp/sys/data/category/20/")     # リンク取得ぺージの指定
      elements = current_page.search('h3 a')     # リンクの取得元を指定
      elements.each do |ele|
         links << ele.get_attribute('href')    # 画像取得ページへのリンクを取得
        end

      links.each do |link|     # 取得したリンクが相対パスなのでURL追加とメソッドの呼び出し
          puts scraping_image('http://www.gcdental.co.jp' + link)
        end

  end

end