class Asset < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :file
  
  validates_attachment :file, :content_type => { :content_type => ['image/png', 'image/gif', 'image/jpg', 'image/jpeg'] },
    :size => { :in => 0..5.megabytes }
    
  after_validation :join_file_errors
  
  has_attached_file :file,
    :styles => { :medium => "612x612>", :thumb => "100x100#" },
    :convert_options => { 
      :medium => "-background black -gravity center -extent 612x612"
    },
    :default_style => :medium,
    :storage => {
      'development' => :filesystem,
      'test' => :filesystem,
      'staging' => :s3,
      'production' => :s3
    }[Rails.env.to_s],
    :s3_credentials => {
      :access_key_id => "S3_KEY",
      :secret_access_key => "S3_SECRET"
    },
    :url => {
      'development' => "#{Settings.site.uri}/system/:attachment/:id_partition/:style.:extension",
      'staging' => "s3_domain_url",
      'production' => "s3_domain_url"
    }[Rails.env.to_s],
    :default_url => "http://s3.amazonaws.com/jedi-#{Rails.env.to_s}/jedi-images/no_photo_:style.jpg",
    :path => {
      'development' => ":rails_root/public/system/:attachment/:id_partition/:style.:extension",
      'test' => ":rails_root/public/system/test/:attachment/:id_partition/:style.:extension",
      'staging' => "/:attachment/:id_partition/:style.:extension",
      'production' => "/:attachment/:id_partition/:style.:extension"
    }[Rails.env.to_s],
    :bucket => "jedi-#{Rails.env.to_s}",
    :use_timestamp => false
    
  def medium
    file.url(:medium)
  end
  
  def join_file_errors
    errors.messages[:file] = errors[:file] +
                            errors[:file_file_name] +
                            errors[:file_file_size] +
                            errors[:file_content_type]
  end
    
end
