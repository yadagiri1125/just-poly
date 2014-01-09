class Editorial < ActiveRecord::Base
  attr_accessible :content, :title, :comments, :comments_attributes
  has_many :comments, :as => :commentable, dependent: :destroy
  accepts_nested_attributes_for :comments,
                                reject_if:lambda { |attrs|
                                  attrs.all? { |key, value| value.blank? }
                                },
                                allow_destroy:true
  scope :list1, where(:id => 1..5)
  scope :list2, where(:id => 6..10)
  scope :list3, where(:id => 11..15)
  default_scope where(:id => 1..5)

  def with_blank_comment
    comments.build
    self
  end

  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end


end
