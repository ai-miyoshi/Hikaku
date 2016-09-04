class Scraping
  require 'mechanize'

    def self.morita_box
      products = []
      agent = Mechanize.new
      links = 'http://www.dental-plaza.com/product/kikai.html'
      page = agent.get(links)

      # 製品の塊(boxlistのhtml)を取ってきてプロダクトの配列にしまう。
      boxes = page.search(".boxlist")
        # boxes = page.at(".boxlist")
        # puts boxes
      boxes.each do |box|
        products << box
      end

      # 配列から１づつ取り出してscraping_detailメソッドを実施
      boxes.each do |box|
        scraping_detail(box)
      end
    end

    def self.scraping_detail(box)
        # 製品名
        product_name = box.at('.p_name').inner_text
        # 製品詳細ページ
        product_url = box.at('.thum a').get_attribute('href')
        # 説明文
        info = box.at('.right .txt').inner_text
        # 会社番号
        corporation_id = 2

      # puts product_name
      # puts product_url
      # puts info
      # puts corporation_id

      # テーブルにデータの保存
      product = Product.where(product_name: product_name, product_url: product_url, info: info, corporation_id: corporation_id).first_or_initialize
      product.save
    end
end

