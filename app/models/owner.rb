class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :shops, dependent: :destroy

  # constant
  REGISTRABLE_ATTRIBUTES = %i(owner_name owner_introduction owner_tel address biz_hour delivery support carrier)

  validates :owner_name, presence: { message: I18n.t(:owner_name_blank_error, scope: [:message, :owner]) }
  validates :owner_introduction, presence: { message: I18n.t(:owner_introduction_blank_error, scope: [:message, :owner]) }
  validates :owner_tel, presence: { message: I18n.t(:owner_tel_blank_error, scope: [:message, :owner]) }
  validates :address, presence: { message: I18n.t(:address_blank_error, scope: [:message, :owner]) }
  validates :biz_hour, presence: { message: I18n.t(:biz_hour_blank_error, scope: [:message, :owner]) }
  validates :delivery, presence: { message: I18n.t(:delivery_blank_error, scope: [:message, :owner]) }
  validates :support, presence: { message: I18n.t(:support_blank_error, scope: [:message, :owner]) }
  validates :carrier, presence: { message: I18n.t(:carrier_blank_error, scope: [:message, :owner]) }

  def rss_url
    uri = URI.parse(self.blog)
    rss_url = ""
    if uri.host.include?("ameblo.jp") # アメブロ
      rss_url = "http://rssblog.ameba.jp" + uri.path + "/rss20.xml"
    elsif uri.host.include?("fc2.com") # FC2ブログ
      rss_url = self.blog + "/?xml"
    elsif uri.host.include?("blog.jp") # ライブドア
      rss_url = self.blog + "/atom.xml"
    elsif uri.host.include?("hatenablog.com") # はてなブログ
      rss_url = self.blog + "/rss"
    elsif uri.host.include?("seesaa.jp") # シーサーブログ
      rss_url = self.blog + "/index.rdf"
    elsif uri.host.include?("exblog.jp") # エキサイトブログ
      rss_url = self.blog + "/atom.xml"
    else      
      rss_url = get_alternate_href(self.blog)
    end         
  end

  private
    def get_alternate_href(url)
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      doc = Nokogiri::HTML.parse(html, nil, charset)
      rss_url = doc.xpath('/html/head/link[@rel="alternate" and @type="application/rss+xml"]').first.attributes["href"].value
    end
end
