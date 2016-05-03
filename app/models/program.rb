class Program < ActiveRecord::Base
  has_many :areas
  has_many :reviews
  has_many :photos
  has_many :sessions
  belongs_to :provider

  private
  @@fields = "id, name, summary, description, provider_id, website, category, age_start, age_end, refund_policy, syllabus, application_detail, contact_info"

  def self.search(query)
    where_clause = sanitize_sql_array(["tsv @@ tsquery(?)", query.strip.gsub(/\+/, '&')])
    return select(@@fields).where(where_clause)
  end

  def self.get(id)
    return select(@@fields).find(id)
  end

  def self.get_by_category(category)
    return select(@@fields).where("category = ?", category).order('created_at DESC')
  end
end
