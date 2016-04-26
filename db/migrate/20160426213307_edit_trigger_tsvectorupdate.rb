class EditTriggerTsvectorupdate < ActiveRecord::Migration
  def change
    execute <<-SQL
      DROP TRIGGER tsvectorupdate ON camps;
    SQL

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON camps FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(tsv, 'pg_catalog.english', name, description, year, season, category);
    SQL

  end
end
