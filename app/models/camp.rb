class Camp < ActiveRecord::Base
  private
  @@fields = "id, name, description, pic_url, provider, homepage, price, year, season, category, start_date, end_date"

  def self.search(query)
    where_clause = sanitize_sql_array(["tsv @@ tsquery(?)", query.strip.gsub(/\+/, '&')])
    return where(where_clause).select(@@fields)
  end

  def self.get(id)
    return where('id = ?', id).select(@@fields)
  end
end
