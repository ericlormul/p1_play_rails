class AddIndexAndTriggerOnTsv < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON camps FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(tsv, 'pg_catalog.english', name, description, year, season, category);
    SQL

    execute <<-SQL
      CREATE INDEX tsv_idx ON camps USING gin(tsv);
    SQL
  end
end
