class Camp < ActiveRecord::Base
  def self.search(query)
    where_clause = sanitize_sql_array(["tsv @@ tsquery(?)", query.strip.gsub(/\+/, '&')])
    return where(where_clause)
  end
end
