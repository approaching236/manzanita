class Resource < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :votes

  validates_presence_of :subject_id
  validate :uri_is_valid

  def uri
    uri = read_attribute(:uri)
    return uri if uri.nil?

    if(uri.match(/^http:\/\//))
      uri
    else
      "http://" + uri
    end
  end

  def upvote_count
    @upvote_count ||= votes.count(:conditions => { :up => true })
  end

  def downvote_count
    @downvote_count ||= votes.count(:conditions => { :up => false })
  end

  def netvote_count
    upvote_count - downvote_count
  end

  def total_count
    upvote_count + downvote_count
  end

  def percent_upvote
    upvote_count.to_f / total_count * 100
  end

  private
    def uri_is_valid
      errors.add(:uri, " cannot contain spaces") if uri && uri.include?(" ")
    end

end
