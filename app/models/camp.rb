class Camp < ActiveRecord::Base
  private
  @@fields = "id, name, description, pic_url, provider, homepage, price, year, season, category, start_date, end_date"

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
