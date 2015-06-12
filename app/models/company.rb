class Company < ActiveRecord::Base

  DATA_RATING = {
    A: 100,
    B: 80,
    C: 60,
    D: 40,
    E: 20,
    F: 0
  }

  before_validation :ensure_format_of_urls
  validates_presence_of :domain, :rating, :name
  validates :rating, inclusion: { in: DATA_RATING.values }
  validate :domain_is_valid
  validate :policy_url_is_valid
  after_save :get_meta



  def data_rating
    DATA_RATING.invert[self.rating].to_s
  end


  def ensure_format_of_urls
    # unless the urls are empty or already formatted fully, format them
    unless self.domain.blank? || self.domain.include?("http://")
      self.domain = "http://#{self.domain}"
    end
    unless self.policy_url.blank? || self.policy_url.include?("http://")
      self.policy_url = "http://#{self.policy_url}"
    end
  end


  def get_meta
    page = MetaInspector.new(self.domain)
    self.description = page.description || "" if self.description.blank?
    self.logo_url  = page.images.favicon if self.logo_url.blank?
  end


  # validations

  def domain_is_valid
    if self.domain.blank? || URI(self.domain).hostname.nil?
      errors.add(:domain, 'URL must be valid')
    end
  end

  def policy_url_is_valid
    if self.policy_url.present? && URI(self.policy_url).hostname.nil?
      errors.add(:policy_url, 'URL must be valid')
    end
  end

end
